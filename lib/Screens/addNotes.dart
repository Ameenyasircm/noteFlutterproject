import 'package:flutter/material.dart';
import 'package:machine_test_calicut/Constants/my_functions.dart';
import 'package:machine_test_calicut/Providers/main_provider.dart';
import 'package:provider/provider.dart';

class AddNotesScreen extends StatelessWidget {
   AddNotesScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    MainProvider mainProvider =
    Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Notes'),
      ),
      body: Form(key: _formKey  ,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Consumer<MainProvider>(
                    builder: (context,value2,child) {
                      return TextFormField(
                        // textAlign: TextAlign.center,
                        controller: value2.titleCT,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "PoppinsRegular",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
          
                        decoration: InputDecoration(
          
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Enter The Category",
                          hintStyle:TextStyle(
                            color: Colors.black,
                            fontFamily: "PoppinsRegular",
                            fontWeight: FontWeight.w100,
          
                            height: 0.090,
                            fontSize: 14,
                          ),
          
                          // suffixIcon: const Icon(Icons.search,color: cl898989,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none
                          ),
                          // constraints: const BoxConstraints(
                          //     minHeight: 40,
                          //     maxHeight: 50
                          // ),
          
                        ),
                        validator: (value) {
                          if (value=="") {
                            return 'Enter Category Name';
                          }
                          return null;
                        },
                      );
                    }
                ),
          
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Consumer<MainProvider>(
                    builder: (context,value2,child) {
                      return TextFormField(
                        // textAlign: TextAlign.center,
                        controller: value2.descriptionCT,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "PoppinsRegular",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        maxLines: 10,
          
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Enter Description",
                          hintStyle:TextStyle(
                            color: Colors.black,
                            fontFamily: "PoppinsRegular",
                            fontWeight: FontWeight.w100,
          
                            height: 0.090,
                            fontSize: 14,
                          ),
          
                          // suffixIcon: const Icon(Icons.search,color: cl898989,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none
                          ),
                          // constraints: const BoxConstraints(
                          //     minHeight: 40,
                          //     maxHeight: 50
                          // ),
          
                        ),
                        validator: (value) {
                          if (value=="") {
                            return 'Enter Description';
                          }
                          return null;
                        },
                      );
                    }
                ),
          
              ),
              SizedBox(height: 30,),
            InkWell(onTap: (){
              final FormState? form = _formKey.currentState;
              if (form!.validate()) {
                mainProvider.addNote();
                finish(context);
              }
            },
              child: Container(height: 50,width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            )
          ],),
        ),
      ),


    );
  }
}
