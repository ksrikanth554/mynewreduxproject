class LoginModel{
  final String username;
  final String password;
  LoginModel({this.password,this.username});
  
  factory LoginModel.initial(){
    return LoginModel(
      username: '',password: ''
    );
  }
  LoginModel copyWith({String usernam,String password}){
    return LoginModel(
      username: username??this.username,
      password:password??this.password
  );
  
}
}