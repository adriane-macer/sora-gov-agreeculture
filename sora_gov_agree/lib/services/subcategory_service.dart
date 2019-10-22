import 'package:flutter/material.dart';
import 'package:sora_gov_agree/helpers/db_helper.dart';
import 'package:sora_gov_agree/models/subcategory.dart';
import 'package:sqflite/sqflite.dart';

class SubcategoryService {

  Future<List<Subcategory>> getSubcategoriesByCategoryLocal(int categoryId) async {
    DbHelper dbHelper = DbHelper.instance;
    Database db = await dbHelper.getDb();
    final result = await dbHelper.getSubcategoriesByCategory(db, categoryId: categoryId);
    try {
      return result.map((data) => Subcategory.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception("Error gathering sucategories by category");
    }
  }

  Future<List<Subcategory>> getSubCategories() async {
    DbHelper dbHelper = DbHelper.instance;
    Database db = await dbHelper.getDb();
    final result = await dbHelper.getSubcategories(db);
    try {
      return result.map((data) => Subcategory.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception("Error gathering subcategories");
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