import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module/inventory/inventory_login/controller/inventory_login_controller.dart';
import 'package:hyper_ui/module/web/web_main_navigation/service/web_main_navigation_service.dart';

class InventoryLoginView extends StatefulWidget {
  InventoryLoginView({Key? key}) : super(key: key);

  Widget build(context, InventoryLoginController controller) {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          transform: Matrix4.translationValues(
                                              0.0, 10, 0),
                                          child: Icon(
                                            MdiIcons.cashRegister,
                                            size: 64.0,
                                            color: const Color(0xff263238),
                                          ),
                                        ),
                                        Text(
                                          "Xinventory",
                                          style: GoogleFonts.blackOpsOne(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff263238),
                                          ),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(
                                              0.0, -10, 0),
                                          child: Text(
                                            "v0.1",
                                            style: GoogleFonts.blackOpsOne(
                                              fontSize: 16.0,
                                              color: const Color(0xff263238),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                    label: "Login",
                                    color: primaryColor,
                                    onPressed: () => controller.login(),
                                  ),
                                  // const SizedBox(
                                  //   height: 6.0,
                                  // ),
                                  // QButton(
                                  //   label: "Register",
                                  //   color: secondaryColor,
                                  //   onPressed: () => Get.to(RegisterView()),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ).am,
                        const SizedBox(
                          height: 12.0,
                        ),
                        if (1 == 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => controller.loginAsAdmin(),
                                child: Text(
                                  "Admin",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              InkWell(
                                onTap: () => controller.loginAsUser(),
                                child: Text(
                                  "User",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<InventoryLoginView> createState() => InventoryLoginController();
}
