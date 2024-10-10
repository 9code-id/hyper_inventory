import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionItemListController
    extends State<PurchaseTransactionItemListView> {
  static late PurchaseTransactionItemListController instance;
  late PurchaseTransactionItemListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    //@EXTRA_INIT_STATE_DECLARATION
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  delete(PurchaseTransactionItem item) async {
    try {
      showLoading();
      await PurchaseTransactionItemService().delete(item.id!);
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  deleteAll() async {
    try {
      showLoading();
      await PurchaseTransactionItemService().deleteAll();
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  //@SEARCH
  updateFilter() {
    setState(() {});
  }
  //@:SEARCH

  refresh() {
    setState(() {});
  }

  //::FILTER_VARIABLES
  //@FILTER_VARIABLES
  //::VARIABLE
  int? id;
  int? purchaseTransactionId;
  int? productId;
  int? qty;
  double? purchasePrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? total;

  String? idOperatorAndValue;
  String? purchaseTransactionIdOperatorAndValue;
  String? productIdOperatorAndValue;
  String? qtyOperatorAndValue;
  String? purchasePriceOperatorAndValue;
  DateTime? createdAtFrom;
  DateTime? createdAtTo;
  DateTime? updatedAtFrom;
  DateTime? updatedAtTo;
  String? totalOperatorAndValue;
  //@:FILTER_VARIABLES

  //@CHECK_FILTER_MODE
  bool get isFilterMode {
    List values = [
      //::COMMA_VARIABLE
      id,
      purchaseTransactionId,
      productId,
      qty,
      purchasePrice,
      createdAt,
      updatedAt,
      total,
      idOperatorAndValue,
      purchaseTransactionIdOperatorAndValue,
      productIdOperatorAndValue,
      qtyOperatorAndValue,
      purchasePriceOperatorAndValue,
      createdAtFrom,
      createdAtTo,
      updatedAtFrom,
      updatedAtTo,
      totalOperatorAndValue,
    ];
    return values.indexWhere((i) =>
            (i != null && i != "") ||
            (i != null && i is String && i.isNotEmpty)) >
        -1;
  }
  //@:CHECK_FILTER_MODE

  resetFilter() {
    //@::ULL_VARIABLE
    id = null;
    purchaseTransactionId = null;
    productId = null;
    qty = null;
    purchasePrice = null;
    createdAt = null;
    updatedAt = null;
    total = null;
    idOperatorAndValue = null;
    purchaseTransactionIdOperatorAndValue = null;
    productIdOperatorAndValue = null;
    qtyOperatorAndValue = null;
    purchasePriceOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    totalOperatorAndValue = null;
    setState(() {});
  }

  //@HAS_PARENT_SCOPE
  bool get isSubEditMode => view.purchaseTransactionId != null;
  //@:HAS_PARENT_SCOPE
}
