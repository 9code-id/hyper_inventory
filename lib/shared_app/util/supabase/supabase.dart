import 'package:hyper_supabase/shared_app/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late SupabaseClient supabaseClient;

Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
  );

  supabaseClient = Supabase.instance.client;
}
