// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => PagingModel(
      totalResults: (json['total_results'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$PagingModelToJson(PagingModel instance) =>
    <String, dynamic>{
      'total_results': instance.totalResults,
      'page': instance.page,
      'results': instance.results,
    };
