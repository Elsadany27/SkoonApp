import 'package:flutter/material.dart';

class CustomeContainerImage extends StatelessWidget {
   CustomeContainerImage({super.key,this.image,this.rotate,this.alignment});
  String? image;
  double? rotate;
  Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(top: screenSize.height*0.12),
      alignment: alignment,
      child: Transform.rotate(
          angle: rotate!.toDouble(),
          child:Container(
            height: screenSize.height*0.24,
            width: screenSize.width*0.52,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill)),
          )
      ),
    );
  }
}
