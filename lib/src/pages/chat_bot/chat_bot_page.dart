import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/chat_bot/chat_bot_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';

class ChatBotPage extends BasePage {
  const ChatBotPage({super.key});
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends BaseState<ChatBotPage> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late final ChatBotBloc _bloc;

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
    _scrollController.dispose();
  }

  void _setupBloc() {
    _bloc = ChatBotBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionSendMessageFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionSendMessageSuccess():
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        case ActionInitializeFaild():
          ToastUtils.showErrorToast(context, message: action.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<ChatBotBloc, PageState>(
        bloc: _bloc,
        builder: (context, state) => LoadingOverlay(
          isLoading: state.isShowloading,
          child: Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: R.color.white,
              centerTitle: false,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(R.drawables.img_chatbot_3),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(R.strings.chat_bot_ai,
                          style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(R.strings.online,
                          style: R.textStyle.inter_medium_12_500
                              .copyWith(color: R.color.colorSuccessBase))
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: R.color.bgChatbot,
            body: _buildBody(state),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(PageState state) {
    return Column(
      children: [
        state.historyMessage?.message == null
            ? Expanded(child: SizedBox())
            : Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.historyMessage?.message.length ?? 0,
                  itemBuilder: (context, index) {
                    final message = state.historyMessage!.message[index];
                    return Column(
                      crossAxisAlignment:
                          message.reply.isEmpty ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        if (message.text.isNotEmpty)
                          ListTile(
                            title: _buildMessage(message.text, true, false), // Tin nhắn user
                          ),
                        if (message.reply.isNotEmpty)
                          // tiếp tục ở đoạn này sẽ là so sánh dữ liệu , ví dụ nếu có chứa ngày tháng hoặc chứa text là bạn có muốn thêm lịch này vào k , thì nó sẽ xuất hiện ra được 1 cái đó chính là có nút add vào trong lịch , tại đây mình sẽ cần có thêm 1 biến bool show button add with calendar
                          message.reply.containsSlashOrPipe() ? 
                          ListTile(
                            leading: _buildImageChatbot(),
                            title: _buildMessage(message.reply, false, true), // Tin nhắn AI 
                          ) : 
                          ListTile(
                             leading: _buildImageChatbot(),
                            title: _buildMessage(message.reply, false, false),
                          )
                      ],
                    );
                  },
                ),
              ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Expanded(child: _buildInputUser()),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInputUser() {
    return TextFormField(
      controller: _textController,
      style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
      focusNode: _focusNode,
      cursorColor: R.color.black,
      maxLines: 6,
      minLines: 1,
      decoration: InputDecoration(
        hintText: R.strings.write_your_message,
        hintStyle:
            R.textStyle.inter_regular_16_400.copyWith(color: R.color.textDescriptionFeddBack),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Giảm chiều cao
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0x26000000)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0x26000000)),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (!_textController.text.isNullOrEmpty()) {
      _bloc.add(EventUserSendMessage(message: _textController.text));
      _textController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom(); // Chỉ cuộn khi giao diện đã cập nhật
      });
    }
  }

  Widget _buildImageChatbot() {
    return CircleAvatar(
      radius: 16,
      backgroundImage: AssetImage(R.drawables.img_chatbot_3),
    );
  }

  Widget _buildMessage(String text, bool isUresMessage, bool showAddButton) {
    return Align(
      alignment: isUresMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isUresMessage ? R.color.bgMessageUser : R.color.white,
          border: Border.all(color: isUresMessage ? R.color.bgMessageUser : R.color.white),
          borderRadius: isUresMessage
              ? BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12))
              : BorderRadius.circular(12),
        ),
        child: showAddButton == true
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      text,
                      style: R.textStyle.inter_regular_16_400
                          .copyWith(color: isUresMessage ? R.color.white : R.color.text),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 1 ,
                    color: R.color.colorBorder,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('add to calendar click');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      height: 30,
                      child: Text(R.strings.add_tocalendar , style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.backGroundGoalComplete),),
                    ),
                  )
                ],
              )
            : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  text,
                  style: R.textStyle.inter_regular_16_400
                      .copyWith(color: isUresMessage ? R.color.white : R.color.text),
                ),
            ),
      ),
    );
  }

  Widget _buildLoadingAiReply() {
    return ListTile(
      leading: _buildImageChatbot(),
      title: Text(
        R.strings.dot,
        style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.textDescriptionFeddBack),
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
