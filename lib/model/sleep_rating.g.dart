// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SleepRating _$SleepRatingFromJson(Map<String, dynamic> json) => SleepRating(
      json['ParticipantNumber'] as String,
      json['Date'] as String,
      json['SleepRating'] as String,
    );

Map<String, dynamic> _$SleepRatingToJson(SleepRating instance) =>
    <String, dynamic>{
      'ParticipantNumber': instance.ParticipantNumber,
      'Date': instance.Date,
      'SleepRating': instance.Rating,
    };
