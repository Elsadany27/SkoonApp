import 'package:flutter/material.dart';
import 'package:skoon/core/utilies/app_images.dart';
import '../../../home/FoodOrder/presentation/view/coverpage.dart';
import '../../data/data.dart';

class AppCategories extends StatelessWidget {
   AppCategories({super.key});
  List<Categories> data=[
    Categories(image: assets.foodorder,textt: "Order Food",page: CoverPage()),
    Categories(image: assets.takeaway,textt: "Takeaway"),
    Categories(image: assets.reservetable,textt: "Reserve Table"),
    Categories(image: assets.catering,textt: "Catering"),
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body:Center(
        child: Container(
          height: screenSize.height*0.5,
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.15,mainAxisSpacing: 0.6), itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => data[index].page));
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              width: screenSize.width*0.05,
              margin: EdgeInsets.all(12),
              child: Container(
                  height: screenSize.height*0.026,
                  alignment: Alignment.center,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),color: Color(0xff591517)),child: Text("${data[index].textt}",style: TextStyle(fontSize: screenSize.width*0.03),)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage("${data[index].image}"),fit: BoxFit.fill)),
                        ),
            ),),
        ),
      ) ,
    );
  }
}
