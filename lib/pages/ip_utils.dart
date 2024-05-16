import 'package:shared_preferences/shared_preferences.dart';

Future<String> getIpAddress() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('ipAddress') ?? ''; // Default to empty if not set
}

Future<void> setIpAddress(String ip) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('ipAddress', ip);
}
