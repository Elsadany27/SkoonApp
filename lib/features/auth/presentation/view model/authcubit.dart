import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skoon/features/auth/data/repoImp/AuthRepo.dart';
import '../../../onboarding/presentation/view/appcategories.dart';
import 'authstate.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitialState());

  AuthRepo authRepo=AuthRepo();
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

  //auth -- register
  registerMethod(String email,String password,context){
    emit(IsloadingState());
    try{
      authRepo.signup(email, password,context);
      emit(SucessState(succesMessage: "user created Successfully"));
    }catch(e){
      emit(FailureState(errorMessage: "${e.toString()}"));
    }
  }

  //login
  loginMethod(String email,String pass,context)async{
    emit(IsloadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
      emit(SucessState(succesMessage: "Login Success"));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AppCategories(),), (route) => false,);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email.")));
        print('No user found for that email.');
        emit(FailureState(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for that user.")));
        print('Wrong password provided for that user.');
        emit(FailureState(errorMessage:'Wrong password provided for that user.' ));
      }
    }
  }



}