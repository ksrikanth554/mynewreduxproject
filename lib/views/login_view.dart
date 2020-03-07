import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/login_model.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: StoreConnector<AppState,LoginModel>(
          converter: (store)=>store.state.lgModel,
          builder: (context,lv){
            return Container(
               margin: EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.10,
                       right: MediaQuery.of(context).size.width*0.10
                        
                     ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 10,
                     child: Container(
                      child:Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            // radius: 50.0,
                            maxRadius: 100,
                             child: ClipRRect(
                               
                               borderRadius: BorderRadius.circular(100),
                                child: Container(
                               height: 200,
                                width: 200,
                            child: Image.asset('assets/images/wings_logo.png'),
                            ),
                              ),
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                          Container(
                      color: Colors.grey,
                    
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                    Container(
                      color: Colors.grey,
                     
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ),
                     SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                    Container(
                      
                       
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Container(
                            color: Colors.red,
                            child: RaisedButton(
                              disabledColor: Colors.red,
                              child: Text('SignUp',style:TextStyle(color:Colors.yellow,fontSize: 20),),
                              onPressed: null
                              ),
                          )),
                          SizedBox(width:MediaQuery.of(context).size.width*0.02,),
                          Expanded(
                            child: StoreConnector<AppState,VoidCallback>(
                              converter:(store)=>store.dispatch(LoginAction(userName: '',password: '' )) ,
                              builder:(context,voidCallback)=> Container(
                              color: Colors.red,
                              child: RaisedButton(
                                disabledColor: Colors.red,
                                child: Text('SignIn',style: TextStyle(color: Colors.yellow,fontSize: 20),),
                                onPressed: (){
                                  voidCallback();
                                }
                                ),
                          ),
                            )),
                        ],
                      ),
                    ),


                        ],
                      ) ,
                    ),
                  ),
                  
                ],
              ),
            );
          },
        
      ),
    );
  }
}
typedef OnCallBakLoginAction=Function();