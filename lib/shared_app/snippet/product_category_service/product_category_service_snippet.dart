/*
//#TEMPLATE product_category_create
await ProductCategoryService().create(
  imageUrl: r.randomImageUrl(),
productCategoryName: r.randomProductCategoryName(),
);
//#END

//#TEMPLATE product_category_update
await ProductCategoryService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
productCategoryName: r.randomProductCategoryName(),
);
//#END

//#TEMPLATE product_category_delete
await ProductCategoryService().update(id);
//#END

//#TEMPLATE product_category_snapshot
ProductCategoryService().snapshot();
//#END

//#TEMPLATE product_category_get_all
ProductCategoryService().getAll();
//#END

//#TEMPLATE product_category_stream_list
StreamList(
  key: Key("product_category_list"),
  stream: ProductCategoryService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    ProductCategory item = ProductCategory.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
