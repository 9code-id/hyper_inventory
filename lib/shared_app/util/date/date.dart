import 'package:hyper_supabase/core.dart';

/*

var operator = arr[0]; // >= <
var value = arr[1]; // 0,40,
if (operator == "==") {
   return this.eq(fieldName, value);
} else if (operator == "<") {
   return this.lt(fieldName, value);
} else if (operator == "<=") {
   return this.lte(fieldName, value);
} else if (operator == ">") {
   return this.gt(fieldName, value);
} else if (operator == ">=") {
   return this.gte(fieldName, value);
} else if (operator != ">=") {
   return this.neq(fieldName, value);
}
*/

Future<num> sum(String tableName, String field) async {
  final response = await client.from(tableName).select(field).exec();
  var total = 0.0;
  for (var item in response) {
    total += item[field];
  }
  return total;
}

Future<num> sumToday(String tableName, String field) async {
  final response =
      await client.from(tableName).select(field).createdToday().exec();
  var total = 0.0;
  for (var item in response) {
    total += item[field];
  }
  return total;
}

Future<num> sumThisWeek(String tableName, String field) async {
  final response =
      await client.from(tableName).select(field).createdThisWeek().exec();
  var total = 0.0;
  for (var item in response) {
    total += item[field];
  }
  return total;
}

Future<num> sumThisMonth(String tableName, String field) async {
  final response =
      await client.from(tableName).select(field).createdThisMonth().exec();
  var total = 0.0;
  for (var item in response) {
    total += item[field];
  }
  return total;
}

Future<num> sumThisYear(String tableName, String field) async {
  final response =
      await client.from(tableName).select(field).createdThisYear().exec();
  var total = 0.0;
  for (var item in response) {
    total += item[field];
  }
  return total;
}

Future<List<Map<String, dynamic>>> monthlyChart(
    String tableName, String field) async {
  List<Map<String, dynamic>> month = [];

  for (var i = 1; i <= 12; i++) {
    var response = await client
        .from(tableName)
        .select(field)
        .gte("created_at", DateTime(now.year, i))
        .lt("created_at", DateTime(now.year, i + 1, 1))
        .exec();

    var total = 0.0;
    for (var item in response) {
      total += item[field];
    }

    month.add(
      {
        "label": DateTime(now.year, i).MMM,
        "value": total,
      },
    );
  }

  return month;
}
