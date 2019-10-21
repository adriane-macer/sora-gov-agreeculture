import 'package:flutter/material.dart';
import 'package:sora_gov_agree/helpers/db_helper.dart';
import 'package:sora_gov_agree/models/subcategory.dart';
import 'package:sqflite/sqflite.dart';

class SubcategoryService {

  Future<List<Subcategory>> getLocalData(int categoryId) async {
    DbHelper dbHelper = DbHelper.instance;
    Database db = await dbHelper.getDb();
    final result = await dbHelper.getSubcategories(db, categoryId: categoryId);
    try {
      return result.map((data) => Subcategory.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception("Error gathering categories");
    }
  }

  Future<bool> insertSubcategory(
      {@required String name, @required String symbol, @required int categoryId}) async {
    try {
      DbHelper dbHelper = DbHelper.instance;
      Database db = await dbHelper.getDb();
      await dbHelper.insertSubcategory(
          db, name: name, symbol: symbol, categoryId: categoryId);
      return true;
    } catch (e) {
      print(e);
      throw Exception("Error inserting category");
    }
  }
}