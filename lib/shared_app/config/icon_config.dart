import 'package:flutter/material.dart';
import 'package:hyper_supabase/core_package.dart';

/*
{
      "icon": MdiIcons.circleSmall,
      "label": "User Profile",
      "view": UserProfileListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Product Category",
      "view": ProductCategoryListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Product",
      "view": ProductListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Customer",
      "view": CustomerListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Supplier",
      "view": SupplierListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Payment Method",
      "view": PaymentMethodListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Purchase Transaction",
      "view": PurchaseTransactionListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Purchase Transaction Item",
      "view": PurchaseTransactionItemListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Order Transaction",
      "view": OrderTransactionListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Order Transaction Item",
      "view": OrderTransactionItemListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Account Category",
      "view": AccountCategoryListView(),
    },
    {
      "icon": MdiIcons.circleSmall,
      "label": "Account Journal",
      "view": AccountJournalListView(),
    },

*/
IconData getIconByLabel(String label) {
  //Icon harus relevan dengan label!
  switch (label) {
    case "Balance":
      return MdiIcons.bankTransferIn;
    case "Purchase":
      return MdiIcons.cart;
    case "Order":
      return MdiIcons.cart;
    case "Expense":
      return MdiIcons.bankTransferIn;
    case "Asset":
      return MdiIcons.bankTransferIn;
    case "Revenue":
      return MdiIcons.bankTransferIn;
    case "Equity":
      return MdiIcons.bankTransferIn;
    case "Liability":
      return MdiIcons.bankTransferIn;
    case "User":
      return Icons.person;
    case "User Profile":
      return Icons.person;
    case "Product Category":
      return MdiIcons.formatListBulleted;
    case "Product":
      return MdiIcons.cube;
    case "Customer":
      return Icons.people;
    case "Supplier":
      return Icons.perm_contact_cal_sharp;
    case "Payment Method":
      return MdiIcons.creditCard;
    case "Purchase Transaction":
      return MdiIcons.cart;
    case "Purchase Transaction Item":
      return MdiIcons.cart;
    case "Order Transaction":
      return MdiIcons.cart;
    case "Order Transaction Item":
      return MdiIcons.cart;
    case "Account Category":
      return MdiIcons.book;
    case "Account Journal":
      return MdiIcons.book;
    case "Topup Cashier Balance":
      return MdiIcons.bankTransferIn;
    case "Withdraw Cashier Balance":
      return MdiIcons.bankTransferIn;
    case "Input Expense":
      return MdiIcons.bankTransferIn;
    case "Product Stock Report":
      return MdiIcons.chartBar;
    case "Monthly Purchase And Sales Report":
      return MdiIcons.chartBar;
    case "Daily Report":
      return MdiIcons.chartBar;
    default:
      return MdiIcons.circleMedium;
  }
}
