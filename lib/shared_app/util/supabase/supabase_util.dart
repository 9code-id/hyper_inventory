import 'package:hyper_supabase/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseExt11
    on PostgrestTransformBuilder<List<Map<String, dynamic>>> {
  Stream<List<Map<String, dynamic>>> snapshot() {
    return this.asStream();
  }
}

extension SupabaseExt on PostgrestTransformBuilder<List<Map<String, dynamic>>> {
  PostgrestTransformBuilder<List<Map<String, dynamic>>> exec() {
    return this;
  }
}

extension SupabaseExt4 on PostgrestTransformBuilder {
  PostgrestTransformBuilder exec() {
    return this;
  }
}

// extension SupabaseExt3 on PostgrestTransformBuilder {
//   PostgrestTransformBuilder exec() {
//     return this;
//   }
// }

extension SupabaseStringExtension
    on PostgrestFilterBuilder<List<Map<String, dynamic>>> {
  PostgrestFilterBuilder<List<Map<String, dynamic>>> createdThisYear() {
    return this
        .gte('created_at', DateTime(now.year, 1, 1))
        .lt('created_at', DateTime(now.year + 1, 1, 1));
  }

  PostgrestFilterBuilder<List<Map<String, dynamic>>> createdThisMonth() {
    return this
        .gte('created_at', dateStartThisMonth)
        .lt('created_at', dateEndThisMonth);
  }

  PostgrestFilterBuilder<List<Map<String, dynamic>>> createdThisWeek() {
    return this
        .gte('created_at', dateStartThisWeek.start)
        .lte('created_at', dateEndThisWeek.end);
  }

  PostgrestFilterBuilder<List<Map<String, dynamic>>> createdToday() {
    return this.gte('created_at', now.start).lte('created_at', now.end);
  }

  PostgrestFilterBuilder<List<Map<String, dynamic>>> eqo(
    String fieldName,
    dynamic fieldValue,
  ) {
    if (!(fieldValue is String)) {
      return this.eq(fieldName, fieldValue);
    }

    var textWithOperator = fieldValue;

    var arr = textWithOperator.split(" ");
    var operator = arr[0]; // >= <
    dynamic value = arr[1]; // 0,40,

    printg(
      "textWithOperator: $textWithOperator , ${fieldName} , ${fieldValue is double}, ${fieldValue is int}",
    );
    if (value == null || value == "null") return this;
    if (value.contains(".")) {
      value = int.parse(value.toString());
    } else {
      value = int.parse(value.toString());
    }
    printo("value: $value");

    if (operator == "==") {
      return this.eq(fieldName, value);
    } else if (operator == "<") {
      return this.lt(fieldName, value);
    } else if (operator == "<=") {
      return this.lte(fieldName, value);
    } else if (operator == ">") {
      return this.gt(fieldName, value);
    } else if (operator == ">=") {
      //ERROR: Kayaknya ada issue di library supabase-nya deh,
      // <= bisa, tapi >= tidak bisa
      return this.gte(fieldName, fieldValue);
    } else if (operator == "!=") {
      return this.neq(fieldName, value);
    }
    return this.eq(fieldName, value);
  }
}
