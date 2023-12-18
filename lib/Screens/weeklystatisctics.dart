import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Constants/my_colors.dart';
import '../Providers/main_provider.dart';

class WeeklyStatistics extends StatelessWidget {
   WeeklyStatistics({Key? key}) : super(key: key);

   late TooltipBehavior _tooltip;

   List<String> weeknamesList=['This Week','Last Week','Last Month','Last Year'];
  @override
  Widget build(BuildContext context) {
    _tooltip = TooltipBehavior(enable: true);
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
          'Statistics',
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
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              height: 50,
              color: Colors.transparent,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10.0),
                  itemCount: weeknamesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child:
                      Container(
                        width: 104,
                        height: 36,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 48,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(child: Text(weeknamesList[index],
                          style: TextStyle(
                            color: Color(0xFF7C8894),
                            fontSize: 12,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 25,),
            InkWell(onTap: (){
            },
              child: Container(height: 300,width: width,
                // color: Colors.greenAccent,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(minimum: 0, maximum: 500000, interval: 10),
                      tooltipBehavior: _tooltip,
                      series: <CartesianSeries<TransactionModel, String>>[
                        ColumnSeries<TransactionModel, String>(
                            dataSource: value.alltransactionsList,
                            xValueMapper: (TransactionModel data, _) => data.addedTime.day.toString(),
                            yValueMapper: (TransactionModel data, _) => int.parse(data.amount),
                            name: 'Amount',
                            color: Color.fromRGBO(8, 142, 255, 1))
                      ]);
                }
              ),
            ),),
            SizedBox(height: 30,),
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

          ],
        ),
      ),
    );
  }
}
