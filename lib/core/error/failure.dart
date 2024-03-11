class Failure implements Exception {
  String message;
  Failure([this.message = "An unexpected error occured"]);
}
