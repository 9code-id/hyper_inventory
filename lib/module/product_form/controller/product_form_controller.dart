import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductFormController extends State<ProductFormView> {
  static late ProductFormController instance;
  late ProductFormView view;

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
      imageUrl = current!.imageUrl;
      productName = current!.productName;
      productCategoryId = current!.productCategoryId;
      description = current!.description;
      sku = current!.sku;
      qrcode = current!.qrcode;
      purchasePrice = current!.purchasePrice;
      sellingPrice = current!.sellingPrice;
      stock = current!.stock;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        imageUrl = r.randomImageUrl();
        productName = r.randomProductName();
        productCategoryId = await r.randomId('product_category');
        description = r.randomDescription();
        sku = Uuid().v4();
        qrcode = Uuid().v4();
        purchasePrice = r.randomDouble();
        sellingPrice = r.randomDouble();
        stock = r.randomInt();
        createdAt = createdAt ?? DateTime.now();
        updatedAt = DateTime.now();
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

  Product? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  String? imageUrl;
  String? productName;
  int? productCategoryId;
  String? description;
  String? sku;
  String? qrcode;
  double? purchasePrice;
  double? sellingPrice;
  int? stock;
  DateTime? createdAt;
  DateTime? updatedAt;

  save() {
    if (isNotValid) return;
    if (isCreateMode) create();
    if (isEditMode) update();
  }

  create() async {
    try {
      showLoading();
      await ProductService().create(
        //@BEGIN_FORM_CREATE
        imageUrl: imageUrl,
        productName: productName,
        productCategoryId: productCategoryId,
        description: description,
        sku: sku,
        qrcode: qrcode,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        stock: stock,
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
      await ProductService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        imageUrl: imageUrl,
        productName: productName,
        productCategoryId: productCategoryId,
        description: description,
        sku: sku,
        qrcode: qrcode,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        stock: stock,
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
