import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';
class DatabaseHelper {

    static const int _version = 1;
    static const String _dbName = "Food.db";

    static Future<Database> getDB() async{
      return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db ,version) async =>
        await db.execute(
          '''
          CREATE TABLE User (
              name varchar(30)
          );
                    
        CREATE TABLE Location (
            latitude int not null,
            longitude int not null,
            primary key (latitude, longitude)
        );
                  
        CREATE TABLE MarketChain (
    market_chain_name varchar(30) not null,
    primary key (market_chain_name)
      );

            CREATE TABLE Market (
        market_chain_name varchar(3) REFERENCES MarketChain(market_chain_name),
        maket_name varchar(30) not null,
        market_latitude int not null,
        market_longitude int not null,
        is_favorite bool default 0,
        store_image varchar(30),
        primary key (maket_name),
        foreign key (market_latitude, market_longitude) REFERENCES Location(latitude, longitude),
        check(is_favorite=1 or is_favorite=0)
        );

          CREATE TABLE Product (
            maket_name varchar(30) not null,
            product_name varchar(30) not null,
            old_price float not null,
            new_price float default 0.0,
            quantity int default 0,
            expiration_date date not null,
            is_available bool default 1,
            to_buy bool default 0,
            product_image varchar(30),
            category varchar(30),
            primary key (product_name),
            check(quantity>=0),
            check(old_price>0.0),
            check(new_price>=0.0),
            check(is_available=1 or is_available=0),
            check(to_buy=1 or to_buy=0)
        );
                    
          '''
        ), version: _version
        );
    }


    static Future<int> addUser(User user) async {
      final db = await getDB();
      return await db.insert("User", user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    }

    static Future<int> updateUser(User user) async {
      final db = await getDB();
      return await db.update("User", user.toJson(),
      where: 'user_name = ?',
      whereArgs: [user.user_name],
      conflictAlgorithm: ConflictAlgorithm.replace);
    }


    static Future<int> deleteUser(User user) async {
      final db = await getDB();
      return await db.delete("User",
      where: 'user_name = ?',
      whereArgs: [user.user_name],
      );
    }

    static Future<List<User>?> getAllusers() async {
      final db = await getDB();

      final List<Map<String, dynamic>> maps = await db.query("User");

      if(maps.isEmpty){
        return null;
      }

      return List.generate(maps.length, (index) => User.fromJson(maps[index]));
    }
    
}