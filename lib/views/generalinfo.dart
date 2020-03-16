import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/transaction_columnlist.dart';
import 'package:myreduxlogin/model/transaction_list.dart';
import 'package:redux/redux.dart';


class GenralInfo extends StatefulWidget {
  @override
  _GenralInfoState createState() => _GenralInfoState();
}

class _GenralInfoState extends State<GenralInfo> {
  String cValue;
  var clController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Map<String,String>>(
          converter: (store){
           cValue=store.state.clList.genColumn;
           return store.state.tList;
            },
          builder:(ctx,list)=> Scaffold(
        body:ListView(
          children:listControls(list),
        ) 
         // itemCount: list.length,
          //itemBuilder: (ctx,index){    
        
      ),
    );
  }
  List<Widget> listControls(Map<String,String> lsMap){
         List<Widget> lsWidget=[];
        for(var key in lsMap.keys){
          var val=lsMap[key];
         Widget widget=StoreConnector<AppState,VoidCallback>(
                    converter: (store)=>()=>store.dispatch(ColumnTextChangedAction(columnValue:ColumnList(genColumn:cValue ) )),                  
                    builder:(ctx,callback)=>genUiPrepare(callback,key,val)
                                   
            );
          lsWidget.add(widget);
        }
          return lsWidget;

  }
 Widget genUiPrepare(Function() callback,String key,String val){

          return  TextField(
                  controller: clController,
                  decoration: InputDecoration(                     
                    labelText: key,
                    hintText: cValue
                  ),
                  onChanged: (val){ 
                      cValue=val;
                      callback();                        
                  },
              );
  }
}