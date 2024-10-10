/*
//#TEMPLATE account_category_create
await AccountCategoryService().create(
  accountCategoryName: r.randomName(),
accountType: r.firstValueFromList(["Asset", "Liability", "Equity", "Revenue", "Expense"]),
);
//#END

//#TEMPLATE account_category_update
await AccountCategoryService().update(
  id: id,
  accountCategoryName: r.randomName(),
accountType: r.firstValueFromList(["Asset", "Liability", "Equity", "Revenue", "Expense"]),
);
//#END

//#TEMPLATE account_category_delete
await AccountCategoryService().update(id);
//#END

//#TEMPLATE account_category_snapshot
AccountCategoryService().snapshot();
//#END

//#TEMPLATE account_category_get_all
AccountCategoryService().getAll();
//#END

//#TEMPLATE account_category_stream_list
StreamList(
  key: Key("account_category_list"),
  stream: AccountCategoryService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    AccountCategory item = AccountCategory.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
