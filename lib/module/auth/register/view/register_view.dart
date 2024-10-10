import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_ui/module/web/web_main_navigation/service/web_main_navigation_service.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1521737711867-e3b97375f902?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueGrey[900]!.withOpacity(0.9),
                    Colors.blueGrey[900]!.withOpacity(0.8),
                    Colors.blueGrey[900]!.withOpacity(0.7),
                    Colors.blueGrey[900]!.withOpacity(0.8),
                    Colors.blueGrey[900]!.withOpacity(0.9),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: Image.network(
                                    WebMainNavigationService.appLogo,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                H3(
                                  title: "Register",
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                QTextField(
                                  label: "Email",
                                  validator: Validator.email,
                                  suffixIcon: Icons.email,
                                  value: controller.email,
                                  onChanged: (value) {
                                    controller.email = value;
                                  },
                                ),
                                QTextField(
                                  label: "Password",
                                  obscure: true,
                                  validator: Validator.required,
                                  suffixIcon: Icons.password,
                                  value: controller.password,
                                  onChanged: (value) {
                                    controller.password = value;
                                  },
                                ),
                                QButton(
                                  label: "Register",
                                  onPressed: () {
                                    bool isNotValid = controller
                                            .formKey.currentState!
                                            .validate() ==
                                        false;
                                    if (isNotValid) {
                                      return;
                                    }
                                    controller.register();
                                  },
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: Text(
                                    "Already have an account",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: infoColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).am,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
