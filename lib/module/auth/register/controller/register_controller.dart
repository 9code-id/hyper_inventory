import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/register_view.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  @override
  void initState() {
    super.initState();

    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  register() async {
    try {
      showLoading();
      await AuthService().register(
        email: email!,
        password: password!,
      );
      hideLoading();
      Get.back();
      ss('Register success');
    } on Exception catch (err) {
      hideLoading();
      se("Failed to register");
    }
  }
}
