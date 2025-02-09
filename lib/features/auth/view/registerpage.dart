import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skoon/core/utilies/app_images.dart';
import 'package:skoon/features/auth/view/view%20model/authcubit.dart';
import 'package:skoon/features/auth/view/view%20model/authstate.dart';
import 'package:skoon/features/auth/view/widgets/customebutton.dart';
import 'package:skoon/features/auth/view/widgets/custometextform.dart';

import 'LoginPage.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

   TextEditingController fullname=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController phone=TextEditingController();
   TextEditingController passeord=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: screenSize.width*0.02,right: screenSize.width*0.02,top: screenSize.height*0.12),
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
          CustomeTextform(controller: passeord,textt: "password",ontap: (){
            BlocProvider.of<AuthCubit>(context).changeState();
          },securetext: BlocProvider.of<AuthCubit>(context).statee,icon: Icons.visibility_off,),
          //space
          SizedBox(height: screenSize.height*0.035,),SizedBox(height: screenSize.height*0.035,),
          //button
          SizedBox(height: screenSize.height*0.04,),
         CustomeButton(textt: "SIGN IN",),
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
    );
  },
),
);
  }
}
