class UnAuthorizeException implements Exception {
  String message;
  UnAuthorizeException([this.message = "Unauthorized Action"]);
}

class NoResultException implements Exception {
  String message;
  NoResultException([this.message = "No Results"]);
}