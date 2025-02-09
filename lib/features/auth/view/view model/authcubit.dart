import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skoon/features/auth/view/view%20model/authstate.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitialState());

  //change state for password
  bool statee=true;
  changeState(){
    if(statee==true){
      statee=false;
      emit(UnvisiblityState());
    }else{
      statee=true;
      emit(VisiblityState());
    }
  }

  //auth


}