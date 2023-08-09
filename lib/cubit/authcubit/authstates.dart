abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSucsessState extends AuthStates {}

class LoginErrorEmailorpasswordState extends AuthStates {}

class LoginErrorState extends AuthStates {}

class ChangesecurepasswordState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSucsessState extends AuthStates {}

class RegisterErrorState extends AuthStates {}

class RegisterErrorDataState extends AuthStates {}
