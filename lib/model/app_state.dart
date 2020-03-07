import 'package:flutter/cupertino.dart';
import 'package:myreduxlogin/model/login_model.dart';

class AppState{
 final LoginModel lgModel;

 AppState({@required this.lgModel});
 factory AppState.initial(){
   return AppState(lgModel:LoginModel.initial());
 }
 AppState copyWith({LoginModel loginModel}){
   return AppState(lgModel: lgModel??this.lgModel);
 }
}