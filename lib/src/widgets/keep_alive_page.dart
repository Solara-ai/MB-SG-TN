import 'package:flutter/material.dart';
// được sử dụng để giữ lại trạng thái của các widget khi chuyển đổi trong các tab hoặc page view 
class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
