/*
//#TEMPLATE order_transaction_item_create
await OrderTransactionItemService().create(
  orderTransactionId: await r.randomId('order_transaction'),
productId: await r.randomId('product'),
qty: 1,
purchasePrice: r.randomDouble(),
sellingPrice: r.randomDouble(),
total: r.randomDouble(),
);
//#END

//#TEMPLATE order_transaction_item_update
await OrderTransactionItemService().update(
  id: id,
  orderTransactionId: await r.randomId('order_transaction'),
productId: await r.randomId('product'),
qty: 1,
purchasePrice: r.randomDouble(),
sellingPrice: r.randomDouble(),
total: r.randomDouble(),
);
//#END

//#TEMPLATE order_transaction_item_delete
await OrderTransactionItemService().update(id);
//#END

//#TEMPLATE order_transaction_item_snapshot
OrderTransactionItemService().snapshot();
//#END

//#TEMPLATE order_transaction_item_get_all
OrderTransactionItemService().getAll();
//#END

//#TEMPLATE order_transaction_item_stream_list
StreamList(
  key: Key("order_transaction_item_list"),
  stream: OrderTransactionItemService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    OrderTransactionItem item = OrderTransactionItem.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
