class Failure implements Exception {
  final String message;
  Failure(this.message);

  @override
  String toString() {
    if (message.split(' ')[0] == "DioError") {
      var msg = message.split('\n')[0];
      return msg.split(': ')[1];
    } else {
      return message;
    }
  }
}
