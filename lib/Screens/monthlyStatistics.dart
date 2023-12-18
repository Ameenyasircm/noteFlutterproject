import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_colors.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:machine_test_calicut/Models/transactionModel.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:machine_test_calicut/Screens/weeklystatisctics.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyStatistics extends StatelessWidget {
  MonthlyStatistics({Key? key}) : super(key: key);

  List<String> reportTextList = [
    'Shopping',
    'Savings',
    'Education',
    'Bank Loan'
  ];
  List<Color>colorsList=[light2,green,light,blue];
  late TooltipBehavior _tooltip;
  @override
  Widget build(BuildContext context) {
    _tooltip = TooltipBehavior(enable: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading:  InkWell(onTap: (){
          finish(context);
        },child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Consumer<MainProvider>(builder: (context, value, child) {
                return Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Autocomplete<String>(
                        optionsBuilder:
                            (TextEditingValue textEditingValue) {
                          return (value.monthList)
                              .where((String item) => item
                              .toLowerCase()
                              .contains(textEditingValue.text
                              .toLowerCase()))
                              .toList();
                        },
                        displayStringForOption: (String option) =>
                        option,
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController
                            fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) {
                            fieldTextEditingController.text = value
                                .monthNameCT.text;
                          });
                          return TextFormField(
                            validator: (values) {
                              if (values!.isEmpty) {
                                return "Please Enter Exam Section";
                              } else {
                                return null;
                              }
                            },
                            decoration:  InputDecoration(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: lightGray,
                                ),
                                counterStyle:  TextStyle(color: Colors.grey),
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.4000000059604645),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'Montly',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(45))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(45))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(45))),
                                filled: true,
                                fillColor: my_white),
                            onChanged: (value2) {
                              value.monthNameCT
                                  .text = value2;
                              value.updateMonth(value2);
                            },
                            controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal),
                          );
                        },
                        onSelected: (String selection) {
                          value.monthNameCT.text =
                              selection;
                          value.updateMonth(selection);
                        },
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<String> onSelected,
                            Iterable<String> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width *
                                    0.6,
                                height: 200,
                                color: Colors.white,
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(10.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    final String option =
                                    options.elementAt(index);

                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        height: 50,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3 -
                                            30,
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(option,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      fontSize: 15)),
                                              const SizedBox(height: 4)
                                            ]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(onTap: (){
                  },
                    child: Container(
                      height: 300,
                      width: width,
                      // decoration: BoxDecoration(color: Colors.greenAccent),
                      child: SfCircularChart(
                          tooltipBehavior: _tooltip,
                          series: <CircularSeries<TransactionModel, String>>[
                            DoughnutSeries<TransactionModel, String>(
                                dataSource: value.alltransactionsList,
                                // dataSource: value.getMonthWiseReport(),
                                xValueMapper: (TransactionModel data, _) => data.addedTime.month.toString(),
                                yValueMapper: (TransactionModel data, _) => int.parse(data.amount),
                                name: 'Gold')
                          ])),
                    );
                }
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(onTap: (){
                callNext(WeeklyStatistics(), context);

              },
                child: GridView.builder(
                    // scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: reportTextList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 186,
                        height: 133,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 48,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: colorsList[index],
                                  ),SizedBox(width: 10,),
                                  Text(
                                    reportTextList[index],
                                    style: TextStyle(
                                      color: Color(0xFF303840),
                                      fontSize: 14,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '\$1,400',
                                style: TextStyle(
                                  color: Color(0xFF94C3F6),
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 157,
                                child: Text(
                                  'Mauris hendrerit mollis bibendum quisque.',
                                  style: TextStyle(
                                    color: Color(0xFF7C8894),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
