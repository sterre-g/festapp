import 'package:cross_file/cross_file.dart';
import 'package:csv/csv.dart';
import 'package:fstapp/data/models/tb.dart';
import 'package:fstapp/data/services/db_occasions.dart';
import 'package:intl/intl.dart';

class ImportHelper {
  static Map<String, String> get migrateColumns => {
        Tb.occasion_users.data_email: "E-mailová adresa",
        Tb.occasion_users.data_sex: "Jsi:",
        Tb.occasion_users.data_name: "Jméno:",
        Tb.occasion_users.data_surname: "Příjmení:",
        Tb.occasion_users.services_accommodation: "Ubytování:",
        Tb.occasion_users.data_phone: "Mobilní telefon:",
        Tb.occasion_users.data_text1: "Typ účastníka:",
        Tb.occasion_users.data_text2: "Přípravný tým:",
        Tb.occasion_users.data_birthDate: "Datum narození:",
        Tb.occasion_users.data_note: "Poznámka:",
        Tb.occasion_users.data_diet: "Stravovací omezení:",
        Tb.occasion_users.services_food: "Stravování:",
      };

  static int getIndex(String s, List<String> row) {
    return row.indexOf(migrateColumns[s]!);
  }

  static Future<List<Map<String, dynamic>>> getUsersFromFile(XFile file) async {
    final rawData = await file.readAsString();
    final fields = const CsvToListConverter().convert(rawData);

    List<Map<String, dynamic>> userList = [];

    var firstRow = fields[0].map((e) => e.toString()).toList();
    Map<String, int> userColumnIndex = {};
    for (var keyValue in migrateColumns.entries) {
      var index = firstRow.indexOf(keyValue.value);
      if (index == -1) {
        continue;
      }
      userColumnIndex[keyValue.key] = index;
    }

    if (!userColumnIndex.keys.toSet().containsAll([
      Tb.occasion_users.data_email,
      Tb.occasion_users.data_name,
      Tb.occasion_users.data_surname,
    ])) {
      throw Exception("Table doesn't contain required columns.");
    }

    for (int r = 1; r < fields.length; r++) {
      Map<String, dynamic> userJsonObject = {};
      for (var entry in userColumnIndex.entries) {
        var trimmedString = fields[r][entry.value].toString().trim();
        if (entry.key == Tb.occasion_users.data_email) {
          if (trimmedString.isEmpty) {
            break;
          }
          trimmedString = trimmedString.toLowerCase();
        } else if (entry.key == Tb.occasion_users.role) {
          if (trimmedString.isEmpty) {
            break;
          }
          var role = trimmedString.toLowerCase().startsWith("p") ? 1 : 2;
          userJsonObject[entry.key] = role;
          continue;
        } else if (entry.key == Tb.occasion_users.data_sex) {
          if (trimmedString.isEmpty) {
            break;
          }
          trimmedString =
          (trimmedString.toLowerCase().startsWith("m") || trimmedString.toLowerCase().startsWith("k")) ? "male" : "female";
        } else if (entry.key == Tb.occasion_users.data_birthDate) {
          if (trimmedString.isEmpty) {
            continue;
          }
          final format = DateFormat("d.M.y");
          var dateTime = format.parse(trimmedString);
          userJsonObject[entry.key] = dateTime.toIso8601String();
          continue;
        } else if (entry.key == Tb.occasion_users.services_food) {
          var foodJson = createServicesJson(trimmedString, DbOccasions.serviceTypeFood);
          userJsonObject[Tb.occasion_users.services] = addJson(userJsonObject[Tb.occasion_users.services], foodJson);
          continue;
        } else if (entry.key == Tb.occasion_users.services_accommodation) {
          var accommodationJson = createServicesJson(trimmedString, DbOccasions.serviceTypeAccommodation);
          userJsonObject[Tb.occasion_users.services] = addJson(userJsonObject[Tb.occasion_users.services], accommodationJson);
          continue;
        }

        userJsonObject[entry.key] = trimmedString;
        continue;
      }
      if (!userJsonObject.keys.toSet().containsAll([
        Tb.occasion_users.data_email,
        Tb.occasion_users.data_name,
        Tb.occasion_users.data_surname,
      ])) {
        continue;
      }
      if (userList.any((element) =>
          element[Tb.occasion_users.data_email] ==
          userJsonObject[Tb.occasion_users.data_email])) {
        //omit with duplicate email
        continue;
      }
      userList.add(userJsonObject);
    }
    return userList;
  }

  static Map<String, dynamic> createServicesJson(String data, String serviceType) {
    List<String> items = data.split(',').map((item) => item.trim()).toList();

    Map<String, String> servicesMap = {
      for (var item in items) item: DbOccasions.servicePaid,
    };

    return { serviceType: servicesMap };
  }

  static Map<String, dynamic> addJson(
      Map<String, dynamic>? existingJson, Map<String, dynamic> newJson) {
    existingJson ??= {};

    // Merge new JSON into existing JSON
    newJson.forEach((key, value) {
      if (existingJson![key] is Map && value is Map) {
        existingJson[key] = addJson(existingJson[key] as Map<String, dynamic>,
            value as Map<String, dynamic>);
      } else {
        existingJson[key] = value;
      }
    });

    return existingJson;
  }
}
