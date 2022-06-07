import 'dart:'
    'async';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/models'
    '/tvseries_table.dart';


import 'package:'
    'sqflite'
    '/sqflite.dart';



class DatabaseHelperTvSeries {
  static DatabaseHelperTvSeries?
  _databaseHelperTvSeries;


  DatabaseHelperTvSeries._instance() {
    _databaseHelperTvSeries = this;
  }

  factory DatabaseHelperTvSeries() =>
      _databaseHelperTvSeries ?? DatabaseHelperTvSeries
          ._instance(
      );

  static Database? _databaseTvSeries;

  Future<Database?> get database async {
    _databaseTvSeries ??= await _initDb();
    return _databaseTvSeries;
  }

  static const String _tblTvSerieslist
  = 'tvserieslist';



  Future<
      Database> _initDb() async {
    final
    path
    = await getDatabasesPath(
    );


    final
    databasePath
    = '$path/ditontonTvSeries.db';



    var db
    = await openDatabase(
        databasePath,
        version: 1,
        onCreate: _onCreate
    );


    return db;
  }

  void _onCreate(
      Database db,
      int version)
  async {
    await db.execute('''
      CREATE TABLE  $_tblTvSerieslist (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      )
    ''');
  }

  //tv_series case database
  Future<
      int> insertWatchlistTvSeries(
      TvSeriesTable tv)
  async {
    final
    db =
    await database;


    return await db!
        .insert(_tblTvSerieslist,
        tv.toJson()
    );
  }

  Future<int> removeWatchlistTvSeries(
      TvSeriesTable tv)
  async {
    final
    db
    = await database;


    return await db!.delete(
      _tblTvSerieslist,
      where: 'id = ?',
      whereArgs: [
        tv
            .id],
    );
  }

  Future<Map<String,
      dynamic>?> getTvSeriesById(
      int id)
  async {
    final
    db = await database;


    final
    results
    = await db!.query(
      _tblTvSerieslist,
      where: 'id = ?',
      whereArgs: [id],
    );


    if (
    results
        .isNotEmpty) {
      return results
          .first;
    } else {
      return null;
    }
  }

  Future<List<Map<String,
      dynamic>>> getWatchlistTvSeries()
  async {
    final
    db
    = await database;


    final List<Map<String,
        dynamic>> results
    = await db!.query(
        _tblTvSerieslist
    );
    return results;
  }
}
