import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/login_list_data.dart';
import 'package:myreduxlogin/model/login_model.dart';


class LoginView extends StatelessWidget {
  var userName=TextEditingController();
  var passWord=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          // body: StoreConnector<AppState,LoginModel>(
          // converter: (store)=>store.state.lgModel,
          // builder: (context,lv){
          //   return 
          body:Container(
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
                        controller: userName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                    Container(
                      color: Colors.grey,
                     
                      child: TextField(
                        controller: passWord,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password'
                        ),
                      ),
                    ),
                     SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                    Container(
                      
                       
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Container(
                          height:MediaQuery.of(context).size.height*0.06,
                            child: RaisedButton(

                              child: Text('SignUp',style:TextStyle(color:Colors.yellow,fontSize: 20),),
                              onPressed: (){

                              }
                              ),
                          )),
                          SizedBox(width:MediaQuery.of(context).size.width*0.02,),
                          Expanded(
                              child: StoreConnector<AppState,VoidCallback>(
                               converter:(store)=>store.dispatch(LoginAction(userName: userName.text,password:passWord.text )) ,
                               builder: (context,callBack)=>
                            Container(
                              height:MediaQuery.of(context).size.height*0.06,
                              //color: Colors.red,
                              child: RaisedButton(
                               // color: Colors.red,
                                child: Text('SignIn',style: TextStyle(color: Colors.yellow,fontSize: 20),),
                                onPressed: (){
                                  for(var lg in loginCredential.keys ){
                                    if(userName.text==lg && passWord.text==loginCredential[lg]){
                                      showDialog(context: context,
                                      builder: (ctx)=>AlertDialog(
                                        title: Text('Message'),
                                        content: Text('Success'),
                                        actions: <Widget>[
                                          FlatButton(onPressed:()=>Navigator.pop(context) , 
                                          child:Text('ok')
                                          ),
                                        ],

                                      ),
                                      );

                                    }
                                    else{
                                       showDialog(context: context,
                                      builder: (ctx)=>AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Fail'),
                                        actions: <Widget>[
                                          FlatButton(onPressed:()=>Navigator.pop(context) , 
                                          child:Text('ok')
                                          ),
                                        ],

                                      ),
                                      );
                                      

                                    }
                                  }
                                 // callBack();
                                }
                                ),
                          ),
                            )
                            ),
                        ],
                      ),
                    ),


                        ],
                      ) ,
                    ),
                  ),
                  
                ],
              ),
            ),
          
        
      );
    
  }
}
//typedef OnCallBakLoginAction=Function();