import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:provider/provider.dart';

import '../Constants/my_functions.dart';
import '../Providers/LoginProvider.dart';
import 'bottom_navigation_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      MainProvider mainProvider =
      Provider.of<MainProvider>(context, listen: false);
      mainProvider.fetchAllTransactions();
      FirebaseAuth auth = FirebaseAuth.instance;
      var user = auth.currentUser;


      if (user == null) {
        callNextReplacement(const LoginScreen(), context);
      } else {
        callNextReplacement(BottomNavigationScreen(), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.71, -0.71),
            end: Alignment(-0.71, 0.71),
            colors: [Color(0xFF94C3F6), Color(0xFF94EDF7)],
          ),
        ),
        child: Image.asset('assets/wallet.png',scale: 2.5,color: Colors.white,),
      )

    );

  }
}
