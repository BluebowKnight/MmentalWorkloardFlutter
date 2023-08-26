
import 'package:json_annotation/json_annotation.dart';
part 'workload_rating.g.dart';

@JsonSerializable()
class WorkloadRating{
  String Date;
  int Rating;
  String DurationHours;

  WorkloadRating(this.Date, this.Rating, this.DurationHours);

  factory WorkloadRating.fromJson(Map<String,dynamic>json) => _$WorkloadRatingFromJson(json);

  Map<String,dynamic> toJson() => _$WorkloadRatingToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return '{Date: ${Date}, Rating:${Rating}, Duration:${DurationHours}}';
  }
}