import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/inventory_login_view.dart';

class InventoryLoginController extends State<InventoryLoginView> {
  static late InventoryLoginController instance;
  late InventoryLoginView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    AuthService().logout().then((value) {
      print("Logout success");
    });
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = kDebugMode ? "user@demo.com" : "";
  String password = kDebugMode ? "123456" : "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isNotValid => !formKey.currentState!.validate();

  Future<void> login() async {
    if (isNotValid) return;

    try {
      showLoading();
      await AuthService().login(
        email: email,
        password: password,
      );
      hideLoading();

      print(currentUser);
      print(currentUser);

      Get.offAll(InventoryHomeView());
    } on Exception catch (err) {
      hideLoading();
      printr(err);
      if (err.toString().contains("Email not confirmed")) {
        se("Please confirm your email first!");
      } else {
        se("Wrong email or password");
      }
    }
  }

  loginAsAdmin() {
    email = "admin@demo.com";
    password = "123456";
    login();
  }

  loginAsUser() {
    email = "user@demo.com";
    password = "123456";
    login();
  }
}
