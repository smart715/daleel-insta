mixin TokenCache {
  String? _bearerToken;
  void setBearerToken(String token) => _bearerToken = token;
  String getToken() {
    if (_bearerToken == null) throw Exception('TOKEN CANNOT BE NULL');
    return _bearerToken!;
  }
}
