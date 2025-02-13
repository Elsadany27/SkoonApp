import 'package:flutter/material.dart';
import 'package:skoon/core/utilies/app_images.dart';
import 'package:skoon/features/onboarding/presentation/view/widgets/CustomeContainerImage.dart';

import '../../../auth/presentation/view/registerpage.dart';


class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: screenSize.width*0.05,
            top: screenSize.height*0.14,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                height: screenSize.height*0.24,
                width: screenSize.width*0.52,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.white38)),
              ),
            ),
          ),
          //left image
          CustomeContainerImage(alignment: Alignment.topRight,image: "${assets.on31}",rotate: 0.4,),
          //right
          Positioned(
              top: screenSize.height*0.03,
              left: screenSize.width*0.07,
              child: CustomeContainerImage(alignment: Alignment.topLeft,image: "${assets.on32}",rotate: -0.3,)),

          //text
          Padding(
            padding:  EdgeInsets.only(left: screenSize.width*0.02,top: screenSize.height*0.6,right: screenSize.width*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Place catering Orders",style: TextStyle(fontSize: screenSize.width*0.05,fontWeight: FontWeight.bold),),SizedBox(height: screenSize.height*0.03,),
                Text("Place catering orders with us",style: TextStyle(color: Colors.white30,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w400),),

                SizedBox(height: screenSize.height*0.1,),
                // skip & button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RegisterPage(),), (route) => false,);}, child: Text("Skip",style: TextStyle(color: Colors.white54),),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(top: screenSize.height*0.021,bottom: screenSize.height*0.021),
                            backgroundColor: Colors.white10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RegisterPage(),), (route) => false,);}, child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,))
                  ],)
              ],),
          )
        ],
      ),
    );
  }
}
