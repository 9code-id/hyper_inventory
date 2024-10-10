/*
//#TEMPLATE user_profile_create
await UserProfileService().create(
  imageUrl: r.randomImageUrl(),
userProfileName: r.randomName(),
gender: r.firstValueFromList(["Male", "Female"]),
email: r.randomEmail(),
password: r.randomPassword(),
role: r.firstValueFromList(["Admin", "User"]),
isActive: r.randomBoolean(),
);
//#END

//#TEMPLATE user_profile_update
await UserProfileService().update(
  id: id,
  imageUrl: r.randomImageUrl(),
userProfileName: r.randomName(),
gender: r.firstValueFromList(["Male", "Female"]),
email: r.randomEmail(),
password: r.randomPassword(),
role: r.firstValueFromList(["Admin", "User"]),
isActive: r.randomBoolean(),
);
//#END

//#TEMPLATE user_profile_delete
await UserProfileService().update(id);
//#END

//#TEMPLATE user_profile_snapshot
UserProfileService().snapshot();
//#END

//#TEMPLATE user_profile_get_all
UserProfileService().getAll();
//#END

//#TEMPLATE user_profile_stream_list
StreamList(
  key: Key("user_profile_list"),
  stream: UserProfileService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    UserProfile item = UserProfile.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
