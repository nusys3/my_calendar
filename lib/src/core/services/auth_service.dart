import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class AuthService {
  static final _client = SupabaseService.client;

  // 현재 사용자 정보
  static User? get currentUser => _client.auth.currentUser;
  
  // 로그인 상태 확인
  static bool get isLoggedIn => currentUser != null;

  // 이메일/비밀번호 로그인
  static Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // 이메일/비밀번호 회원가입
  static Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );
  }

  // 로그아웃
  static Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // 인증 상태 변화 감지
  static Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}