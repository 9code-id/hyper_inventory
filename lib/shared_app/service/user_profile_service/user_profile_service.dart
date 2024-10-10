import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class UserProfileService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? imageUrl,
    String? userProfileName,
    String? gender,
    String? email,
    String? password,
    String? role,
    bool? isActive,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('user_profile').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (userProfileName != null && userProfileName.isNotEmpty) {
      query = query.ilike('user_profile_name', '%$userProfileName%');
    }
    if (gender != null) {
      query = query.eq('gender', gender);
    }
    if (email != null) {
      query = query.eq('email', email);
    }
    if (password != null) {
      query = query.eq('password', password);
    }
    if (role != null) {
      query = query.eq('role', role);
    }
    if (isActive != null) {
      query = query.eq('is_active', isActive);
    }
    if (createdAtFrom != null && createdAtTo != null) {
      final startOfDayFrom =
          DateTime(createdAtFrom.year, createdAtFrom.month, createdAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(createdAtTo.year, createdAtTo.month, createdAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('created_at', startOfDayFrom.toIso8601String())
          .lt('created_at', startOfDayTo.toIso8601String());
    }
    if (updatedAtFrom != null && updatedAtTo != null) {
      final startOfDayFrom =
          DateTime(updatedAtFrom.year, updatedAtFrom.month, updatedAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(updatedAtTo.year, updatedAtTo.month, updatedAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('updated_at', startOfDayFrom.toIso8601String())
          .lt('updated_at', startOfDayTo.toIso8601String());
    }

    var response = await query.order('id', ascending: false).exec();
    return List.from(response);
  }

//@SUPABASE
  Stream snapshot({
    int? id,
    String? idOperatorAndValue,
    String? imageUrl,
    String? userProfileName,
    String? gender,
    String? email,
    String? password,
    String? role,
    bool? isActive,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('user_profile').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (userProfileName != null && userProfileName.isNotEmpty) {
      query = query.ilike('user_profile_name', '%$userProfileName%');
    }
    if (gender != null) {
      query = query.eq('gender', gender);
    }
    if (email != null) {
      query = query.eq('email', email);
    }
    if (password != null) {
      query = query.eq('password', password);
    }
    if (role != null) {
      query = query.eq('role', role);
    }
    if (isActive != null) {
      query = query.eq('is_active', isActive);
    }
    if (createdAtFrom != null && createdAtTo != null) {
      final startOfDayFrom =
          DateTime(createdAtFrom.year, createdAtFrom.month, createdAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(createdAtTo.year, createdAtTo.month, createdAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('created_at', startOfDayFrom.toIso8601String())
          .lt('created_at', startOfDayTo.toIso8601String());
    }
    if (updatedAtFrom != null && updatedAtTo != null) {
      final startOfDayFrom =
          DateTime(updatedAtFrom.year, updatedAtFrom.month, updatedAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(updatedAtTo.year, updatedAtTo.month, updatedAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('updated_at', startOfDayFrom.toIso8601String())
          .lt('updated_at', startOfDayTo.toIso8601String());
    }

    return query.order('id', ascending: false).snapshot();
  }
//:@SUPABASE

  Future<Map<String, dynamic>?> getUserProfileById(int id) async {
    final response = await client
        .from('user_profile')
        .select(
          """
*
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? imageUrl,
    String? userProfileName,
    String? gender,
    String? email,
    String? password,
    String? role,
    bool? isActive,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('user_profile')
          .insert([
            {
              'image_url': imageUrl,
              'user_profile_name': userProfileName,
              'gender': gender,
              'email': email,
              'password': password,
              'role': role,
              'is_active': isActive,
              'created_at': createdAt?.yMd,
            }
          ])
          .select() //@UNUSED_IN_MONGODB
          .exec();
      var id = values.first['id'];
      lastInsertID = id;
      AuthService().register(
        email: email!,
        password: password!,
      );
      return values.first;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>?> update({
    required int id,
    String? imageUrl,
    String? userProfileName,
    String? gender,
    String? email,
    String? password,
    String? role,
    bool? isActive,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getUserProfileById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('user_profile')
          .update({
            'image_url': imageUrl ?? current['image_url'],
            'user_profile_name':
                userProfileName ?? current['user_profile_name'],
            'gender': gender ?? current['gender'],
            'email': email ?? current['email'],
            'password': password ?? current['password'],
            'role': role ?? current['role'],
            'is_active': isActive ?? current['is_active'],
          })
          .eq('id', id)
          .exec();

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delete(int id) async {
    try {
      await client.from('user_profile').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('user_profile').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
