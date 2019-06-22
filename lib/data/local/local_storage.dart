import 'package:core/data/database.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:friendlist/data/local/tables.dart';

class LocalStorage extends DBProvider {
  
  // singleton class
  LocalStorage._();
  static final LocalStorage helper = LocalStorage._();

  //SQL code to create the database table
  @override
  Future onCreateDatabase(Database db, int version) async {
    var query = await db.execute(
      "CREATE TABLE $REGION ("
      "id TEXT PRIMARY KEY,"
      "nama TEXT"
      ")");
    return query;
  }

  @override
  String initDbName() {
    return "FlutterCore.db";
  }

  @override
  int initDbVersion() {
    return 1;
  }

  @override
  DBProvider instance() {
    return helper;
  }
}