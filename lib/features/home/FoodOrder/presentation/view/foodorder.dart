import 'package:flutter/material.dart';
import 'package:skoon/core/utilies/app_images.dart';
import 'package:skoon/features/auth/presentation/view/widgets/customebutton.dart';
import 'package:skoon/features/auth/presentation/view/widgets/custometextform.dart';
import 'package:skoon/features/home/FoodOrder/presentation/view/widgets/pageview.dart';

class FoodOrder extends StatelessWidget {
  const FoodOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: screenSize.width*0.02,right: screenSize.width*0.02,),
        child: ListView(children: [
          //appbar
          ListTile(
            title: Text("Deliver to",style: TextStyle(color: Colors.white38,letterSpacing: 5,fontSize:screenSize.width*0.02 ),),
            subtitle: Text("6 Octobor",style: TextStyle(letterSpacing: 3,fontSize:screenSize.width*0.04 ),),
            leading: CircleAvatar(radius: 25,backgroundImage: AssetImage(assets.profileimage),),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.notifications),iconSize: screenSize.height*0.035,),),

          //search
          SizedBox(height: screenSize.height*0.03,),
          CustomeTextform(securetext: false, ontap: (){},icon: Icons.search,),
          SizedBox(height: screenSize.height*0.03,),

          //cards
          CustomePageView()
        ],),
      ),
    );
  }
}
