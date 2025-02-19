import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_response.freezed.dart';
part 'meta_response.g.dart';

@freezed
class MetaResponse with _$MetaResponse {
  const factory MetaResponse({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _MetaResponse;

  factory MetaResponse.fromJson(dynamic json) =>
      _$MetaResponseFromJson(json);
}