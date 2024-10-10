import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module/dashboard/widget/transaction_card.dart';
import 'package:hyper_supabase/module/dashboard/widget/transaction_chart.dart';
import 'package:hyper_supabase/module/dashboard/widget/transaction_statistic_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Eleven POS v1.0"),
        actions: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Badge(
                label: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      body: StreamList(
          key: Key("summary_report_list"),
          adaptiveMode: false,
          // stream: ProductService().snapshot(),
          stream: client.rpc('summary_report', params: {
            "start_date": DateTime(now.year, now.month, 1).yMd,
            "end_date": DateTime(now.year, now.month + 1, 1)
                .subtract(Duration(days: 1))
                .yMd,
            "user_profile_id": currentUser!.id,
          }).asStream(),
          padding: const EdgeInsets.all(0.0),
          itemBuilder: (itemMap, index) {
            double balance = itemMap['balance'] * 1.0 as double;
            double purchaseTotal = itemMap['purchase_total'] * 1.0 as double;
            double orderTotal = itemMap['order_total'] * 1.0 as double;
            double expenseTotal = itemMap['expense'] * 1.0 as double;
            double productCount = itemMap['product_count'] * 1.0 as double;
            double productCategoryCount =
                itemMap['product_category_count'] * 1.0 as double;
            double customerCount = itemMap['customer_count'] * 1.0 as double;
            double supplierCount = itemMap['supplier_count'] * 1.0 as double;
            double userProfileCount =
                itemMap['user_profile_count'] * 1.0 as double;

            /*
                ( SELECT COALESCE(SUM(amount), 0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Asset' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS asset,

        ( SELECT COALESCE(SUM(amount), 0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Liability' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS liability,

        ( SELECT COALESCE(SUM(amount), 0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Equity' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS equity,

        ( SELECT COALESCE(SUM(amount), 0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Revenue' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS revenue,
            
        ( SELECT COALESCE(SUM(amount), 0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Expense' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS expense;

        */
            double asset = itemMap['asset'] * 1.0 as double;
            double liability = itemMap['liability'] * 1.0 as double;
            double equity = itemMap['equity'] * 1.0 as double;
            double revenue = itemMap['revenue'] * 1.0 as double;
            double expense = itemMap['expense'] * 1.0 as double;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(builder: (context) {
                          List values = [
                            {
                              "label": "Balance",
                              "value": balance.number,
                            },
                            {
                              "label": "Purchase",
                              "value": purchaseTotal.number,
                            },
                            {
                              "label": "Order",
                              "value": orderTotal.number,
                            },
                            {
                              "label": "Expense",
                              "value": expenseTotal.number,
                            },
                          ];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H6(
                                title: "Purchase & Sales",
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              DashboardStatisticGrid(values: values)
                            ],
                          );
                        }),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Builder(builder: (context) {
                          List values = [
                            {
                              "label": "Asset",
                              "value": asset.number,
                            },
                            {
                              "label": "Expense",
                              "value": expense.number,
                            },
                            {
                              "label": "Revenue",
                              "value": revenue.number,
                            },
                            {
                              "label": "Equity",
                              "value": equity.number,
                            },
                            {
                              "label": "Liability",
                              "value": liability.number,
                            },
                          ];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H6(
                                title: "Accounting",
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              DashboardStatisticGrid(values: values)
                            ],
                          );
                        }),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Builder(builder: (context) {
                          List values = [
                            {
                              "label": "Product",
                              "value": productCount.number,
                            },
                            {
                              "label": "Product Category",
                              "value": productCategoryCount.number,
                            },
                            {
                              "label": "Customer",
                              "value": customerCount.number,
                            },
                            {
                              "label": "Supplier",
                              "value": supplierCount.number,
                            },
                            {
                              "label": "User",
                              "value": userProfileCount.number,
                            },
                          ];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H6(
                                title: "Data",
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              DashboardStatisticGrid(values: values)
                            ],
                          );
                        }),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Builder(builder: (context) {
                          var items = WebMainNavigationService.appMenus;
                          return Column(
                            children: List.generate(items.length, (index) {
                              var item = items[index];
                              if (item.children.isEmpty) return Container();
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    H6(
                                      title: item.label!,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    LayoutBuilder(builder:
                                        (context, BoxConstraints constraints) {
                                      var maxWidth = 180;
                                      var crossAxisCount =
                                          (constraints.maxWidth / maxWidth)
                                              .ceil();

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.0 / 0.6,
                                          crossAxisCount: crossAxisCount,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                        ),
                                        itemCount: item.children.length,
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemBuilder: (BuildContext context,
                                            int childIndex) {
                                          var childItem =
                                              item.children[childIndex];
                                          return InkWell(
                                            onTap: () {
                                              Get.to(childItem.view!);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                                vertical: 8.0,
                                              ),
                                              decoration: defaultDecoration,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: FittedBox(
                                                      child: Icon(
                                                        getIconByLabel(
                                                            childItem.label!),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                  Text(
                                                    "${childItem.label!}\n\n",
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).amMoveAndFadeIndex(index);
                                        },
                                      );
                                    }),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}

class DashboardStatisticGrid extends StatelessWidget {
  const DashboardStatisticGrid({
    super.key,
    required this.values,
  });

  final List values;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      var minWidth = 180;
      var crossAxisCount = (constraints.maxWidth / minWidth).ceil();

      return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0 / 0.46,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: values.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = values[index];
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: defaultDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: Icon(
                        getIconByLabel(item["label"]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${item['label']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                "${item["value"]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ).amMoveAndFadeIndex(index);
        },
      );
    });
  }
}
