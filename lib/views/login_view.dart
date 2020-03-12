import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myreduxlogin/actions/login_actions.dart';
import 'package:myreduxlogin/model/app_state.dart';
import 'package:myreduxlogin/model/login_list_data.dart';
import 'package:myreduxlogin/model/login_model.dart';
import 'package:myreduxlogin/views/transactions.dart';


class LoginView extends StatefulWidget {
  final LoginModel modellg;
  LoginView({Key key,this.modellg}):super(key:key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int statusCode;
  var userName=TextEditingController();

  var passWord=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         //  resizeToAvoidBottomInset: false,
          // body: StoreConnector<AppState,LoginModel>(
          // converter: (store)=>store.state.lgModel,
          // builder: (context,lv){
          //   return 
          // body:SingleChildScrollView(
            
          //             child:
          body: StoreConnector<AppState,int>(
                  converter: (store){
                   statusCode= store.state.lgModel.statusCode;
                   return store.state.lgModel.statusCode;
                  },
                      builder:(ctx,logBool)=> Container(
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
                                maxRadius: MediaQuery.of(context).size.height*0.13,
                                 child: ClipRRect(
                                   
                                   borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                   height: MediaQuery.of(context).size.height*0.5,
                                    width: MediaQuery.of(context).size.width*0.5,
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
                            // onChanged: (val){
                            //   userName.text=val;

                            // },
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
                            // onChanged: (val){
                            //   passWord.text=val;
                            // },
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
                                  child: StoreConnector<AppState,OnCallBakLoginAction>(
                                   converter:(store){
                                     
                                    return (model)=>store.dispatch(LoginAction(userName:model.username,password:model.password,));
                                     },
                                     
                                   builder: (context,callBack)=>

                                Container(
                                  height:MediaQuery.of(context).size.height*0.06,
                                  //color: Colors.red,
                                  child: RaisedButton(
                                   // color: Colors.red,
                                    child: Text('SignIn',style: TextStyle(color: Colors.yellow,fontSize: 20),),
                                    onPressed: (){

                                        setState(() {
                                          callBack(LoginModel(username: userName.text,password: passWord.text,));
                                          if(statusCode==111){
                                               Navigator.pushNamed(context,Transactions.routeName);
                                          }
                                          if(statusCode==420){
                                             showDialog(context: context,
                                          builder:(ctx)=>AlertDialog(
                                            title: Text('Error'),
                                            content: Text('Fail'),
                                            actions: <Widget>[
                                              FlatButton(onPressed: ()=>Navigator.pop(context), child: Text('ok'))
                                            ],
                                          ));
                                            
                                          }
                                        });
                                     
                                          // setState(() {
                                          //    if(statusCode){
                                          //      
                                          //    }
                                          //    else{
                                          //  callBack(LoginModel(username: userName.text,password: passWord.text,loginBool:false));
                                          //  setState(() {
                                             
                                          //  });
                                          //  if(loginBool==false){
                                          //  showDialog(context: context,
                                          // builder:(ctx)=>AlertDialog(
                                          //   title: Text('Error'),
                                          //   content: Text('Fail'),
                                          //   actions: <Widget>[
                                          //     FlatButton(onPressed: ()=>Navigator.pop(context), child: Text('ok'))
                                          //   ],
                                          // ));

                                          //  }
                                          
                                          // }
                                          
                                        
                                          
                                          
                                          // });
                                         
                                     //callBack();
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
          ),
         // ),
          
        
      );
    
  }
}
typedef OnCallBakLoginAction=Function(LoginModel model);