abstract class AuthState{}

//auth firebase
class InitialState extends AuthState{}
class SucessState extends AuthState{}
class FailureState extends AuthState{}
class IsloadingState extends AuthState{}

//state
class VisiblityState extends AuthState{}
class UnvisiblityState extends AuthState{}