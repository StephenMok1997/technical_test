import 'package:json_annotation/json_annotation.dart';
part 'sprites.g.dart';

@JsonSerializable(explicitToJson: true)
class Sprites {
  @JsonKey(name: 'front_default')
  final String frontDefault;

  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
