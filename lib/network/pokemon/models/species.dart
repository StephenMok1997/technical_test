import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
part 'species.g.dart';

@JsonSerializable(explicitToJson: true)
class Species {
  @CapitalizeConverter()
  final String name;
  @SpeciesUrlToIndexConverter()
  @JsonKey(name: 'url')
  final int id;

  Species({
    required this.name,
    required this.id,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
