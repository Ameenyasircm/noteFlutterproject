

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/notes_model.dart';




class MainProvider extends ChangeNotifier{

  DatabaseReference mRoot = FirebaseDatabase.instance.ref();
  FirebaseFirestore db = FirebaseFirestore.instance;

  var outputDayNode = DateFormat('d-MM-yyy hh:mm:aa');
  TextEditingController titleCT = TextEditingController();
  TextEditingController descriptionCT = TextEditingController();
  List<NotesModel> allNotesList=[];

  MainProvider(){
    fetctNotes();
  }

  void addNote(){
    HashMap<String,Object> map = HashMap();
    map['Title']=titleCT.text;
    map['Description']=descriptionCT.text;
    map['AddedTime']=DateTime.now();

    String key=DateTime.now().millisecondsSinceEpoch.toString();
    db.collection('ALL NOTES').doc(key).set(map,SetOptions(merge: true));
    fetctNotes();
  }

  void fetctNotes(){
    db.collection('ALL NOTES').get().then((value){
      if(value.docs.isNotEmpty){
        for(var ee in value.docs) {
          Map<dynamic,dynamic> map = ee.data() as Map;
          Timestamp stttTo = map['AddedTime'];
         DateTime scheduledTimeFrom = DateTime.parse(stttTo.toDate().toString());
          allNotesList.add(NotesModel(ee.id, map['Title']??'', map['Description']??'', scheduledTimeFrom));
        notifyListeners();
        }

      }
    });
  }



}