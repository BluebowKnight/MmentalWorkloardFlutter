// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workload_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkloadRating _$WorkloadRatingFromJson(Map<String, dynamic> json) =>
    WorkloadRating(
      json['Date'] as String,
      json['Rating'] as int,
      json['DurationHours'] as String,
    );

Map<String, dynamic> _$WorkloadRatingToJson(WorkloadRating instance) =>
    <String, dynamic>{
      'Date': instance.Date,
      'Rating': instance.Rating,
      'DurationHours': instance.DurationHours,
    };
