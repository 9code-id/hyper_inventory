/*
//#TEMPLATE supplier_create
await SupplierService().create(
  imageUrl: r.randomImageUrl(),
supplierName: r.randomName(),
email: r.randomEmail(),
phone: r.randomPhone(),
address: r.randomAddress(),
);
//#END

//#TEMPLATE supplier_update
await SupplierService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
supplierName: r.randomName(),
email: r.randomEmail(),
phone: r.randomPhone(),
address: r.randomAddress(),
);
//#END

//#TEMPLATE supplier_delete
await SupplierService().update(id);
//#END

//#TEMPLATE supplier_snapshot
SupplierService().snapshot();
//#END

//#TEMPLATE supplier_get_all
SupplierService().getAll();
//#END

//#TEMPLATE supplier_stream_list
StreamList(
  key: Key("supplier_list"),
  stream: SupplierService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    Supplier item = Supplier.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
