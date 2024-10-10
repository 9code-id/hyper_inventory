import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountJournalFormController extends State<AccountJournalFormView> {
  static late AccountJournalFormController instance;
  late AccountJournalFormView view;

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
      accountCategoryId = current!.accountCategoryId;
      amount = current!.amount;
      description = current!.description;
      userProfileId = current!.userProfileId;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        accountCategoryId = await r.randomId('account_category');
        amount = r.randomDouble();
        description = r.randomDescription();
        userProfileId = currentUser!.id;
        createdAt = createdAt ?? DateTime.now();
        updatedAt = DateTime.now();
        //@END_RANDOM_INITIAL_DATA

        if (widget.accountCategoryId != null) {
          accountCategoryId = widget.accountCategoryId;
        }
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

  AccountJournal? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  int? accountCategoryId;
  double? amount;
  String? description;
  int? userProfileId;
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
      await AccountJournalService().create(
        //@BEGIN_FORM_CREATE
        accountCategoryId: accountCategoryId,
        amount: amount,
        description: description,
        userProfileId: currentUser!.id,
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
      await AccountJournalService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        accountCategoryId: accountCategoryId,
        amount: amount,
        description: description,
        userProfileId: currentUser!.id,
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
