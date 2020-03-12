class LoginModel{
  final String username;
  final String password;
 final int statusCode;
  LoginModel({this.password,this.username,this.statusCode});
  
  factory LoginModel.initial(){
    return LoginModel(
      username: '',password: '',statusCode:null 
    );
  }
  LoginModel copyWith({String usernam,String password,int statusCode}){
    return LoginModel(
      username: username??this.username,
      password:password??this.password,
      statusCode:statusCode??this.statusCode
  );
  
}
}