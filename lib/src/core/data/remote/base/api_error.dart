import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError implements Exception {
  factory ApiError(int? code, String message) = _ApiError;
  factory ApiError.server({int? code, required String message}) = _Server;
  factory ApiError.network({int? code, required String message}) = _Network;
  factory ApiError.unexpected() = _Unexpected;
  factory ApiError.unauthorized(String message) = _Unauthorized;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  ApiError._();

  String get message {
    return maybeWhen(
      orElse: () => "Error unexpected",
      (code, message) => message,
      server: (code, message) => message,
      network: (_, message) => message,
      unauthorized: (message) => message,
    );
  }

  String get title => maybeWhen(
        (code, message) => "Error",
        unauthorized: (message) => "Error unauthorized",
        network: (code, __) => code == HttpStatus.internalServerError
            ? "Error internal server"
            : "Error",
        orElse: () => "Error",
      );
}
