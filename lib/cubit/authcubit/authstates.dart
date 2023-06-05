abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSucsessState extends AuthStates {}

class LoginErrorEmailorpasswordState extends AuthStates {}

class LoginErrorState extends AuthStates {}
