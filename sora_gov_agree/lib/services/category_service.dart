import 'package:flutter/cupertino.dart';
import 'package:sora_gov_agree/helpers/db_helper.dart';
import 'package:sora_gov_agree/models/category.dart';
import 'package:sqflite/sqflite.dart';

class CategoryService {
  Future<List<Category>> getLocalData() async {
    DbHelper dbHelper = DbHelper.instance;
    Database db = await dbHelper.getDb();
    final result = await dbHelper.getCategories(db);
    try {
      return result.map((data) => Category.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception("Error gathering categories");
    }
  }

  Future<bool> insertCategory(
      {@required String name, @required String symbol}) async {
    try {
      DbHelper dbHelper = DbHelper.instance;
      Database db = await dbHelper.getDb();
      await dbHelper.insertCategory(db, name: name, symbol: symbol);
      return true;
    } catch (e) {
      print(e);
      throw Exception("Error inserting category");
    }
  }
}
