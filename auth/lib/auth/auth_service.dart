import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<AuthResponse> signInWithEmailPassword(
    String email, String password 
  ) async {
    return await _supabase.auth.signInWithPassword(email: email,password: password,);
  }

  // Sign Up with email and password
  Future<AuthResponse> signUpWithEmailPassword( 
    String email, String password ) 
    async {
    return await _supabase.auth.signUp( email: email,  password: password,);
  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get user email
  String? getCurrentUserEmail() {
    final Session = _supabase.auth.currentSession;
    final user = Session?.user;
    return user?.email;
  }

}

