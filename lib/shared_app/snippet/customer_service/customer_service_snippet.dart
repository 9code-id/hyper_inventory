/*
//#TEMPLATE customer_create
await CustomerService().create(
  imageUrl: r.randomImageUrl(),
customerName: r.randomName(),
email: r.randomEmail(),
phone: r.randomPhone(),
address: r.randomAddress(),
);
//#END

//#TEMPLATE customer_update
await CustomerService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
customerName: r.randomName(),
email: r.randomEmail(),
phone: r.randomPhone(),
address: r.randomAddress(),
);
//#END

//#TEMPLATE customer_delete
await CustomerService().update(id);
//#END

//#TEMPLATE customer_snapshot
CustomerService().snapshot();
//#END

//#TEMPLATE customer_get_all
CustomerService().getAll();
//#END

//#TEMPLATE customer_stream_list
StreamList(
  key: Key("customer_list"),
  stream: CustomerService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    Customer item = Customer.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
