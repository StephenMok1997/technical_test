import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'generation_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenerationListResponse {
  factory GenerationListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerationListResponseFromJson(json);
  GenerationListResponse({
    required this.count,
    this.results = const [],
    this.next,
    this.previous,
  });

  final int count;
  final List<BasicGeneration> results;
  @OffsetConverter()
  final int? next;
  @OffsetConverter()
  final int? previous;

  Map<String, dynamic> toJson() => _$GenerationListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicGeneration {
  BasicGeneration({
    required this.name,
    required this.urlIndex,
  });

  factory BasicGeneration.fromJson(Map<String, dynamic> json) =>
      _$BasicGenerationFromJson(json);
  @CapitalizeConverter()
  final String name;
  @UrlToIndexConverter()
  @JsonKey(name: 'url')
  final int urlIndex;

  Map<String, dynamic> toJson() => _$BasicGenerationToJson(this);
}
