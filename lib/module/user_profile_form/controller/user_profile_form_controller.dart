import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class UserProfileFormController extends State<UserProfileFormView> {
  static late UserProfileFormController instance;
  late UserProfileFormView view;

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
      userProfileName = current!.userProfileName;
      gender = current!.gender;
      email = current!.email;
      password = current!.password;
      role = current!.role;
      isActive = current!.isActive;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        imageUrl = r.randomImageUrl();
        userProfileName = r.randomName();
        gender = r.firstValueFromList(["Male", "Female"]);
        email = r.randomEmail();
        password = r.randomPassword();
        role = r.firstValueFromList(["Admin", "User"]);
        isActive = r.randomBoolean();
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

  UserProfile? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  String? imageUrl;
  String? userProfileName;
  String? gender;
  String? email;
  String? password;
  String? role;
  bool? isActive;
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
      await UserProfileService().create(
        //@BEGIN_FORM_CREATE
        imageUrl: imageUrl,
        userProfileName: userProfileName,
        gender: gender,
        email: email,
        password: password,
        role: role,
        isActive: isActive,
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
      await UserProfileService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        imageUrl: imageUrl,
        userProfileName: userProfileName,
        gender: gender,
        email: email,
        password: password,
        role: role,
        isActive: isActive,
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
