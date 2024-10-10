/*
//#TEMPLATE lesson_category_create
await LessonCategoryService().create(
  lessonCategoryName: r.randomName(),
sortIndex: r.randomInt(),
);
//#END

//#TEMPLATE lesson_category_update
await LessonCategoryService().update(
  id: id,
  lessonCategoryName: r.randomName(),
sortIndex: r.randomInt(),
);
//#END

//#TEMPLATE lesson_category_delete
await LessonCategoryService().update(id);
//#END

//#TEMPLATE lesson_category_snapshot
LessonCategoryService().snapshot();
//#END

//#TEMPLATE lesson_category_get_all
LessonCategoryService().getAll();
//#END

//#TEMPLATE lesson_category_stream_list
StreamList(
  key: Key("lesson_category_list"),
  stream: LessonCategoryService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    LessonCategory item = LessonCategory.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
