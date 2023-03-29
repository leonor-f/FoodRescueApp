import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  //create creditials for google sheets
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "enduring-art-380011",
  "private_key_id": "2b452976888f5457e180fd51b94e99c0873c3cc9",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCq3iWaRibXvOMv\nzbMX+6cBeArLI1F8WyE9cezy+ZTAfbFuzRvcfkzPWyKJCg1S7yhtR6e5nH5JlwqN\n9VdFJoR47XquVEGA6Rz+T1IqJHE7JePvm+MuAKty2OX7Y4mj7Dfz6ZMlCAelL/LX\n655/i6gizhKig8tuXz1RP8VL7pTkCx1F7Gop6U2y97xfXz3Bs4JAxeMYH4bPdZ5H\nHdK9GKpppLHWHYA8lYK0Q63FUiLgllHMDvkykPRAEE28+QWyPUygDRjPDSAEa9DW\ngMAQ+vrUvQ7FgKF45bbYgPxKG7hj430+AJ3K/5+s7y1FRDO4+NM9nR48e3r8ewoA\n+kaV0gnRAgMBAAECggEALg5c8l2QYLxgPGVkrcU+Oc4ikqi9cRibOBW6Oa/+YXg/\n2E7fAKrmh0nYYDneZ4lhSztyQTymaa2Vwbfsww3jzTitxcmeMmIjV4UH76YNA1Vu\nQAqzzJWPoRBHxWAKHK4yUsOVzviAHw1ylrLC8TwyoNcM/NMrhV+Uho763kG7zk+i\n+EBP8gdtEPcZm6AEb7RtBuE9laXC5W8fLj0Qa6wmDqvX4rl6UedKVOj1OPOVPrqw\nsCMZAr/bm94b2aTqqWavDCVCBijiht8ONVQ9THRaSzFXxEZIN2TiBnvMIqEuIxLy\nFx37Sl5l9gOXM8KMN+n1/nkBH30qT3Vwc3ucNheJpQKBgQDtWZlU+bkl6NxDYk4H\nHQqaZkZgrr3pwAOgrUn1vcl8nymLGV/d0NWaRb3Odw9tXDNrjDnDDBFpHLScoxVI\nxGpscnZWlt8KK9zuONAl/C/ghbNRr4ti6pILBJ/mF1CCiTJ+dTB+zj3vJprN5Iah\nHzxoFX07UAgarDIlSXwcfkWDXwKBgQC4SzpmcIbjZXkRVOw6qVe5yzDTc8Cky9Ne\nFTzCxU3oUbih7MpuIOPUfOjDaPjXP/TTvuMBdb30f5p5lgudiO0G8kxIPBvQx+m4\nMUigrfL8+9DuSptBv7bCznnwS7rWfmBnOhS0mNMiECPOlXr0HCzgl9QSC1QtkXzR\nv3occeUwzwKBgEoSrWS0rtCi9KLe+iUELjvzcUFZJ5HcyAUML8nOmiQXdBqiJ6YN\nN6x22X6m75ycqruEvr4ddQ2N1NwRlWHpUqFXs5Dgcuk0uTVra6J/Kt3yO/1hQKn1\nNPDVV6WyXwDuGmEW57SbXv7U2HkrOczs96gwFK4/EthoJxo17dLioYUXAoGADMib\nGnP/x1JInZ0obcFFZovjrSdAW64P0VzjxBbvmofgqMrGF/GMHDc15ign6rZzAyUg\nlf9W19jqHDj+QUU4O90e0Xvp6geT/MTeZtbqHgZRrdXbAyqLQOQVrUdzhGFryn1K\n5mQbcSdxdGkGCFzT+BhQC5hhlG+dGuePTt3Pqh0CgYBYyMalmGCsubmKIjEUNz1S\nWp/RMnGCSiow0wX2P3eJhGqH287lL3oZ6ecnJQ+RP99nL8GgCO3ZdfqdSGGWhoLg\n+IyIUS6nxnCVuWikliE2TaUWRuyWWfWu63c1A9qC3p75JCOFCiSNeQnAHilb4EfW\n/JjcOsgKcHKd3+1mVGo0/A==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets-api@enduring-art-380011.iam.gserviceaccount.com",
  "client_id": "118018013072874660198",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets-api%40enduring-art-380011.iam.gserviceaccount.com"
}
  ''';

  //spreadsheet id
  static final _spreadsheetId = '12rzuZUp6HtKArHAkBX3-Mjg9G2LiAHf4K5WJr5ihnLM';
  var _worksheet;
  var products_worksheet;
  
  //some variables
  static String supermarket = '';
  static String favourite = 'sim';
  static int numberOfStores = 0;
  static List<List<dynamic>> currentFavoriteStores = [];
  static bool loading = true;
  
  static String produto = '';
  static int numberOfProducts = 0;
  static List<List<dynamic>> currentFavoriteProducts = [];

  //initialise the spreadsheet
  Future init() async {
    final _gsheets = GSheets(_credentials);
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Lojas');
    _worksheet ??= await ss.addWorksheet('Lojas');
    countRows(_worksheet);

    products_worksheet = ss.worksheetByTitle('Produtos');
    products_worksheet ??= await ss.addWorksheet('Produtos');
    countProductRows(products_worksheet);
  }

  static Future countRows(_worksheet) async {
    while (
        (await _worksheet.values.value(column: 1, row: numberOfStores + 1)) !=
            '') {
      numberOfStores++;
    }

    loadStores(_worksheet);
  }

  static Future loadStores(_worksheet) async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfStores; i++) {
      final String storeName =
          await _worksheet!.values.value(column: 2, row: i + 1);
      sleep(const Duration(seconds: 3));
      final String isFavorite =
          await _worksheet!.values.value(column: 5, row: i + 1);
      final String storeImage =
          await _worksheet!.values.value(column: 6, row: i + 1);

      if (currentFavoriteStores.length < numberOfStores &&
          favourite == isFavorite) {
        currentFavoriteStores.add([storeName, storeImage]);
      }
    }
    // this will stop the circular loading indicator
    loading = false;
  }
  
  static Future countProductRows(products_worksheet) async {
    while (
        (await products_worksheet.values.value(column: 1, row: numberOfProducts + 1)) !=
            '') {
      numberOfProducts++;
    }

    loadProducts(products_worksheet);
  }

  static Future loadProducts(products_worksheet) async {
    if (products_worksheet == null) return;

    for (int i = 1; i < numberOfProducts; i++) {
      final String ProductName =
          await products_worksheet!.values.value(column: 2, row: i + 1);
      sleep(const Duration(seconds: 3));
      final String isFavorite =
          await products_worksheet!.values.value(column: 9, row: i + 1);
      final double ProductPrice =
          await products_worksheet!.values.value(column: 6, row: i + 1);

      if (currentFavoriteProducts.length < numberOfProducts &&
          favourite == isFavorite) {
        currentFavoriteProducts.add([ProductName, ProductPrice]);
      }
    }
    // this will stop the circular loading indicator
    loading = false;
  }
}
