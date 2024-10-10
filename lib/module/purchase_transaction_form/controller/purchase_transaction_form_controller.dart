import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionFormController
    extends State<PurchaseTransactionFormView> {
  static late PurchaseTransactionFormController instance;
  late PurchaseTransactionFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    initializeData();
  }

  initializeData() async {
    loading = true;
    setState(() {});

    if (isEditMode) {
      //::CURRENT_DATA
      id = current!.id;
      userProfileId = current!.userProfileId;
      supplierId = current!.supplierId;
      paymentMethodId = current!.paymentMethodId;
      orderStatus = current!.orderStatus;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
      total = current!.total;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        userProfileId = currentUser!.id;
        supplierId = await r.randomId('supplier');
        paymentMethodId = await r.randomId('payment_method');
        orderStatus = r.firstValueFromList([
          "Order created",
          "Order packed",
          "Handed over to driver",
          "In transit",
          "Received",
          "Completed"
        ]);
        createdAt = createdAt ?? DateTime.now();
        updatedAt = DateTime.now();
        total = r.randomDouble();
        //@END_RANDOM_INITIAL_DATA
      }
      //@EXTRA_FORM_VALUE_OVERRIDES
    }

    loading = false;
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  bool get isNotValid {
    bool isValid = formKey.currentState!.validate();
    return !isValid;
  }

  bool get isValid {
    bool isValid = formKey.currentState!.validate();
    return isValid;
  }

  PurchaseTransaction? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  int? userProfileId;
  int? supplierId;
  int? paymentMethodId;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? total;

  save() {
    if (isNotValid) return;
    if (isCreateMode) create();
    if (isEditMode) update();
  }

  create() async {
    try {
      showLoading();
      await PurchaseTransactionService().create(
        //@BEGIN_FORM_CREATE
        userProfileId: currentUser!.id,
        supplierId: supplierId,
        paymentMethodId: paymentMethodId,
        orderStatus: orderStatus,
        createdAt: createdAt,

        //@END_FORM_CREATE
      );
      hideLoading();
      Get.back();
      ss("Data created");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  update() async {
    try {
      showLoading();
      await PurchaseTransactionService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        userProfileId: currentUser!.id,
        supplierId: supplierId,
        paymentMethodId: paymentMethodId,
        orderStatus: orderStatus,
        createdAt: createdAt,

        //@END_FORM_UPDATE
      );
      hideLoading();
      Get.back();
      ss("Data updated");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  refresh() {
    setState(() {});
  }
}
