abstract class AuthState{}

//auth firebase
class InitialState extends AuthState{}
class SucessState extends AuthState{
  String? succesMessage;

  SucessState({required this.succesMessage});
}
class FailureState extends AuthState{
  String? errorMessage;
  FailureState({required this.errorMessage});
}
class IsloadingState extends AuthState{}

//state
class VisiblityState extends AuthState{}
class UnvisiblityState extends AuthState{}