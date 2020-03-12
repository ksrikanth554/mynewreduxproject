import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/login_list_data.dart';
import 'package:myreduxlogin/model/transaction_list.dart';
import '../model/login_model.dart';

AppState appReducer(AppState state,dynamic action){

  if(action is LoginAction){
    
    
          if(action.userName.isNotEmpty && action.password.isNotEmpty){

          for(var lg in loginCredential.keys ){
            if(action.userName==lg && action.password==loginCredential[lg]){
              action.statusCode=111;
            //  Navigator.pushNamed(context,Transactions.routeName);
              break;
            }
            
            }
          }
          if(action.statusCode!=111 ||(action.userName.isEmpty && action.password.isEmpty)){
              action.statusCode=420;
          }
          return AppState(
          lgModel: LoginModel(
            username: action.userName,
            password: action.password,
            statusCode: action.statusCode,

          ),
          tList: TransactionList.genList,
        );


    
  }
  return state;

}
