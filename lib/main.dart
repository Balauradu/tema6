import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:tema6/src/actions/get_movies.dart';
import 'package:tema6/src/data/yts_api.dart';
import 'package:tema6/src/middleware/app_middleware.dart';
import 'package:tema6/src/models/app_state.dart';
import 'package:tema6/src/presentation/home_page.dart';
import 'package:tema6/src/Reducer/reducer.dart';

void main() {
  final Client client = Client();
  final YtsApi ytsApi = YtsApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(ytsApi: ytsApi);

  final AppState initialState = AppState();
  // ignore: always_specify_types
  final Store<AppState> store = Store(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(GetMovies());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
