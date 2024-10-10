/*
//#TEMPLATE product_create
await ProductService().create(
  imageUrl: r.randomImageUrl(),
productName: r.randomProductName(),
productCategoryId: await r.randomId('product_category'),
description: r.randomDescription(),
sku: Uuid().v4(),
qrcode: Uuid().v4(),
purchasePrice: r.randomDouble(),
sellingPrice: r.randomDouble(),
stock: 0,
);
//#END

//#TEMPLATE product_update
await ProductService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
productName: r.randomProductName(),
productCategoryId: await r.randomId('product_category'),
description: r.randomDescription(),
sku: Uuid().v4(),
qrcode: Uuid().v4(),
purchasePrice: r.randomDouble(),
sellingPrice: r.randomDouble(),
stock: 0,
);
//#END

//#TEMPLATE product_delete
await ProductService().update(id);
//#END

//#TEMPLATE product_snapshot
ProductService().snapshot();
//#END

//#TEMPLATE product_get_all
ProductService().getAll();
//#END

//#TEMPLATE product_stream_list
StreamList(
  key: Key("product_list"),
  stream: ProductService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    Product item = Product.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
