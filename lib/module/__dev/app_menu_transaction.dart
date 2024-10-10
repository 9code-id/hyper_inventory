import 'package:hyper_supabase/core.dart';

List get appMenuMasterDataItems {
  var items = [];

  for (var item in appMenuItems) {
    var label = item['label'].toString().toLowerCase();
    if (label.contains("purchase") || label.contains("order")) {
      //----
    } else if (label.contains("report") || label.contains("history")) {
      //----
    } else {
      items.add(item);
    }
  }
  return items;
}

List get appMenuTransactionItems {
  var items = [];

  for (var item in appMenuItems) {
    var label = item['label'].toString().toLowerCase();
    if (label.toLowerCase().endsWith("item")) continue;
    if (label.contains("purchase") || label.contains("order")) {
      items.add(item);
    }
  }
  return items;
}

List get appMenuReportItems {
  var items = [];

  for (var item in appMenuItems) {
    var label = item['label'].toString().toLowerCase();
    if (label.toLowerCase().endsWith("item")) continue;
    if (label.contains("report") || label.contains("history")) {
      items.add(item);
    }
  }
  return items;
}

extension MenuStringExtension on String {
  bool get isTransaction {
    return (toLowerCase().contains('transaction') ||
        toLowerCase().contains('sales') ||
        toLowerCase().contains('purchase'));
  }

  bool get isReport {
    return toLowerCase() == 'report' || toLowerCase() == 'history';
  }

  bool get isMasterData {
    return !isTransaction && !isReport;
  }
}
