import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../controller/developer_controller.dart';

class DeveloperView extends StatefulWidget {
  DeveloperView({super.key});

  Widget build(context, DeveloperController controller) {
    controller.view = this;

    List<Map<String, dynamic>> items = [
      {
        "title": "Reset",
        "subtitle": "",
        "icon": Icons.bolt,
        "onTap": () async {
          try {
            showLoading();
            await DummyService().deleteCurrentData();
            hideLoading();
            Get.offAll(LoginView());
            await Future.delayed(Duration(seconds: 1));
            LoginController.instance.loginAsAdmin();
            await Future.delayed(Duration(seconds: 1));
            Get.to(DeveloperView());
            await Future.delayed(Duration(seconds: 1));
            showLoading();
            isSafeMode = true;
            await client.rpc("generate_dummies");
            await DummyService().generateDummies();
            isSafeMode = false;
            hideLoading();
            ss("Reset success");
          } on Exception catch (err) {
            printr(err.toString());
            printr("Failed to delete current data: $err");
            hideLoading();
            se("Failed to delete current data: $err");
          }
        },
      },
      {
        "title": "Delete current data",
        "subtitle": "",
        "icon": Icons.bolt,
        "onTap": () async {
          try {
            showLoading();
            await DummyService().deleteCurrentData();
            hideLoading();
            Get.offAll(LoginView());
            ss("Delete current data success!");
          } on Exception catch (err) {
            printr(err.toString());
            printr("Failed to delete current data: $err");
            hideLoading();
            se("Failed to delete current data: $err");
          }
        },
      },
      {
        "title": "Generate Dummies",
        "subtitle": "",
        "icon": Icons.delete,
        "onTap": () async {
          try {
            showLoading();
            await client.rpc("generate_dummies");
            await DummyService().generateDummies();
            hideLoading();
            ss("Generate dummies success");
          } on Exception catch (err) {
            printr(err.toString());
            printr("Failed generate dummies: $err");
            hideLoading();
            se("Failed generate dummies: $err");
          }
        },
      },
      {
        "title": "Generate Dummies (Safe Mode)",
        "subtitle": "",
        "icon": Icons.delete,
        "onTap": () async {
          try {
            showLoading();
            isSafeMode = true;
            await client.rpc("generate_dummies");
            await DummyService().generateDummies();
            isSafeMode = false;
            hideLoading();
            ss("Generate dummies success");
          } on Exception catch (err) {
            printr(err.toString());
            printr("Failed generate dummies: $err");
            hideLoading();
            se("Failed generate dummies: $err");
          }
        },
      },
      {
        "title": "RPC",
        "subtitle": "adjust_stock_for_all_products",
        "icon": Icons.delete_forever,
        "onTap": () async {
          try {
            showLoading();
            await client.rpc(
              'adjust_stock_for_all_products',
            );
            hideLoading();
          } on Exception catch (err) {
            hideLoading();
            printr(err);
          }
        },
      },
      {
        "title": "RPC",
        "subtitle": "adjust_total_for_all_purchase_transaction",
        "icon": Icons.delete_forever,
        "onTap": () async {
          try {
            showLoading();
            await client.rpc(
              'adjust_total_for_all_purchase_transaction',
            );
            hideLoading();
          } on Exception catch (err) {
            hideLoading();
            printr(err);
          }
        },
      },
      {
        "title": "Page",
        "subtitle": "ProductStockReportView",
        "icon": Icons.delete_forever,
        "onTap": () async {
          Get.to(ProductStockReportView());
        },
      },
      {
        "title": "Page",
        "subtitle": "MonthlyPurchaseAndSalesReportView",
        "icon": Icons.delete_forever,
        "onTap": () async {
          Get.to(MonthlyPurchaseAndSalesReportView());
        },
      },
      {
        "title": "Page",
        "subtitle": "DailyReportView",
        "icon": Icons.delete_forever,
        "onTap": () async {
          Get.to(DailyReportView());
        },
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer"),
        actions: [],
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        bool isTablet = MediaQuery.of(context).size.width < 1100 &&
            MediaQuery.of(context).size.width >= 850;
        bool isDesktop = MediaQuery.of(context).size.width >= 1100;
        bool isMobile = MediaQuery.of(context).size.width < 850;

        var crossAxisCount = 2;
        if (isTablet) crossAxisCount = 3;
        if (isDesktop) crossAxisCount = 4;

        return GridView.builder(
          padding: EdgeInsets.all(0.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0 / 0.36,
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return InkWell(
              onTap: () {
                item["onTap"]();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${item["title"]}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${item["subtitle"]}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
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
  State<DeveloperView> createState() => DeveloperController();
}
