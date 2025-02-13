import 'package:flutter/material.dart';
import 'package:skoon/features/home/FoodOrder/data/data.dart';

import '../../../../../../core/utilies/app_images.dart';

class CustomePageView extends StatefulWidget {
   CustomePageView({super.key});

  @override
  State<CustomePageView> createState() => _CustomePageViewState();
}

class _CustomePageViewState extends State<CustomePageView> {
   List<ImagePageView> data=[
     ImagePageView(image: assets.on21,),
     ImagePageView(image: assets.on22,),
     ImagePageView(image: assets.on11,),
   ];

   int currentpage=0;

   PageController controller=PageController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Column(
      children: [
        Container(
          height: screenSize.height*0.25,
          child: PageView.builder(

            onPageChanged: (value) {
              setState(() {
                currentpage=value;
              });
            },
            controller:controller ,
            itemCount: data.length,
            itemBuilder: (context, index) =>  Container(
              padding: EdgeInsets.only(top: screenSize.height*0.02,right: screenSize.width*0.06),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${data[index].image}"),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end ,
                children: [
                  //text
                  Text("Get 10%\n OFF", style: TextStyle(fontSize: screenSize.width*0.07,fontWeight: FontWeight.bold),),SizedBox(height: screenSize.height*0.01,),
                  Text("Use code:",style: TextStyle(color: Colors.white60,),),
                  Text("WELCOMEBASCK",style: TextStyle(fontSize: screenSize.width*0.04,fontWeight: FontWeight.bold),),SizedBox(height: screenSize.height*0.01,),
                  MaterialButton(elevation: 20,onPressed: (){},child: Text("Order Now", style: TextStyle(fontSize: screenSize.width*0.03),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),color: Color(0xff1B1B20))
                ],),
            ),),
        ),
        SizedBox(height: screenSize.height*0.01,),
        Row(mainAxisAlignment:  MainAxisAlignment.center,children: [
          ...List.generate(data.length, (index) => AnimatedContainer(
            child: CircleAvatar(radius:currentpage==index?7:5,
              backgroundColor: currentpage==index?Colors.white:Colors.white60,),
            margin: EdgeInsets.only(right: screenSize.width*0.01),
            // height: screenSize.height*0.01,
            // width: screenSize.width*0.02,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            //     color:currentpage==index?Colors.white:Colors.white24),
            duration: Duration(milliseconds: 1000),),)

        ],)
      ],
    );
  }
}
