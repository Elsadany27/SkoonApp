import 'package:flutter/material.dart';

class CustomeTextform extends StatelessWidget {
   CustomeTextform({super.key,this.textt,required this.securetext,this.icon,required this.ontap,this.controller});
  String? textt;
  bool? securetext;
  IconData? icon;
  final VoidCallback ontap;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  TextFormField(
      controller: controller,
      obscureText: securetext!,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff1B1B20),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff1B1B20),)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff1B1B20),)),
        hintText: textt,
        hintStyle: TextStyle(fontSize: screenSize.width*0.03),
        suffixIcon: IconButton(onPressed:ontap , icon: Icon(icon))
    ),);
  }
}
