import 'package:myreduxlogin/model/transaction_columnlist.dart';

class LoginAction{
 final String userName;
 final String password; 
  int statusCode;
 LoginAction({this.password,this.userName,this.statusCode});

}
class ColumnTextChangedAction{
  final ColumnList columnValue;
  ColumnTextChangedAction({this.columnValue});
}