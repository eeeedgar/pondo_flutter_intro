import 'package:freezed_annotation/freezed_annotation.dart';

enum TaskCompleteStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  completed,
}
