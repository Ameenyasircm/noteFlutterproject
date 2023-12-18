import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_colors.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Screens/weeklystatisctics.dart';

class MonthlyStatistics extends StatelessWidget {
  MonthlyStatistics({Key? key}) : super(key: key);

  List<String> reportTextList = [
    'Shopping',
    'Savings',
    'Education',
    'Bank Loan'
  ];
  List<Color>colorsList=[light2,green,light,blue];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
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
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                maxLength: 10,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
                autofocus: false,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: lightGray,
                  ),
                  counterText: '',
                  fillColor: Color(0xfffffffff),
                  filled: true,
                  counterStyle: const TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.4000000059604645),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Montly',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(onTap: (){
              callNext(WeeklyStatistics(), context);
            },
              child: Container(
                height: 300,
                width: width,
                decoration: BoxDecoration(color: Colors.greenAccent),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
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
          ],
        ),
      ),
    );
  }
}
