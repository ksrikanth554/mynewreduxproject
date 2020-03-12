import 'package:flutter/material.dart';
import '../views/generalinfo.dart';

class Transactions extends StatelessWidget {
  static const routeName='./transactions';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        
          child: Scaffold(
            backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor:Colors.purpleAccent,
          title: Text('Transactions'),
          bottom: TabBar(tabs:[
            Tab(text: 'Tab1',),
            Tab(text: 'Tab2',),
            Tab(text: 'Tab3',),
            Tab(text: 'Tab4',),
            Tab(text: 'Tab5',),
          ] ),
        ),
        
        body: TabBarView(
          
          children: <Widget>[
            GenralInfo(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Text('Page2'),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Text('Page3'),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Text('Page4'),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Text('Page5'),),
              ],
            )
          ],
        ),
        
      ), 
    );
  }
}