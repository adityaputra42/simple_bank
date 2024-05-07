import '../utils/helper/pref_helper.dart';

class RequestHeaders {
  Map<String, String> setAuthHeaders() {
    String token = PrefHelper.instance.cookie;
    String csrf = PrefHelper.instance.csrfToken;
    return {
      // "Authorization": "Bearer $token",
      'cookie': token,
      'x-csrf-token': csrf,
      'X-CLIENT-Devices': 'android',
      'Accept': "application/json",
      'Content-Type': 'application/json;encoding=utf-8',
    };
  }
}
