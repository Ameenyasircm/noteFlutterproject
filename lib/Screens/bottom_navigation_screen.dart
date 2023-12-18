import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Screens/splashScreen.dart';
import 'package:machine_test_calicut/Screens/splashScreen.dart';
import 'package:machine_test_calicut/Screens/splashScreen.dart';
import 'package:machine_test_calicut/Screens/splashScreen.dart';
import 'package:machine_test_calicut/Screens/statisticsScreen.dart';
import 'package:provider/provider.dart';

import '../Constants/my_colors.dart';
import '../Providers/main_provider.dart';
import 'alltransactions.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  var screens = [  HomeScreen(),  StatisticsScreen(), AllTransactions(), HomeScreen()];

  int selectedIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: clBlack,
          items: [
          BottomNavigationBarItem(

              icon: Image.asset(
                'assets/homeIcon.png',
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                'assets/homeIcon.png',
                height: 20,
                width: 20,
                color:lightBlue,
              ),
              label: "",
              backgroundColor: my_white),
          BottomNavigationBarItem(


              icon: Image.asset(
                'assets/statisticsIcon.png',
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                'assets/statisticsIcon.png',
                height: 20,
                width: 20,
                color:lightBlue,
              ),
              label: "",
              backgroundColor: my_white),
          BottomNavigationBarItem(

              icon: Image.asset(
                'assets/menuIcon.png',
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                'assets/menuIcon.png',
                height: 20,
                width: 20,
                color:lightBlue,
              ),
              label: "",
              backgroundColor: my_white),
          BottomNavigationBarItem(

              icon: Image.asset(
                'assets/profileIcon.png',
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                'assets/profileIcon.png',
                height: 20,
                width: 20,
                color:lightBlue,
              ),
              label: "",
              backgroundColor: my_white),
        ],

        ),
      ),
    );
  }
}
