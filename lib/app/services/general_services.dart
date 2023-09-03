import '../../common/strings/strings.dart';

class GeneralServices {
  static String getKeyFromValue(Map<String, int> map, int targetValue) {
    for (var entry in map.entries) {
      if (entry.value == targetValue) {
        return entry.key;
      }
    }
    return Strings.na; // If the value is not found
  }

  static bool isEmailValid(String email) {
    // Regular expression for a valid email pattern
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
