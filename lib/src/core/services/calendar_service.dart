import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class CalendarService {
  static final _client = SupabaseService.client;

  // 같은 날짜의 다년도 이벤트 조회
  static Future<List<Map<String, dynamic>>> getSameDateEvents({
    required int month,
    required int day,
    int limit = 50,
  }) async {
    try {
      final response = await _client.rpc('get_same_date_events', params: {
        'p_user_id': SupabaseService.currentUser?.id,
        'p_month': month,
        'p_day': day,
        'p_limit': limit,
      });

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching same date events: $e');
      return [];
    }
  }

  // 이벤트 생성
  static Future<bool> createEvent({
    required String title,
    required DateTime startDateTime,
    required DateTime endDateTime,
    String? description,
    bool isAllDay = false,
    String color = '#3788d8',
  }) async {
    try {
      await _client.from('calendar_events').insert({
        'user_id': SupabaseService.currentUser?.id,
        'title': title,
        'description': description,
        'start_datetime': startDateTime.toIso8601String(),
        'end_datetime': endDateTime.toIso8601String(),
        'is_all_day': isAllDay,
        'color': color,
      });
      return true;
    } catch (e) {
      print('Error creating event: $e');
      return false;
    }
  }
}