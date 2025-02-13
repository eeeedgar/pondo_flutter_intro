import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum CompleteStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  completed,
}

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    required String title,
    String? description,
    required CompleteStatus status,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
