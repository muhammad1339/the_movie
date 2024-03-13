class HttpError {
  HttpError({this.message = 'Unknown Error', this.code});

  String? message;
  int? code;

  @override
  String toString() {
    return '{message: $message ,code: $code}';
  }
}
