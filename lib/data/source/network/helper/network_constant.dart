class ApiHeaders {
  ApiHeaders._();

  // Header Auth with Bearer token
  static const String AUTHORIZATION = 'Authorization';
  // Header CacheMode for api
  static const String CACHE_MODE = 'cache-mode';
  // Clear all api cached response
  static const String CLEAR_CACHE = 'clear-cache';
  // Timezone
  static const String TIME_ZONE = 'time-zone';
  // udid
  static const String DEVICE = 'device';
}

class CacheMode {
  CacheMode._();

  // Return cached response first, if there's no cache, then return network response
  static const String PRIORITIZE_CACHE = 'PRIORITIZE_CACHE';
  // Return network response first, if there's no internet, then return cached response
  static const String PRIORITIZE_NETWORK = 'PRIORITIZE_NETWORK';
}

class ResponseStatus {
  ResponseStatus._();

  static const int STATUS_SUCCESSFUL = 200;
  static const int STATUS_CREATE = 201;
}
