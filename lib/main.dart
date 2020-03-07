import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/reducers/reducer.dart';
import 'package:myreduxlogin/views/login_view.dart';
import 'package:redux/redux.dart';

import 'model/app_state.dart';

void main(){
  Store<AppState> store=Store<AppState>(appReducer,initialState: AppState.initial());
  runApp(HomePage(store:store));
}

class HomePage extends StatelessWidget {
 final Store<AppState> store;
  HomePage({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: LoginView(),
        
      ),
    );
  }
}