import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';

part 'task_create_dto.freezed.dart';
part 'task_create_dto.g.dart';

@freezed
class TaskCreateDto with _$TaskCreateDto {
  const factory TaskCreateDto({
    required String title,
    String? description,
    required TaskCompleteStatus status,
  }) = _TaskCreateDto;

  factory TaskCreateDto.fromJson(Map<String, dynamic> json) => _$TaskCreateDtoFromJson(json);
}
