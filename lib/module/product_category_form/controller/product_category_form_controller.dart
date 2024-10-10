import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductCategoryFormController extends State<ProductCategoryFormView> {
  static late ProductCategoryFormController instance;
  late ProductCategoryFormView view;

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
      productCategoryName = current!.productCategoryName;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        imageUrl = r.randomImageUrl();
        productCategoryName = r.randomProductCategoryName();
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

  ProductCategory? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  String? imageUrl;
  String? productCategoryName;
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
      await ProductCategoryService().create(
        //@BEGIN_FORM_CREATE
        imageUrl: imageUrl,
        productCategoryName: productCategoryName,
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
      await ProductCategoryService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        imageUrl: imageUrl,
        productCategoryName: productCategoryName,
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
