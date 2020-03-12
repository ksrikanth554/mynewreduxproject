import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/transaction_list.dart';
import 'package:redux/redux.dart';


class GenralInfo extends StatefulWidget {
  @override
  _GenralInfoState createState() => _GenralInfoState();
}

class _GenralInfoState extends State<GenralInfo> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,List<String>>(
          converter: (store)=>store.state.tList,
          builder:(ctx,list)=> Scaffold(
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx,index){
            return TextField(

            );
          },
          ),
        
      ),
    );
  }
}