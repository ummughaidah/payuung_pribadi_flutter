import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Singleton untuk mendapatkan instance DatabaseHelper
  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();

  // referance to database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('payuung_pribadi.db');
    return _database!;
  }

  // inisialisasi database
  Future<Database> _initDB(String filePath) async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filePath);

    // open the database
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // create database
  Future _createDB(Database db, int version) async {
    // When creating the db, create the table
    // table wellness
    await db.execute('''
      CREATE TABLE wellness (
        id INTEGER PRIMARY KEY, 
        icon TEXT, 
        title TEXT, 
        note TEXT, 
        price TEXT, 
        buy_min TEXT, 
        buy_max TEXT, 
        description TEXT)
    ''');
    // table data user
    await db.execute('''
      CREATE TABLE data_user (
        id INTEGER PRIMARY KEY,
        name TEXT,
        birthday TEXT,
        gender TEXT,
        email TEXT,
        phone TEXT,
        study TEXT,
        marital_status TEXT,
        nik TEXT,
        address TEXT,
        province TEXT,
        city TEXT,
        subdistrict TEXT,
        ward TEXT,
        pos_code TEXT,
        company TEXT,
        company_address TEXT,
        position TEXT,
        length_of_work TEXT,
        source_of_income TEXT,
        gross_income TEXT,
        bank_name TEXT,
        bank_branch TEXT,
        rekening_number TEXT,
        account_owner_name TEXT
      )
    ''');
  }

  // insert data wellness to table
  Future<void> insertDataWellness() async {
    final db = await instance.database;

    // isi data manual
    List<Map<String, dynamic>> listDataWellness = [
      {
        'icon': 'assets/images/indomaret.jpeg',
        'title': 'Voucher Digital Indomaret Rp 25.000',
        'note': 'Voucher Digital',
        'price': 'Rp 25.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
      {
        'icon': 'assets/images/grab.jpeg',
        'title': 'Voucher Digital Grab Rp 20.000',
        'note': 'Voucher Digital',
        'price': 'Rp 20.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
      {
        'icon': 'assets/images/excelso.jpeg',
        'title': 'Voucher Digital Excelso Rp 50.000',
        'note': 'Voucher Digital',
        'price': 'Rp 50.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
      {
        'icon': 'assets/images/grab.jpeg',
        'title': 'Voucher Digital Grab Rp 50.000',
        'note': 'Voucher Digital',
        'price': 'Rp 50.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
      {
        'icon': 'assets/images/bakmi.jpeg',
        'title': 'Voucher Digital Bakmi GM Rp 100.000',
        'note': 'Voucher Digital',
        'price': 'Rp 100.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
      {
        'icon': 'assets/images/hdm.jpeg',
        'title': 'Voucher Digital H&M Rp 100.000',
        'note': 'Voucher Digital',
        'price': 'Rp 100.000',
        'buy_min': '1',
        'buy_max': '>50',
        'description': ''
      },
    ];

    // insert each item from the list
    for (var dataWellness in listDataWellness) {
      await db.insert(
        'wellness',
        dataWellness,
        conflictAlgorithm: ConflictAlgorithm.replace, // Mengatasi konflik data
      );
    }
  }

  // read data wellness
  Future<List<Map<String, dynamic>>> getDataWellness() async {
    final db = await instance.database;
    return await db.query('wellness');
  }
}
