import 'package:redux/redux.dart';

import 'package:demo/models/app_state.dart';

// 记录日志的中间件
loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('logging:${new DateTime.now()}: $action');
  next(action);
}