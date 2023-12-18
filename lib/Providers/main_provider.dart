

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transactionModel.dart';



class MainProvider extends ChangeNotifier{

  DatabaseReference mRoot = FirebaseDatabase.instance.ref();
  FirebaseFirestore db = FirebaseFirestore.instance;

  var outputDayNode = DateFormat('d-MM-yyy');
  List<TransactionModel> alltransactionsList=[];
  List<SalesData> monthchartList=[];
  double totalIncome=0.0;
  double totalExpense=0.0;

  MainProvider(){
  }
  void fetchAllTransactions(){
    db.collection('TRANSACTIONS').orderBy('ADDED_TIME',descending: true).snapshots().listen((event) {
      if(event.docs.isNotEmpty){
        alltransactionsList.clear();
        totalExpense=0;
        totalIncome=0;
        for(var elemets in event.docs){
          DateTime addedTime=DateTime.now();
          Map<dynamic,dynamic> map = elemets.data() as Map;
          Timestamp timestamp = map['ADDED_TIME'];
          addedTime = DateTime.parse(timestamp.toDate().toString());
          String transactionType='';
          if(map['TRANSACTION_TYPE']=='INCOME'){
            transactionType=map['INCOME CATEGORY']??'';
            totalIncome=totalIncome+double.parse(map['AMOUNT'].toString());
          }else{
            transactionType=map['EXPENSE_CATEGORY']??'';
            totalExpense=totalExpense+double.parse(map['AMOUNT'].toString());
          }

          alltransactionsList.add(TransactionModel(
              elemets.id,
              map['TITLE']??'',
              map['TRANSACTION_TYPE']??'',
              transactionType,
              map['AMOUNT'].toString(),
              addedTime));

        }
        notifyListeners();
      }
    });
  }

  String getAmount(double totalCollection) {
    final formatter = NumberFormat.currency(locale: 'HI', symbol: '');
    String newText1 = formatter.format(totalCollection);
    String newText =
    formatter.format(totalCollection).substring(0, newText1.length - 3);
    return newText;
  }

}