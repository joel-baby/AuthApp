import 'package:auth/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  // supabase setup
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhjYmF1c21mcW5rbWhjYXFjeWF2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIzOTEyMjMsImV4cCI6MjA2Nzk2NzIyM30.WPecii92FA99sSkPOxQTk7FYm4JtFap4rM_fQNm-5w0",
    url: "https://hcbausmfqnkmhcaqcyav.supabase.co" ,);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate()
    );
  }
}