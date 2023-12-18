import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:provider/provider.dart';

import '../Constants/my_colors.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: InkWell(onTap: (){
          finish(context);
        },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title:   Text(
          'All Transactions',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF303840),
            fontSize: 16,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1,
          ),

        ),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Text(
                    '\$'+value.getAmount(value.totalIncome),
                    style: TextStyle(
                      color: Color(0xFF303840),
                      fontSize: 22,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  );
                }
              ),
              Text(
                'My Total Earnings',
                style: TextStyle(
                  color: Color(0xFF7C8894),
                  fontSize: 12,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All My Expenses',
                    style: TextStyle(
                      color: Color(0xFF303840),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'See All',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF303840),
                      fontSize: 12,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
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
                          return  item.transactionType=='EXPENSE'?
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                                width: width*.8,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  shadows: [
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
                                        style: TextStyle(
                                          color: Color(0xFF303840),
                                          fontSize: 14,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          letterSpacing: 1,
                                        ),
                                      ), SizedBox(height: 5,),
                                      Text(
                                        value.outputDayNode.format(item.addedTime)
                                            .toString(),
                                        style: TextStyle(
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
                                  trailing:      Text(
                                    '\$'+item.amount,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFEF5354),
                                      fontSize: 18,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 1,
                                    ),
                                  ),

                                )
                            ),
                          ):SizedBox();
                        }),);
                }
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All My Income',
                    style: TextStyle(
                      color: Color(0xFF303840),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'See All',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF303840),
                      fontSize: 12,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
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
                            return  item.transactionType=='INCOME'?
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Container(
                                  width: width*.8,
                                  height: 74,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                    shadows: [
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
                                          style: TextStyle(
                                            color: Color(0xFF303840),
                                            fontSize: 14,
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          value.outputDayNode.format(item.addedTime)
                                              .toString(),
                                          style: TextStyle(
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
                                    trailing:      Text(
                                      '\$'+item.amount,
                                      textAlign: TextAlign.right,
                                      style:  const TextStyle(
                                        color: Color(0xFF50C474),
                                        fontSize: 18,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w500,
                                      )
                                    ),

                                  )
                              ),
                            ):SizedBox();
                          }),);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
