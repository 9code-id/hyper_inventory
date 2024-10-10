/*
//#TEMPLATE purchase_transaction_create
await PurchaseTransactionService().create(
  userProfileId: currentUser!.id,
supplierId: await r.randomId('supplier'),
paymentMethodId: await r.randomId('payment_method'),
orderStatus: r.firstValueFromList(["Order created", "Order packed", "Handed over to driver", "In transit", "Received", "Completed"]),
total: r.randomDouble(),
);
//#END

//#TEMPLATE purchase_transaction_update
await PurchaseTransactionService().update(
  id: id,
  userProfileId: currentUser!.id,
supplierId: await r.randomId('supplier'),
paymentMethodId: await r.randomId('payment_method'),
orderStatus: r.firstValueFromList(["Order created", "Order packed", "Handed over to driver", "In transit", "Received", "Completed"]),
total: r.randomDouble(),
);
//#END

//#TEMPLATE purchase_transaction_delete
await PurchaseTransactionService().update(id);
//#END

//#TEMPLATE purchase_transaction_snapshot
PurchaseTransactionService().snapshot();
//#END

//#TEMPLATE purchase_transaction_get_all
PurchaseTransactionService().getAll();
//#END

//#TEMPLATE purchase_transaction_stream_list
StreamList(
  key: Key("purchase_transaction_list"),
  stream: PurchaseTransactionService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    PurchaseTransaction item = PurchaseTransaction.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
