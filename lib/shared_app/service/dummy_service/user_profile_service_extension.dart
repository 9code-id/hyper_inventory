import 'package:hyper_supabase/core.dart';

extension UserProfileServiceExtension on UserProfileService {
  Future<void> createDummies() async {
    await UserProfileService().create(
      imageUrl: r.randomImageUrl(),
      userProfileName: r.randomName(),
      gender: r.firstValueFromList(["Male", "Female"]),
      email: r.randomEmail(),
      password: r.randomPassword(),
      role: r.firstValueFromList(["Admin", "User"]),
      isActive: r.randomBoolean(),
    );
  }
}
