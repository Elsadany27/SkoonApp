import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
   CustomeButton({super.key,this.textt});
  String? textt;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(left: screenSize.width*0.15,right: screenSize.width*0.15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: screenSize.width*0.07,right: screenSize.width*0.07,top: screenSize.height*0.025,bottom: screenSize.height*0.025)
          ),
          onPressed: (){}, child: Text("$textt",style: TextStyle(color: Colors.white),)),
    );
  }
}
