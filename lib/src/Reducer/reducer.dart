
import 'package:http/http.dart';
import 'package:tema6/src/actions/get_movies.dart';
import 'package:tema6/src/data/yts_api.dart';
import 'package:tema6/src/middleware/app_middleware.dart';
import 'package:tema6/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action){

  if(action is GetMoviesSuccessful){
    final AppStateBuilder builder = state.toBuilder();
    builder.movies.addAll(action.movies);
    return builder.build();
  }


  return state;

}