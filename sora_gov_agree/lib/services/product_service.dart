import 'package:flutter/cupertino.dart';
import 'package:sora_gov_agree/helpers/db_helper.dart';
import 'package:sora_gov_agree/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductService {
  Future<List<Product>> getLocalData() async {
    DbHelper dbHelper = DbHelper.instance;
    Database db = await dbHelper.getDb();
    final result = await dbHelper.getProducts(db);
    print(result);
    try {
      return result.map((data) => Product.fromJson(data)).toList();
    } catch (e) {
      print(e);
      throw Exception("Error gathering products $e");
    }
  }

  Future<bool> insertProduct({
    @required String name,
    @required categoryId,
    @required subCategoryId,
    shortDescriptionEn,
    @required shortDescription,
    city,
    breedPlantDate,
    targetHarvestSellDate,
  }) async {
    try {
      DbHelper dbHelper = DbHelper.instance;
      Database db = await dbHelper.getDb();
      await dbHelper.insertProduct(db,
          name: name,
          shortDescriptionEn: shortDescriptionEn,
          categoryId: categoryId,
          shortDescription: shortDescription,
          subcategoryId: subCategoryId,
          city: city,
          breedPlantDate: breedPlantDate,
          targetHarvestSellDate: targetHarvestSellDate);
      return true;
    } catch (e) {
      print(e);
      throw Exception("Error inserting Product");
    }
  }
}
