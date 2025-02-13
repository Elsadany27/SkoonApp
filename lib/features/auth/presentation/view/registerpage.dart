import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skoon/core/utilies/app_images.dart';
import 'package:skoon/features/auth/presentation/view/widgets/customebutton.dart';
import 'package:skoon/features/auth/presentation/view/widgets/custometextform.dart';
import '../view model/authcubit.dart';
import '../view model/authstate.dart';
import 'LoginPage.dart';


class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

   TextEditingController fullname=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController phone=TextEditingController();
   TextEditingController password=TextEditingController();

   bool loading=false;
   GlobalKey<FormState> keyR =GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: screenSize.width*0.02,right: screenSize.width*0.02,top: screenSize.height*0.12),
        child: Form(
          key: keyR,
          child: ListView(children: [
            //text
            Center(child: Text("Create a new account",style: TextStyle(fontSize: screenSize.width*0.07),)),
            Center(child: Text("please, fill in the form to continue",style: TextStyle(fontSize: screenSize.width*0.032,fontWeight: FontWeight.w400,color: Colors.white30),)),
            //space
            SizedBox(height: screenSize.height*0.12,),
            //form
            CustomeTextform(controller: fullname,textt: "Full Name",ontap: (){},securetext: false,),SizedBox(height: screenSize.height*0.035,),
            CustomeTextform(controller: email,textt: "Email",ontap: (){},securetext: false,),SizedBox(height: screenSize.height*0.035,),
            CustomeTextform(controller: phone,textt: "Ph Mobile",securetext: false,ontap: (){},),SizedBox(height: screenSize.height*0.035,),
            BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomeTextform(controller: password,textt: "password",ontap: (){
              BlocProvider.of<AuthCubit>(context).changeState();
            },securetext: BlocProvider.of<AuthCubit>(context).statee,icon: Icons.visibility_off,);
            },
          ),
            //space
            SizedBox(height: screenSize.height*0.035,),SizedBox(height: screenSize.height*0.035,),
            //button
            SizedBox(height: screenSize.height*0.04,),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is IsloadingState) {
                  return CircleAvatar(child: CircularProgressIndicator(color: Colors.red,), radius: 20, backgroundColor: Colors.black,);
                } else if (state is FailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.errorMessage}")),);
                  return SizedBox();
                } else {
                  return CustomeButton(
                    ontap: () {BlocProvider.of<AuthCubit>(context).registerMethod(email.text.trim(), password.text.trim(), context);
                    },
                    textt: "SIGN IN",
                  );
                }
              },
            ),
            //sign with google
            SizedBox(height: screenSize.height*0.025,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(assets.google,height: screenSize.height*0.035,),SizedBox(width: screenSize.width*0.02,),
              Text("Login with google",style: TextStyle(fontSize: screenSize.width*0.03,fontWeight: FontWeight.w500,letterSpacing: 1.8 ),)
            ],),
            //don't have account
            SizedBox(height: screenSize.height*0.04,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Have an account?"),
              TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));}, child: Text("Login",style: TextStyle(color: Colors.red,letterSpacing: 1.4,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600),))
            ],)


          ],),
        ),
      ),)
);
  }
}
