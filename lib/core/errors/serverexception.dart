class Serverexception implements Exception {
  final String message;

  Serverexception({this.message = "Server error occured"});
}
