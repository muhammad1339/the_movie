import 'package:equatable/equatable.dart';

class HttpError extends Equatable{
  const HttpError({this.message = 'Unknown Error', this.code});

  final String? message;
  final int? code;

  @override
  String toString() {
    return '{message: $message ,code: $code}';
  }

  @override
  List<Object?> get props => [message, code];
}

