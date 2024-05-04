import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/species.dart';

part 'generation_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenerationResponse {
  final int id;
  final List<Species> species;
  GenerationResponse({
    required this.id,
    this.species = const [],
  });

  factory GenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationResponseToJson(this);
}
