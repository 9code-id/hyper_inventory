/*
//#TEMPLATE lesson_create
await LessonService().create(
  imageUrl: r.randomImageUrl(),
lessonCategoryId: await r.randomId('lesson_category'),
lessonName: r.randomName(),
description: r.randomDescription(),
lessonType: r.firstValueFromList(["Video", "Audio", "PDF"]),
url: r.randomUrl(),
userProfileId: currentUser!.id,
sortIndex: r.randomInt(),
);
//#END

//#TEMPLATE lesson_update
await LessonService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
lessonCategoryId: await r.randomId('lesson_category'),
lessonName: r.randomName(),
description: r.randomDescription(),
lessonType: r.firstValueFromList(["Video", "Audio", "PDF"]),
url: r.randomUrl(),
userProfileId: currentUser!.id,
sortIndex: r.randomInt(),
);
//#END

//#TEMPLATE lesson_delete
await LessonService().update(id);
//#END

//#TEMPLATE lesson_snapshot
LessonService().snapshot();
//#END

//#TEMPLATE lesson_get_all
LessonService().getAll();
//#END

//#TEMPLATE lesson_stream_list
StreamList(
  key: Key("lesson_list"),
  stream: LessonService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    Lesson item = Lesson.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
