abstract class AccountStates {}
class AccountInitialState extends AccountStates {}
class AccountFailureState extends AccountStates {}
class AccountSuccessState extends AccountStates {}
class AccountLoadingState extends AccountStates {}
class AccountServerErrorState extends AccountStates{}

class ChsngePasswlFailureState extends AccountStates {}
class ChsngePasswSuccessState extends AccountStates {}
class ChangePassloadingState extends AccountStates {}