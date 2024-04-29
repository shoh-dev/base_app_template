import 'package:base_app_template/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaClient {
  late final Supabase supabase;

  Future<void> initialize() async {
    final sb = await Supabase.initialize(
      url: kDebugMode
          ? dotenv.env['SUPABASE_URL_DEV']!
          : dotenv.env['SUPABASE_URL']!,
      anonKey: kDebugMode
          ? dotenv.env['SUPABASE_ANON_KEY_DEV']!
          : dotenv.env['SUPABASE_ANON_KEY']!,
      // debug: true,
    );
    supabase = sb;
    logger("Supabase initialized");
  }
}

//All table names and columns
class SupabaseConstants {
  static const String workers = 'workers';
  static const String skills = 'skills';
  static const String workerSkills = 'worker_skills';
  static const String clients = 'clients';

  static const String selectWorkerWithSkills = '*, skills(*)';
}
