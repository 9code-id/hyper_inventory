/*
//#TEMPLATE order_transaction_create
await OrderTransactionService().create(
  userProfileId: currentUser!.id,
customerId: await r.randomId('customer'),
paymentMethodId: await r.randomId('payment_method'),
orderStatus: r.firstValueFromList(["Order created", "Order packed", "Handed over to driver", "In transit", "Received", "Completed"]),
total: r.randomDouble(),
);
//#END

//#TEMPLATE order_transaction_update
await OrderTransactionService().update(
  id: id,
  userProfileId: currentUser!.id,
customerId: await r.randomId('customer'),
paymentMethodId: await r.randomId('payment_method'),
orderStatus: r.firstValueFromList(["Order created", "Order packed", "Handed over to driver", "In transit", "Received", "Completed"]),
total: r.randomDouble(),
);
//#END

//#TEMPLATE order_transaction_delete
await OrderTransactionService().update(id);
//#END

//#TEMPLATE order_transaction_snapshot
OrderTransactionService().snapshot();
//#END

//#TEMPLATE order_transaction_get_all
OrderTransactionService().getAll();
//#END

//#TEMPLATE order_transaction_stream_list
StreamList(
  key: Key("order_transaction_list"),
  stream: OrderTransactionService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    OrderTransaction item = OrderTransaction.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
