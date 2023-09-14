import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hyper_hyer_test/models/data_models.dart';
import 'package:hyper_hyer_test/utilities/const_text.dart';

class FirebaseRTDBService {
  FirebaseRTDBService._();

  static final FirebaseRTDBService _service = FirebaseRTDBService._();

  factory FirebaseRTDBService() => _service;

  static final FirebaseApp _firebaseApp = Firebase.app();
  static final FirebaseDatabase _database = FirebaseDatabase.instanceFor(
    app: _firebaseApp,
    databaseURL: ConstText.kDatabaseURL,
  );

  final DatabaseReference db = _database.ref("data");

  Future<List<DataModels>> getRecords() async {
    List<DataModels> data= <DataModels>[];
    var result = await db.get();
    var json = jsonEncode(result.value);
    var temp = jsonDecode(json);
    if(temp["apple"] !=null ) {
      log("=====> ${temp["apple"]["tags"]}");
      data.add(DataModels.fromJson(temp["apple"]));
      // data.add(DataModels.fromJson(temp["apple"]));
    }
    if(temp["banana"]!=null) {
      data.add(DataModels.fromJson(temp["banana"]));
    }
    if(temp["peach"]!=null) {
      data.add(DataModels.fromJson(temp["peach"]));
    }
    if(temp["melon"]!=null) {
      data.add(DataModels.fromJson(temp["melon"]));
    }
    log("==========> ${data}");
    return data;
  }
}