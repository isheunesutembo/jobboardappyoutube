import 'package:flutter/material.dart';
import 'package:jobboardapp/features/applications/screen/application_screen.dart';
import 'package:jobboardapp/features/favourites/screen/favourite_screen.dart';
import 'package:jobboardapp/features/home/screen/home_screen.dart';
import 'package:jobboardapp/features/settings/screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex=0;
  void _onItemTap(int index ){
    setState(() {
      selectedIndex=index;
    });
  }
  List<Widget>pages=[
   HomeScreen(),
   ApplicationScreen(),
   FavouriteScreen(),
   SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,onTap: _onItemTap,items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home.png",height: 30,width: 30,),
            label: "Jobs"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/suitcase.png",height: 30,width: 30,),
            label: "Applications"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/heart.png",height: 30,width: 30,),
            label: "Favourites"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/settings.png",height: 30,width: 30,),
            label: "Settings"
          )
        ]),
        body: pages[selectedIndex],
    );
  }
}