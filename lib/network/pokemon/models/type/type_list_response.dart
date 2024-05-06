import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'type_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TypeListResponse {
  factory TypeListResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeListResponseFromJson(json);
  TypeListResponse({
    required this.count,
    this.results = const [],
    this.next,
    this.previous,
  });

  final int count;
  final List<BasicType> results;
  @OffsetConverter()
  final int? next;
  @OffsetConverter()
  final int? previous;

  Map<String, dynamic> toJson() => _$TypeListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicType {
  BasicType({
    required this.pokeType,
    required this.urlIndex,
  });

  factory BasicType.fromJson(Map<String, dynamic> json) =>
      _$BasicTypeFromJson(json);
  @PokeTypeConverter()
  @JsonKey(name: 'name')
  final PokeType pokeType;
  @UrlToIndexConverter()
  @JsonKey(name: 'url')
  final int urlIndex;

  Map<String, dynamic> toJson() => _$BasicTypeToJson(this);
}
