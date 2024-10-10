import 'package:hyper_supabase/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

AppUser? get currentAuthUser => appCurrentUser;
bool get isLoggedIn => currentAuthUser != null;
UserProfile? currentUser;

bool get isAdmin => currentUser?.role == "Admin";
bool get isUser => currentUser?.role == "User";

class AuthService {
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      DBService.set("email", email);
      DBService.set("password", password);

      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await initializeData(
        email: email,
        password: password,
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future register({
    required String email,
    required String password,
  }) async {
    if (isSafeMode) return;
    if (email == "user@demo.com" || email == "admin@demo.com") return;

    try {
      printr("SIGN UP..");
      await client.auth.signUp(
        email: email,
        password: password,
      );
    } on Exception catch (err) {
      printr(err);
    }
  }

  Future resetPassword({
    required String email,
  }) async {
    try {
      await client.auth.resetPasswordForEmail(
        email,
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future logout() async {
    try {
      await client.auth.signOut();
      currentUser = null;
    } on Exception catch (err) {
      print(err);
    }
  }

  Future<void> initializeUserDataIfLoggedIn() async {
    if (currentAuthUser == null) return;
    var res = await UserProfileService().getAll(
      email: currentAuthUser!.email,
    );
    currentUser = UserProfile.fromJson(res.first);
  }

  Future<void> initializeData({
    required String email,
    required String password,
  }) async {
    try {
      var res = await UserProfileService().getAll(
        email: currentAuthUser!.email,
      );

      if (res.isEmpty) {
        //---
        bool isAdmin = currentAuthUser!.email == defaultAdminEmail;
        await UserProfileService().create(
          email: currentAuthUser!.email,
          userProfileName: isAdmin ? "Admin" : "User",
          password: password,
          role: isAdmin ? "Admin" : "User",
          gender: 'Male',
          imageUrl:
              "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
          isActive: true,
        );

        res = await UserProfileService().getAll(
          email: currentAuthUser!.email,
        );
        currentUser = UserProfile.fromJson(res.first);
      } else {
        //---
        currentUser = UserProfile.fromJson(res.first);
      }
      print(currentUser);
      print(currentUser);
    } on Exception catch (err) {
      printr("FATAL ERROR: @initializeData $err");
    }
  }
}
