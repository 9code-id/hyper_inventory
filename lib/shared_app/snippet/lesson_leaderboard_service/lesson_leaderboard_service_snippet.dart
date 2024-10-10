/*
//#TEMPLATE lesson_leaderboard_create
await LessonLeaderboardService().create(
  userProfileId: currentUser!.id,
currentStreak: r.randomInt(),
longestStreak: r.randomInt(),
totalMinutes: r.randomInt(),
);
//#END

//#TEMPLATE lesson_leaderboard_update
await LessonLeaderboardService().update(
  id: id,
  userProfileId: currentUser!.id,
currentStreak: r.randomInt(),
longestStreak: r.randomInt(),
totalMinutes: r.randomInt(),
);
//#END

//#TEMPLATE lesson_leaderboard_delete
await LessonLeaderboardService().update(id);
//#END

//#TEMPLATE lesson_leaderboard_snapshot
LessonLeaderboardService().snapshot();
//#END

//#TEMPLATE lesson_leaderboard_get_all
LessonLeaderboardService().getAll();
//#END

//#TEMPLATE lesson_leaderboard_stream_list
StreamList(
  key: Key("lesson_leaderboard_list"),
  stream: LessonLeaderboardService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    LessonLeaderboard item = LessonLeaderboard.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
