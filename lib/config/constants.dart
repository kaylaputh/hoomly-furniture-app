class AppConstants {
  // API & Firebase
  static const String firebaseProjectId = 'hoomly-furniture';
  
  // Strings
  static const String appName = 'Hoomly';
  static const String appTagline = 'Furniture Terbaik Untuk Rumah Impian Anda';
  
  // Pagination
  static const int productsPerPage = 20;
  static const int ordersPerPage = 10;
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration debounceDelay = Duration(milliseconds: 500);
  
  // Storage Keys
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String userIdKey = 'user_id';
  static const String userEmailKey = 'user_email';
  static const String authTokenKey = 'auth_token';
}

class AppColors {
  static const int primary = 0xFF2C3E50;
  static const int accent = 0xFFE74C3C;
  static const int success = 0xFF27AE60;
  static const int error = 0xFFE74C3C;
  static const int warning = 0xFFF39C12;
  static const int info = 0xFF3498DB;
  static const int background = 0xFFF8F9FA;
  static const int surface = 0xFFFFFFFF;
  static const int textPrimary = 0xFF2C3E50;
  static const int textSecondary = 0xFF7F8C8D;
}

class AppDimens {
  static const double paddingXS = 4;
  static const double paddingS = 8;
  static const double paddingM = 12;
  static const double paddingL = 16;
  static const double paddingXL = 20;
  static const double paddingXXL = 24;
  static const double paddingXXXL = 32;
  
  static const double radiusS = 4;
  static const double radiusM = 8;
  static const double radiusL = 12;
  static const double radiusXL = 16;
  
  static const double elevationS = 2;
  static const double elevationM = 4;
  static const double elevationL = 8;
}
