import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:provider/provider.dart';

import 'addNotes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: InkWell(onTap: (){
        callNext(AddNotesScreen(), context);
      },
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 35,
          child: Icon(Icons.add,color: Colors.white,size: 40,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
          Flexible(fit: FlexFit.tight,
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return ListView.builder(
                physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:value.allNotesList.length,
                    itemBuilder: (context,int index) {
                      var item = value.allNotesList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(onTap: (){
                          alert(context,item.description);
                        },
                          child: Container(
                            height: 100,width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 7,
                                  offset: Offset(4, 3),
                                  spreadRadius: 5,
                                )
                              ],
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(item.title),
                                Text(value.outputDayNode.format(item.addedTime).toString()),

                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            ),
          ),
          ],
        ),
      ),
    );
  }

  alert(context,String descriptin)  {
    return  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            content: Container(
              width: 401,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    SizedBox(height: 10,),

                    Container(
                        width: 401,
                        height: 213,
                        child: Center(child: Text(descriptin,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),))),
                    SizedBox(height: 10,),
                    InkWell(onTap: (){
                      finish(context);
                    },
                      child: Container(height: 40,width: 100,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text('Ok',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),),
                    )

                  ],
                    ),
              ),
              
              ),
            );
        });
  }

}
