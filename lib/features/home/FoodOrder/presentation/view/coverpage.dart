import 'package:flutter/material.dart';
import 'package:skoon/core/utilies/app_images.dart';

import 'foodorder.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(assets.coverfoodorder),fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text("Order Food",style: TextStyle(fontWeight: FontWeight.bold,fontSize:screenSize.width*0.12,letterSpacing: 3),),
            Text("We'll deliver it right to your door",style: TextStyle(fontSize: screenSize.width*0.03,fontWeight: FontWeight.w400,color: Colors.white60),),
            SizedBox(height: screenSize.height*0.02,),
            IconButton(onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FoodOrder(),), (route) => false,);}, icon: Icon(Icons.keyboard_double_arrow_down_outlined,size: screenSize.height*0.08,)),
            SizedBox(height: screenSize.height*0.04,)
        ],),
      ),
    );
  }
}
