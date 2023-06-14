import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

class ModificationViewModel with ChangeNotifier {
  static String supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
  static String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';
  final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
}
