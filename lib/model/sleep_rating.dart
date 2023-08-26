
import 'package:json_annotation/json_annotation.dart';
part 'sleep_rating.g.dart';

@JsonSerializable()
class SleepRating{
  String ParticipantNumber;
  String Date;
  String Rating;

  SleepRating(this.ParticipantNumber, this.Date, this.Rating);

  factory SleepRating.fromJson(Map<String,dynamic> json) => _$SleepRatingFromJson(json);

  Map<String, dynamic> toJson() => _$SleepRatingToJson(this);
}