/*
//#TEMPLATE purchase_transaction_item_create
await PurchaseTransactionItemService().create(
  purchaseTransactionId: await r.randomId('purchase_transaction'),
productId: await r.randomId('product'),
qty: 1,
purchasePrice: r.randomDouble(),
total: r.randomDouble(),
);
//#END

//#TEMPLATE purchase_transaction_item_update
await PurchaseTransactionItemService().update(
  id: id,
  purchaseTransactionId: await r.randomId('purchase_transaction'),
productId: await r.randomId('product'),
qty: 1,
purchasePrice: r.randomDouble(),
total: r.randomDouble(),
);
//#END

//#TEMPLATE purchase_transaction_item_delete
await PurchaseTransactionItemService().update(id);
//#END

//#TEMPLATE purchase_transaction_item_snapshot
PurchaseTransactionItemService().snapshot();
//#END

//#TEMPLATE purchase_transaction_item_get_all
PurchaseTransactionItemService().getAll();
//#END

//#TEMPLATE purchase_transaction_item_stream_list
StreamList(
  key: Key("purchase_transaction_item_list"),
  stream: PurchaseTransactionItemService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    PurchaseTransactionItem item = PurchaseTransactionItem.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
