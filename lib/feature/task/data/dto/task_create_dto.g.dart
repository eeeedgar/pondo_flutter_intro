// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskCreateDtoImpl _$$TaskCreateDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskCreateDtoImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      status: $enumDecode(_$TaskCompleteStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$TaskCreateDtoImplToJson(_$TaskCreateDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': _$TaskCompleteStatusEnumMap[instance.status]!,
    };

const _$TaskCompleteStatusEnumMap = {
  TaskCompleteStatus.pending: 0,
  TaskCompleteStatus.completed: 1,
};
