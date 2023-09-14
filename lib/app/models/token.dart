class Token {
  String? tokenType;
  String? scope;
  String? expiresIn;
  String? extExpiresIn;
  String? expiresOn;
  String? notBefore;
  String? resource;
  late String accessToken;
  String? refreshToken;

  Token.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    scope = json['scope'];
    expiresIn = json['expires_in'];
    extExpiresIn = json['ext_expires_in'];
    expiresOn = json['expires_on'];
    notBefore = json['not_before'];
    resource = json['resource'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}
