import 'dart:io';

import 'package:sora_gov_agree/helpers/db_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

class DbHelper {
  static const _DB_FILENAME = "SoraAgree.db";
  static const _DATABASE_VERSION = 1;

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  static const COL_CATEGORY_ID = "categoryId";
  static const COL_SUBCATEGORY_ID = "subcategoryId";
  static const COL_USER_ID = "userId";
  static const COL_ORG_ID = "orgId";
  static const COL_GROUP_ID = "groupId";
  static const COL_REFERENCE = "reference";
  static const COL_STATUS = "status";
  static const COL_KIND = "kind";
  static const COL_USER_PIC = "userPic";
  static const COL_USER_NAME = "userName";
  static const COL_NAME = "name";
  static const COL_NAME_EN = "nameEn";
  static const COL_NAME_LOCAL = "nameLocal";
  static const COL_PHOTO = "photo";
  static const COL_ADDRESS = "address";
  static const COL_LATITUDE = "latitude";
  static const COL_LONGITUDE = "longitude";
  static const COL_PROVINCE = "province";
  static const COL_CITY = "city";
  static const COL_DISTRICT = "district";
  static const COL_SHORT_DESCRIPTION = "shortDescription";
  static const COL_SHORT_DESCRIPTION_EN = "shortDescriptionEn";
  static const COL_LINK = "link";
  static const COL_SUSTAINABILITY_RATING = "sustainabilityRating";
  static const COL_IMPRESSIONS_COUNT = "impressionsCount";
  static const COL_TERMS = "terms";
  static const COL_MEASURE = "measure";
  static const COL_PAYMENT_CLASS = "paymentClass";
  static const COL_CURRENCY = "currency";
  static const COL_CURRENCY_PRICE = "currencyPrice";
  static const COL_MAXIMUM_PRICE = "maximumPrice";
  static const COL_MINIMUM_PRICE = "minimumPrice";
  static const COL_QUANTITY = "quantity";
  static const COL_URGENCY = "urgency";
  static const COL_STATE = "state";
  static const COL_FEATURED = "featured";
  static const COL_CREATED_AT = "createdAt";
  static const COL_UPDATED_AT = "updatedAt";
  static const COL_DELETED_AT = "deletedAt";
  static const COL_GENDER = "gender";
  static const COL_EMAIL = "email";
  static const COL_MOBILE = "mobile";
  static const COL_PROVIDER = "provider";
  static const COL_UID = "uid";
  static const COL_LOGISTICS = "logistics";

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
    path = join(databasesPath, '$_DB_FILENAME');

    // Make sure the directory exists
    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (_) {}

    return await openDatabase(path,
        version: _DATABASE_VERSION, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await _createCategoryTable(db, version);
    await _createSubCategoryTable(db, version);
    await _createProductTable(db, version);
  }

  Future<Database> getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        // Check again once entering the synchronized block
        if (_db == null) {
          _db = await openDatabase(path);
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
         (id INTEGER PRIMARY KEY, ${DbConstants.NAME} ${DbConstants.TEXT},
         ${DbConstants.SYMBOL} ${DbConstants.TEXT})
         """);
  }

  _createSubCategoryTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.SUB_CATEGORY_TABLE}
         (id INTEGER PRIMARY KEY, 
         ${DbConstants.NAME} ${DbConstants.TEXT},
         ${DbConstants.SYMBOL} ${DbConstants.TEXT})
         """);
  }

  // Product table
  //create product table. This table includes services
  _createProductTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.PRODUCT_TABLE}
         (
         ${DbConstants.ID} ${DbConstants.INTEGER} ${DbConstants.PRIMARY_KEY_AUTO_INCREMENT}, 
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
    $COL_LATITUDE ${DbConstants.TEXT},
    $COL_LONGITUDE ${DbConstants.TEXT},
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
    $COL_CURRENCY_PRICE ${DbConstants.TEXT},
    $COL_MAXIMUM_PRICE ${DbConstants.TEXT},
    $COL_MINIMUM_PRICE ${DbConstants.TEXT},
    $COL_QUANTITY ${DbConstants.TEXT},
    $COL_URGENCY ${DbConstants.TEXT},
    $COL_CREATED_AT ${DbConstants.TEXT},
    $COL_UPDATED_AT ${DbConstants.TEXT}
    )
    """);
  }
}
