import 'dart:io';

import 'package:sora_gov_agree/helpers/db_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

class DbHelper {
  static const _DB_FILENAME = "SoraAgree.db";
  static const _DATABASE_VERSION = 1;

  static const table = 'my_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  static const CATEGORY = "category";
  static const SUB_CATEGORY_ID = "subcategoryId";
  static const USER_ID = "userId";
  static const ORG_ID = "orgId";
  static const GROUP_ID = "groupId";
  static const REFERENCE = "reference";
  static const STATUS = "status";
  static const KIND = "kind";
  static const USER_PIC = "userPic";
  static const USER_NAME = "userName";
  static const NAME_EN = "nameEn";
  static const NAME_LOCAL = "nameLocal";
  static const PHOTO = "photo";
  static const ADDRESS = "address";
  static const LATITUDE = "latitude";
  static const LONGITUDE = "longitude";
  static const PROVINCE = "province";
  static const CITY = "city";
  static const DISTRICT = "district";
  static const SHORT_DESCRIPTION = "shortDescription";
  static const SHORT_DESCRIPTION_EN = "shortDescriptionEn";
  static const LINK = "link";
  static const SUSTAINABILITY_RATING = "sustainabilityRating";
  static const IMPRESSIONS_COUNT = "impressionsCount";
  static const TERMS = "terms";
  static const MEASURE = "measure";
  static const PAYMENT_CLASS = "paymentClass";
  static const CURRENCY = "currency";
  static const CURRENCY_PRICE = "currencyPrice";
  static const MAXIMUM_PRICE = "maximumPrice";
  static const MINIMUM_PRICE = "minimumPrice";
  static const STATE = "state";
  static const FEATURED = "featured";
  static const CREATED_AT = "createdAt";
  static const UPDATED_AT = "updatedAt";
  static const DELETED_AT = "deletedAt";
  static const GENDER = "gender";
  static const EMAIL = "email";
  static const MOBILE = "mobile";
  static const PROVIDER = "provider";
  static const UID = "uid";
  static const LOGISTICS = "logistics";

  var databasesPath;
  String path;
  Database _db;
  final _lock = new Lock();

  DbHelper._privateConstructor();

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
         (id INTEGER PRIMARY KEY, ${DbConstants.NAME} TEXT,
         ${DbConstants.SYMBOL} TEXT)
         """);
  }

  _createSubCategoryTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.SUB_CATEGORY_TABLE}
         (id INTEGER PRIMARY KEY, 
         ${DbConstants.NAME} TEXT,
         ${DbConstants.SYMBOL} TEXT)
         """);
  }

  // Product table
  //create product table
  _createProductTable(Database db, int version) async {
    await db.execute("""
        CREATE TABLE ${DbConstants.PRODUCT_TABLE}
         (id INTEGER PRIMARY KEY AUTO INCREMENT, 
      $CATEGORY TEXT,
  $SUB_CATEGORY_ID INTEGER,
  $USER_ID INTEGER,
  $ORG_ID INTEGER,
  $GROUP_ID INTEGER,
  $REFERENCE INTEGER,
  $STATUS TEXT,
  $KIND TEXT,
  $USER_PIC TEXT,
  $USER_NAME TEXT,
  $NAME_EN TEXT,
  $NAME_LOCAL TEXT,
  $PHOTO TEXT,
  $ADDRESS TEXT,
  $LATITUDE TEXT,
  $LONGITUDE TEXT,
  $PROVINCE TEXT,
  $CITY TEXT,
  $DISTRICT TEXT,
  $SHORT_DESCRIPTION TEXT,
  $SHORT_DESCRIPTION_EN TEXT,
  $LINK TEXT,
  $SUSTAINABILITY_RATING TEXT,
  $IMPRESSIONS_COUNT TEXT,
  $TERMS TEXT,
  $MEASURE TEXT,
  $PAYMENT_CLASS TEXT,
  $CURRENCY TEXT,
  $CURRENCY_PRICE TEXT,
  $MAXIMUM_PRICE TEXT,
  $MINIMUM_PRICE TEXT,
  $STATE TEXT,
  $FEATURED TEXT,
  $CREATED_AT TEXT,
  $UPDATED_AT TEXT,
  $DELETED_AT TEXT,
  $GENDER TEXT,
  $EMAIL TEXT,
  $MOBILE TEXT,
  $PROVIDER TEXT,
  $UID TEXT,
  $LOGISTICS TEXT,
         )
         """);
  }
}
