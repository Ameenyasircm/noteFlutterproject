import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Constants/my_colors.dart';
import '../Models/transactionModel.dart';
import 'alltransactions.dart';
import 'monthlyStatistics.dart';

class StatisticsScreen extends StatelessWidget {
   StatisticsScreen({Key? key}) : super(key: key);

 late TooltipBehavior tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    tooltipBehavior = TooltipBehavior(enable: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading:  InkWell(onTap: (){
          finish(context);
        },child: Icon(Icons.arrow_back)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    topRight: Radius.circular(35)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35,),
                    Align(alignment: Alignment.center,
                      child: Text(
                        'July 2022',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF303840),
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Column(
                            children: [
                              Text(
                                '\$'+value.getAmount(value.totalIncome),
                                style: TextStyle(
                                  color: Color(0xFF303840),
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                'Income',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF7C8894),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                      Column(
                        children: [
                          Consumer<MainProvider>(
                            builder: (contex,value,childt) {

                              return Text(
                                '\$'+value.getAmount(value.totalExpense),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF303840),
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              );
                            }
                          ),
                          Text(
                            'Expense',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF7C8894),
                              fontSize: 12,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],),
                    SizedBox(height: 30,),
                    Text(
                      'Income Rate',
                      style: TextStyle(
                        color: Color(0xFF303840),
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 1,
                      ),
                    ),
                    Consumer<MainProvider>(
                        builder: (context,value,child) {
                        return Column(
                          children: [
                            InkWell(onTap:(){
                              callNext(AllTransactions(), context);
                            },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 40,
                                  child: LinearProgressIndicator(
                                    value: value.totalIncome / (value.totalIncome+value.totalExpense), //current / max
                                    borderRadius: BorderRadius.circular(15),
                                    backgroundColor: gray1,
                                    color: Color(0xFF94C3F6),
                                    valueColor:  AlwaysStoppedAnimation<Color>(Color(0xFF94C3F6)),
                                  ),
                                ),
                              ),
                            ),
                            Consumer<MainProvider>(
                              builder: (context,value,child) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('\$'+'0'),
                                      Text('\$'+value.getAmount(value.totalExpense+value.totalIncome)),
                                    ],
                                  ),
                                );
                              }
                            )
                          ],
                        );
                      }
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Total Success this Month',
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
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return InkWell(onTap: (){
                          callNext(MonthlyStatistics(), context);
                        },
                          child: Container(height: 300,width: width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 48,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:  Consumer<MainProvider>(
                            builder: (context,value,chilf) {
                              return Container(
                                    child: SfCartesianChart(

                                      primaryXAxis: CategoryAxis(),
                                      // Chart title
                                      title: ChartTitle(text: ''),
                                      // Enable legend
                                      legend: Legend(isVisible: true),
                                      // Enable tooltip
                                      tooltipBehavior: tooltipBehavior,

                                      series: <LineSeries<TransactionModel, String>>[
                                        LineSeries<TransactionModel, String>(
                                            dataSource: value.alltransactionsList.where((element) => element.transactionType=='INCOME').toSet().toList(),
                                            xValueMapper: (TransactionModel sales, _) => sales.addedTime.month.toString(),
                                            yValueMapper: (TransactionModel sales, _) => int.parse(sales.amount.toString()),
                                            // Enable data label
                                            dataLabelSettings: DataLabelSettings(isVisible: true)
                                        ),LineSeries<TransactionModel, String>(
                                            dataSource: value.alltransactionsList.where((element) => element.transactionType=='EXPENSE').toSet().toList(),
                                            xValueMapper: (TransactionModel sales, _) => sales.addedTime.month.toString(),
                                            yValueMapper: (TransactionModel sales, _) => int.parse(sales.amount.toString()),
                                            // Enable data label
                                            dataLabelSettings: DataLabelSettings(isVisible: true)
                                        ),
                                      ]
                                  )
                              );
                            }
                          ),
                          ),
                        );
                      }
                    )

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
