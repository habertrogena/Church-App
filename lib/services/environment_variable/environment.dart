import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    } else {
      return '.env.development';
    }
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'API_URL not found';
  }

  hasAuth() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }
}
