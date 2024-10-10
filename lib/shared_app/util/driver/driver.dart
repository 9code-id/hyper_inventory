import 'package:hyper_supabase/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//@SUPABASE
// Supabase Version
SupabaseClient get client => supabaseClient;
AppUser? get appCurrentUser {
  var current = client.auth.currentUser;
  if (current == null) return null;
  return AppUser(
    id: current!.id,
    email: current.email,
    role: current.role,
  );
}
//:@SUPABASE
