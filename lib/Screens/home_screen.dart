import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:machine_test_calicut/Screens/login_screen.dart';
import 'package:machine_test_calicut/Screens/statisticsScreen.dart';
import 'package:provider/provider.dart';

import '../Constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<IconData>iconsList=[Icons.sync,Icons.arrow_upward_sharp,Icons.arrow_downward_sharp,Icons.receipt,Icons.more];
  List<String> titles=['Change','Transfer','Incoming','Receipts','More'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: const Text('Home', style: TextStyle(
            color: Color(0xFF303840),
            fontSize: 16,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1,
          ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: ShapeDecoration(
                  color: Color(0xFFDEE5ED),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            )
          ],
        ),
        drawer:
        Drawer(
          child:Column(children: [
            InkWell(onTap: (){
              FirebaseAuth firebaseAuth=FirebaseAuth.instance;
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut();
              firebaseAuth.signOut();
              callNextReplacement(LoginScreen(), context);
            },
              child: Container(height: 50,color:lightGray,
                child: const Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Log out',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(width: 15,),
                      Icon(Icons.logout)
                    ],
                  ),
                ),
              ),
            )
          ],)),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
              const Text(
                'Welcome,',
                style: TextStyle(
                  color: Color(0xFF303840),
                  fontSize: 22,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
              const Text(
                'Indigo Violet',
                style: TextStyle(
                  color: Color(0xFF7C8894),
                  fontSize: 14,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  width: 386,
                  height: 203,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.71, -0.71),
                      end: Alignment(-0.71, 0.71),
                      colors: [Color(0xFF94C3F6), Color(0xFF94EDF7)],
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const Text(
                          'Bartholomew Shoe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 1,
                          ),
                        ),
                        Container(
                          width: 44,
                          height: 27,
                          decoration: ShapeDecoration(
                            color: Color(0xFFB0F2FF),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],),
                      const Text(
                        '****  ****  ****  5678',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.88,
                        ),
                      ),
                      const Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(
                              'VALID THRU',
                              style: TextStyle(
                                color: Color(0xFFDEEEFF),
                                fontSize: 12,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              'CVV',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFDFEEFF),
                                fontSize: 12,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 1,
                              ),
                            ),
                          ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '07/24',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                '***',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],)

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                const Text(
                  'Easy Operations',
                  style: TextStyle(
                    color: Color(0xFF303840),
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 15,),
    Container(
      height: 100,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10.0),
      itemCount: iconsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: InkWell(onTap: (){
            if(index==2){
              callNext(StatisticsScreen(), context);
            }
          },
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 48,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
                  child: Icon(iconsList[index],color: lightGray,),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(titles[index],
                    style: const TextStyle(
                      color: Color(0xFF7C8894),
                      fontSize: 14,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),),
                )
              ],
            ),
          ),
        );
      }),
    ),
                SizedBox(height: 30,),
                const Text(
                  'Previous Transactions',
                  style: TextStyle(
                    color: Color(0xFF303840),
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),
    SizedBox(height: 10,),
    Consumer<MainProvider>(
      builder: (context,value,child) {
        return Container(
        height: height*0.3,
        // color: Colors.redAccent,
        child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(5.0),
        itemCount: value.alltransactionsList.length,
        itemBuilder: (BuildContext context, int index) {
          var item=value.alltransactionsList[index];
        return  Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            width: width*.8,
            height: 74,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              shadows: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 48,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListTile(

              leading:           Container(
                width: 46,
                height: 46,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: Image.asset('assets/homeIcon.png',color: lightGray,),
              ),
              title: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Color(0xFF303840),
                    fontSize: 14,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),SizedBox(height: 5,),
                Text(
                  value.outputDayNode.format(item.addedTime)
                      .toString(),
                  style: const TextStyle(
                    color: Color(0xFF7C8894),
                    fontSize: 12,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),
              ],
              ),
              trailing:         Text(
                '\$ '+ item.amount,
                textAlign: TextAlign.right,
                style: item.transactionType=='INCOME'?
                const TextStyle(
                  color: Color(0xFF50C474),
                  fontSize: 18,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                ):   const TextStyle(
                  color: Color(0xFFEF5354),
              fontSize: 18,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w500,
            ),
              ),

            )
          ),
        );
        }),);
      }
    ),
    ],),
          ),
        ),
      ),
    );
  }
}
