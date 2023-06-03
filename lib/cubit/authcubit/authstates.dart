abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSucsessState extends AuthStates {}

class AuthErrorEmailorpasswordState extends AuthStates {}

class AuthErrorState extends AuthStates {}
