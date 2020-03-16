import 'package:flutter/cupertino.dart';
import 'package:myreduxlogin/model/login_model.dart';
import 'package:myreduxlogin/model/transaction_columnlist.dart';
import 'package:myreduxlogin/model/transaction_list.dart';

class AppState{
 final LoginModel lgModel;
 final Map<String,String> tList;
 final ColumnList clList;

 AppState({ this.lgModel,this.tList,this.clList});
 factory AppState.initial(){
   return AppState(lgModel:LoginModel.initial(),tList: TransactionList.genList,clList:ColumnList.initial() );
 }
 AppState copyWith({LoginModel loginModel}){
   return AppState(lgModel: lgModel??this.lgModel);
 }
}