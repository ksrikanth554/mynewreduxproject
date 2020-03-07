import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/login_model.dart';

AppState appReducer(AppState state,dynamic action){

  if(action is LoginAction){
    return state.copyWith(
      loginModel: state.lgModel.copyWith(
        usernam: action.userName,
        password: action.password
      )
    );


  }
  return state;

}