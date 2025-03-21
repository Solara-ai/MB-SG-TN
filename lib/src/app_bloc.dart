// class AppBloc extends BaseBloc<AppAction, AppEvent, AppState> {
//   final _dataExceptionNotifier = GetIt.I<DataExceptionNotifier>();
//   final _notificationService = GetIt.I<NotificationService>();

//   StreamSubscription? _dataExceptionSubscription;

//   AppBloc() : super(AppState()) {
//     _initialize();
//   }

//   Future<void> _initialize() async {
//     _dataExceptionSubscription = _dataExceptionNotifier.listenEvent(_handleDataExceptionActions);
//     await _notificationService.initialize();
//   }

//   void _handleDataExceptionActions(NetworkExceptions exception) {
//     switch (exception.errorCode) {
//       case NetworkErrorCode.REFRESH_TOKEN_INVALID:
//         addAction(AppSessionExpiredAction());
//       case NetworkErrorCode.USER_BANNED:
//         addAction(AppAccountBannedAction());
//       default:
//         addAction(AppNetworkErrorAction(data: exception));
//     }
//   }

//   @override
//   Future<void> close() {
//     _dataExceptionSubscription?.cancel();
//     return super.close();
//   }
// }

// //******************************************************************************
// // State
// //******************************************************************************

// class AppState {
//   AppState();

//   AppState copyWith() {
//     return this;
//   }
// }

// //******************************************************************************
// // Action
// //******************************************************************************

// sealed class AppAction {}

// class AppSessionExpiredAction extends AppAction {}

// class AppAccountBannedAction extends AppAction {}

// class AppNetworkErrorAction extends AppAction {
//   final NetworkExceptions data;

//   AppNetworkErrorAction({required this.data});
// }

// //******************************************************************************
// // Event
// //******************************************************************************

// sealed class AppEvent {}

// class AppShowLoadingEvent extends AppEvent {
//   final bool show;

//   AppShowLoadingEvent({required this.show});
// }
