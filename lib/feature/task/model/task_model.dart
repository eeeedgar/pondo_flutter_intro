import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    String? description,
    required TaskCompleteStatus status,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
