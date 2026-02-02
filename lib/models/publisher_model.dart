import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher_model.freezed.dart';
part 'publisher_model.g.dart';

@freezed
abstract class PublisherModel with _$PublisherModel {
  const factory PublisherModel({int? id, @Default("") String title}) =
      _PublisherModel;

  factory PublisherModel.fromJson(Map<String, dynamic> json) =>
      _$PublisherModelFromJson(json);
}

//types of works they accept
//description/note
//how often they publish?
//FAV them
