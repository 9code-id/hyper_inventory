/*
//#TEMPLATE payment_method_create
await PaymentMethodService().create(
  paymentMethodName: r.randomName(),
accountNumber: r.randomWords(),
);
//#END

//#TEMPLATE payment_method_update
await PaymentMethodService().update(
  id: id,
  paymentMethodName: r.randomName(),
accountNumber: r.randomWords(),
);
//#END

//#TEMPLATE payment_method_delete
await PaymentMethodService().update(id);
//#END

//#TEMPLATE payment_method_snapshot
PaymentMethodService().snapshot();
//#END

//#TEMPLATE payment_method_get_all
PaymentMethodService().getAll();
//#END

//#TEMPLATE payment_method_stream_list
StreamList(
  key: Key("payment_method_list"),
  stream: PaymentMethodService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    PaymentMethod item = PaymentMethod.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
