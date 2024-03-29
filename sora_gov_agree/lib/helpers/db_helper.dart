import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sora_gov_agree/helpers/db_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

class DbHelper {
  static const _DB_FILENAME = "sora_agreeculture.db";
  static const _DATABASE_VERSION = 1;

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  static const COL_CATEGORY_ID = "category_id";
  static const COL_SUBCATEGORY_ID = "subcategory_id";
  static const COL_USER_ID = "user_id";
  static const COL_ORG_ID = "org_id";
  static const COL_GROUP_ID = "group_id";
  static const COL_REFERENCE = "reference";
  static const COL_STATUS = "status";
  static const COL_KIND = "kind";
  static const COL_USER_PIC = "userPic";
  static const COL_USER_NAME = "user_name";
  static const COL_NAME = "name";
  static const COL_NAME_EN = "name_en";
  static const COL_NAME_LOCAL = "name_local";
  static const COL_PHOTO = "photo";
  static const COL_ADDRESS = "address";
  static const COL_LATITUDE = "latitude";
  static const COL_LONGITUDE = "longitude";
  static const COL_PROVINCE = "province";
  static const COL_CITY = "city";
  static const COL_DISTRICT = "district";
  static const COL_SHORT_DESCRIPTION = "short_description";
  static const COL_SHORT_DESCRIPTION_EN = "short_description_en";
  static const COL_LINK = "link";
  static const COL_SUSTAINABILITY_RATING = "sustainability_rating";
  static const COL_IMPRESSIONS_COUNT = "impressions_count";
  static const COL_TERMS = "terms";
  static const COL_MEASURE = "measure";
  static const COL_PAYMENT_CLASS = "payment_class";
  static const COL_CURRENCY = "currency";
  static const COL_CURRENCY_PRICE = "currency_price";
  static const COL_MAXIMUM_PRICE = "maximum_price";
  static const COL_MINIMUM_PRICE = "minimum_price";
  static const COL_QUANTITY = "quantity";
  static const COL_URGENCY = "urgency";
  static const COL_STATE = "state";
  static const COL_FEATURED = "featured";
  static const COL_CREATED_AT = "created_at";
  static const COL_UPDATED_AT = "updated_at";
  static const COL_DELETED_AT = "deleted_at";
  static const COL_GENDER = "gender";
  static const COL_EMAIL = "email";
  static const COL_MOBILE = "mobile";
  static const COL_PROVIDER = "provider";
  static const COL_UID = "uid";
  static const COL_LOGISTICS = "logistics";
  static const COL_BREED_PLANT_DATE = "breed_plant_date";
  static const COL_TARGET_HARVEST_SELL_DATE = "target_harvest_sell_date";

  static const COL_SYMBOL = "symbol";

  var databasesPath;
  String path;
  Database _db;
  final _lock = new Lock();

  DbHelper._privateConstructor() {
    _initializeDb();
  }

  static final DbHelper instance = DbHelper._privateConstructor();

  Future _initializeDb() async {
    databasesPath = await getDatabasesPath();
    path = join('$databasesPath', '$_DB_FILENAME');

    // Make sure the directory exists
    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (_) {}

    _db = await openDatabase(path,
        version: _DATABASE_VERSION, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await _createCategoryTable(db, version);
    await _createSubCategoryTable(db, version);
    await _createProductTable(db, version);
    //initial list of categories
    await insertCategory(db, name: "Animal", symbol: "A"); //1
    await insertCategory(db, name: "Fish", symbol: "F"); //2
    await insertCategory(db, name: "Grain", symbol: "G"); //3
    await insertCategory(db, name: "Meat", symbol: "M"); //4
    await insertCategory(db, name: "Oil", symbol: "O"); //5
    await insertCategory(db, name: "Plant", symbol: "PL"); //6
    await insertCategory(db, name: "Veggy", symbol: "V"); //7
    await insertCategory(db, name: "Fruit", symbol: "FR"); //8
    await insertCategory(db, name: "Service", symbol: "S"); //9
    await insertCategory(db, name: "Needed Service", symbol: "NS"); //10
    //initial list of Subcategories
    await insertSubcategory(db, name: "Broiler", symbol: "B", categoryId: 1);
    await insertSubcategory(db, name: "Hog", symbol: "H", categoryId: 1);

    await insertSubcategory(db, name: "Tilapia", symbol: "T", categoryId: 2);
    await insertSubcategory(db, name: "Bangus", symbol: "BNG", categoryId: 2);

    await insertSubcategory(db, name: "Rice", symbol: "R", categoryId: 3);

    await insertSubcategory(db, name: "Pork", symbol: "P", categoryId: 4);

    await insertSubcategory(db,
        name: "Coconut oil", symbol: "CO", categoryId: 5);

    await insertSubcategory(db, name: "Brocolli", symbol: "BR", categoryId: 7);

    await insertSubcategory(db, name: "Pineapple", symbol: "PA", categoryId: 8);
  }

  Future<Database> getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        // Check again once entering the synchronized block
        if (_db == null) {
          if (path == null) {
            databasesPath = await getDatabasesPath();
            path = join('$databasesPath', '$_DB_FILENAME');
          }
          _db = await openDatabase(path,
              version: _DATABASE_VERSION, onCreate: _onCreate);
        }
      });
    }
    return _db;
  }

  Future<bool> isDatabase(String path) async {
    Database db;
    bool isDatabase = false;
    try {
      db = await openReadOnlyDatabase(path);
      int version = await db.getVersion();
      if (version != null) {
        isDatabase = true;
      }
    } catch (_) {} finally {
      await db?.close();
    }
    return isDatabase;
  }

  _createCategoryTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.CATEGORY_TABLE}
         (
          ${DbConstants.ID} ${DbConstants.INTEGER_PRIMARY_KEY_AUTO_INCREMENT}, 
          ${DbConstants.NAME} ${DbConstants.TEXT},
          ${DbConstants.SYMBOL} ${DbConstants.TEXT}
         )
         """);
  }

  _createSubCategoryTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.SUB_CATEGORY_TABLE}
         (
         ${DbConstants.ID} ${DbConstants.INTEGER_PRIMARY_KEY_AUTO_INCREMENT}, 
         ${DbConstants.NAME} ${DbConstants.TEXT},
         ${DbConstants.SYMBOL} ${DbConstants.TEXT},
         $COL_CATEGORY_ID ${DbConstants.INTEGER}
         )
         """);
  }

  // Product table
  //create product table. This table includes services
  _createProductTable(Database db, int version) async {
    await db.execute("""
      CREATE TABLE ${DbConstants.PRODUCT_TABLE}
       (
       ${DbConstants.ID} ${DbConstants.INTEGER_PRIMARY_KEY_AUTO_INCREMENT}, 
      $COL_CATEGORY_ID ${DbConstants.INTEGER},
      $COL_SUBCATEGORY_ID ${DbConstants.INTEGER},
      $COL_USER_ID ${DbConstants.INTEGER},
      $COL_ORG_ID ${DbConstants.INTEGER},
      $COL_GROUP_ID ${DbConstants.INTEGER},
      $COL_REFERENCE ${DbConstants.TEXT},
      $COL_STATUS ${DbConstants.TEXT},
      $COL_KIND ${DbConstants.TEXT},
      $COL_USER_PIC ${DbConstants.TEXT},
      $COL_USER_NAME ${DbConstants.TEXT},
      $COL_NAME ${DbConstants.TEXT},
      $COL_NAME_EN ${DbConstants.TEXT},
      $COL_NAME_LOCAL ${DbConstants.TEXT},
      $COL_PHOTO ${DbConstants.TEXT},
      $COL_ADDRESS ${DbConstants.TEXT},
      $COL_LATITUDE ${DbConstants.REAL},
      $COL_LONGITUDE ${DbConstants.REAL},
      $COL_PROVINCE ${DbConstants.TEXT},
      $COL_CITY ${DbConstants.TEXT},
      $COL_DISTRICT ${DbConstants.TEXT},
      $COL_SHORT_DESCRIPTION ${DbConstants.TEXT},
      $COL_SHORT_DESCRIPTION_EN ${DbConstants.TEXT},
      $COL_LINK ${DbConstants.TEXT},
      $COL_SUSTAINABILITY_RATING ${DbConstants.TEXT},
      $COL_IMPRESSIONS_COUNT ${DbConstants.TEXT},
      $COL_TERMS ${DbConstants.TEXT},
      $COL_MEASURE ${DbConstants.TEXT},
      $COL_PAYMENT_CLASS ${DbConstants.TEXT},
      $COL_CURRENCY ${DbConstants.TEXT},
      $COL_CURRENCY_PRICE ${DbConstants.REAL},
      $COL_MAXIMUM_PRICE ${DbConstants.REAL},
      $COL_MINIMUM_PRICE ${DbConstants.REAL},
      $COL_QUANTITY ${DbConstants.REAL},
      $COL_URGENCY ${DbConstants.TEXT},
      $COL_CREATED_AT ${DbConstants.TEXT},
      $COL_UPDATED_AT ${DbConstants.TEXT},
      $COL_BREED_PLANT_DATE ${DbConstants.TEXT},
      $COL_TARGET_HARVEST_SELL_DATE ${DbConstants.TEXT}
    )
    """);
  }

  insertCategory(Database db,
      {@required String name, @required String symbol}) async {
    Batch batch = db.batch();
    batch.insert(DbConstants.CATEGORY_TABLE, {
      COL_NAME: name,
      COL_SYMBOL: symbol,
    });
    return await batch.commit();
  }

  insertSubcategory(Database db,
      {@required String name,
      @required String symbol,
      @required int categoryId}) async {
    Batch batch = db.batch();
    batch.insert(DbConstants.SUB_CATEGORY_TABLE, {
      COL_NAME: name,
      COL_SYMBOL: symbol,
      COL_CATEGORY_ID: categoryId,
    });
    return await batch.commit();
  }

  insertProduct(Database db,
      {@required int categoryId,
      @required int subcategoryId,
      int userId,
      int orgId,
      int groupId,
      String reference,
      String status,
      String kind,
      String userPic,
      String userName,
      String name,
      String nameEn,
      String nameLocal,
      String photo,
      String address,
      double latitude,
      double longitude,
      String province,
      String city,
      String district,
      @required String shortDescription,
      String shortDescriptionEn,
      String link,
      String sustainabilityRating,
      String impressionsCount,
      String terms,
      String measure,
      String paymentClass,
      double currency,
      double currencyPrice,
      double maximumPrice,
      double minimumPrice,
      double quantity,
      String urgency,
      String state,
      String featured,
      String createdAt,
      String updatedAt,
      String deletedAt,
      String gender,
      String email,
      String mobile,
      String provider,
      String uid,
      String logistics,
      String breedPlantDate,
      String targetHarvestSellDate}) async {
    return await db.transaction((txn) async {
      Batch batch = txn.batch();
      batch.insert(DbConstants.PRODUCT_TABLE, {
        COL_CATEGORY_ID: categoryId,
        COL_SUBCATEGORY_ID: subcategoryId,
        COL_USER_ID: userId,
        COL_ORG_ID: orgId,
        COL_GROUP_ID: groupId,
        COL_REFERENCE: reference,
        COL_STATUS: status,
        COL_KIND: kind,
        COL_USER_PIC: userPic,
        COL_USER_NAME: userName,
        COL_NAME: name,
        COL_NAME_EN: nameEn,
        COL_NAME_LOCAL: nameLocal,
        COL_PHOTO: photo,
        COL_ADDRESS: address,
        COL_LATITUDE: latitude,
        COL_LONGITUDE: longitude,
        COL_PROVINCE: province,
        COL_CITY: city,
        COL_DISTRICT: district,
        COL_SHORT_DESCRIPTION: shortDescription,
        COL_SHORT_DESCRIPTION_EN: shortDescriptionEn,
        COL_LINK: link,
        COL_SUSTAINABILITY_RATING: sustainabilityRating,
        COL_IMPRESSIONS_COUNT: impressionsCount,
        COL_TERMS: terms,
        COL_MEASURE: measure,
        COL_PAYMENT_CLASS: paymentClass,
        COL_CURRENCY: currency,
        COL_CURRENCY_PRICE: currencyPrice,
        COL_MAXIMUM_PRICE: maximumPrice,
        COL_MINIMUM_PRICE: minimumPrice,
        COL_QUANTITY: quantity,
        COL_URGENCY: urgency,
        COL_CREATED_AT: createdAt,
        COL_UPDATED_AT: updatedAt,
        COL_BREED_PLANT_DATE: breedPlantDate,
        COL_TARGET_HARVEST_SELL_DATE: targetHarvestSellDate
      });
      return await batch.commit();
    });
  }

  Future<List<Map>> getCategories(Database db) async {
    return await db.transaction((txn) async {
      final result =
          await txn.rawQuery('SELECT * FROM ${DbConstants.CATEGORY_TABLE}');
      return result;
    });
  }

  Future<List<Map>> getSubcategoriesByCategory(Database db,
      {@required int categoryId}) async {
    return await db.transaction((txn) async {
      final result = await txn.rawQuery(
          'SELECT * FROM ${DbConstants.SUB_CATEGORY_TABLE} WHERE $COL_CATEGORY_ID IN (?)',
          [categoryId]);
      return result;
    });
  }

  Future<List<Map>> getSubcategories(Database db) async {
    return await db.transaction((txn) async {
      final result =
          await txn.rawQuery('SELECT * FROM ${DbConstants.SUB_CATEGORY_TABLE}');
      return result;
    });
  }

  Future<List<Map>> getProducts(Database db) async {
    return await db.transaction((txn) async {
      return await txn.rawQuery('SELECT * FROM ${DbConstants.PRODUCT_TABLE}');
    });
  }
}
