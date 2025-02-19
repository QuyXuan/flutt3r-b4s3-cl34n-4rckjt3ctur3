import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static setup() async {
    await dotenv.load(fileName: ".env");
  }
  static final apiUrl = dotenv.env['API_URL'] ?? '';
}
