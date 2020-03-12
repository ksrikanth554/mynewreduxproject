import 'package:flutter/cupertino.dart';
import 'package:myreduxlogin/model/login_model.dart';
import 'package:myreduxlogin/model/transaction_list.dart';

class AppState{
 final LoginModel lgModel;
 final List<String> tList;

 AppState({@required this.lgModel,this.tList});
 factory AppState.initial(){
   return AppState(lgModel:LoginModel.initial(),tList: TransactionList.genList);
 }
 AppState copyWith({LoginModel loginModel}){
   return AppState(lgModel: lgModel??this.lgModel);
 }
}