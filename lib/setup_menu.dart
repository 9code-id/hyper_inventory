import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/web/web_main_navigation/service/web_main_navigation_service.dart';

setupMenu() {
  WebMainNavigationService.appLogo =
      "https://res.cloudinary.com/dotz74j1p/image/upload/v1723386115/vpsvck5nul46isu3kly0.png";

  WebMainNavigationService.appMenus = [
    MenuItem(
      icon: Icons.dashboard,
      label: "Dashboard",
      view: DashboardView(),
    ),
    MenuItem(
      label: "Master Data",
      icon: Icons.data_array,
      children: appMenuMasterDataItems
          .map(
            (e) => MenuItem(
              icon: e["icon"],
              label: e["label"],
              view: e["view"],
            ),
          )
          .toList(),
    ),
    MenuItem(
      label: "Main Transactions",
      icon: Icons.list_outlined,
      children: appMenuTransactionItems
          .map(
            (e) => MenuItem(
              icon: e["icon"],
              label: e["label"],
              view: e["view"],
            ),
          )
          .toList(),
    ),
    MenuItem(
      label: "Other Transactions",
      icon: Icons.list_outlined,
      children: [
        MenuItem(
          icon: MdiIcons.bankTransferIn,
          label: "Topup Cashier Balance",
          view: AccountJournalFormView(
            accountCategoryId: 1001,
          ),
        ),
        MenuItem(
          icon: MdiIcons.bankTransferIn,
          label: "Withdraw Cashier Balance",
          view: AccountJournalFormView(
            accountCategoryId: 3001,
          ),
        ),
        MenuItem(
          icon: MdiIcons.bankTransferIn,
          label: "Input Expense",
          view: AccountJournalFormView(
            accountCategoryId: 5001,
          ),
        ),
      ],
    ),
    if (appMenuReportItems.isNotEmpty) ...[
      MenuItem(
        label: "Reports",
        separator: true,
      ),
      ...appMenuReportItems
          .map(
            (e) => MenuItem(
              icon: e["icon"],
              label: e["label"],
              view: e["view"],
            ),
          )
          .toList()
    ],
    MenuItem(
      label: "Report",
      icon: Icons.report,
      children: [
        MenuItem(
          icon: MdiIcons.circleSmall,
          label: "Product Stock Report",
          view: ProductStockReportView(),
        ),
        MenuItem(
          icon: MdiIcons.circleSmall,
          label: "Monthly Purchase And Sales Report",
          view: MonthlyPurchaseAndSalesReportView(),
        ),
        MenuItem(
          icon: MdiIcons.circleSmall,
          label: "Daily Report",
          view: DailyReportView(),
        ),
      ],
    ),
    MenuItem(
      label: "Settings",
      separator: true,
    ),
    MenuItem(
      icon: Icons.logout,
      label: "Logout",
      onTap: () async {
        showLoading();
        await AuthService().logout();
        hideLoading();
        Get.offAll(LoginView());
      },
    ),
  ];
}
