import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module/inventory/inventory_login/view/inventory_login_view.dart';
import '../controller/inventory_home_controller.dart';

class InventoryHomeView extends StatefulWidget {
  const InventoryHomeView({super.key});

  Widget build(context, InventoryHomeController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () => Get.offAll(InventoryLoginView()),
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        List items = [
          {
            "label": "My Account",
            "icon": Icons.account_circle,
            "onTap": () async {
              await Get.to(UserProfileFormView());
            },
          },
          {
            "label": "Inventory Category",
            "icon": Icons.book,
            "onTap": () async {
              await Get.to(ProductCategoryListView());
            },
          },
          {
            "label": "Inventory",
            "icon": Icons.inventory,
            "onTap": () async {
              await Get.to(ProductListView());
            },
          },
          {
            "label": "Search Mechanic",
            "icon": Icons.search,
            "onTap": () async {
              await Get.to(UserProfileListView());
            },
          },
          {
            "label": "Request",
            "icon": Icons.request_quote,
            "onTap": () {},
          },
          {
            "label": "Report",
            "icon": Icons.report,
            "onTap": () {},
          },
          {
            "label": "Contact",
            "icon": Icons.contact_page,
            "onTap": () {},
          }
        ];
        return GridView.builder(
          padding: const EdgeInsets.all(30.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0 / 0.7,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 6,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return InkWell(
              onTap: () => item["onTap"](),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            item["icon"],
                            size: 24.0,
                            color: primaryColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      item["label"],
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  State<InventoryHomeView> createState() => InventoryHomeController();
}
