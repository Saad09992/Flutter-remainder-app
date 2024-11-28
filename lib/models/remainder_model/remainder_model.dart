import 'package:freezed_annotation/freezed_annotation.dart';
part 'remainder_model.freezed.dart';
part 'remainder_model.g.dart';

@Freezed()
class RemainderModel with _$RemainderModel{
  factory RemainderModel({
    required int id,
    required String animeId,
    @Default('Unknown day') String day,
    required DateTime time
}) = _RemainderModel;

  factory RemainderModel.fromJson(Map<String , dynamic> json)=> _$RemainderModelFromJson(json);
}