import 'package:flutter/material.dart';
import 'package:jobboardapp/features/settings/widgets/settings_item_widget.dart';
import 'package:jobboardapp/util/route.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                      
                    ),image: DecorationImage(image:AssetImage("assets/images/person.png"),fit: BoxFit.cover)
                  ),
                ),
                Positioned(bottom: 5,right: 0,child: Card(
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),child: Image.asset("assets/images/camera.png",height:40,width:40,fit: BoxFit.cover,)),
                ))
              ],),
            ),
            Center(
              child: Text("Isheunesu",style: TextStyle(color: Colors.black,
              fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Settings",style: TextStyle(color: Colors.black,
              fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Container(
              height: MediaQuery.of(context).size.height*1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                   topRight: Radius.circular(20)
                )
              ),
              child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SettingsItemWidget(title: "My Profile", icon: Icons.arrow_right),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap:(){
            Navigator.pushNamed(context, Routes.resumescreen);
          } ,child: SettingsItemWidget(title: "My Resumes", icon: Icons.arrow_right)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SettingsItemWidget(title: "LogOut", icon: Icons.arrow_right),
        ),
              ],),
            )
          ],
        ),
      ) ,
    );
  }
}