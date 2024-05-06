import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_list_response.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_response.dart';

import 'package:technical_test/network/pokemon/models/pokemon/pokemon_list_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_response.dart';
import 'package:technical_test/network/pokemon/models/type/type_list_response.dart';
import 'package:technical_test/network/pokemon/models/type/type_response.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

import 'pokemon_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('Pokemon API Test', () {
    late MockDio mockDio;
    late PokemonRepository pokemonRepository;

    setUp(() {
      mockDio = MockDio();
      pokemonRepository = PokemonRepository(mockDio);
    });

    test('getPokemonList returns a list of Pokemon', () async {
      when(
        mockDio.get('/pokemon', queryParameters: {
          'offset': 0,
          'limit': 3,
        }),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'count': 1302,
            'next': 'https://pokeapi.co/api/v2/pokemon/?offset=3&limit=3',
            'previous': null,
            'results': [
              {
                'name': 'bulbasaur',
                'url': 'https://pokeapi.co/api/v2/pokemon/1/'
              },
              {
                'name': 'ivysaur',
                'url': 'https://pokeapi.co/api/v2/pokemon/2/'
              },
              {
                'name': 'venusaur',
                'url': 'https://pokeapi.co/api/v2/pokemon/3/'
              }
            ]
          },
          requestOptions: RequestOptions(path: '/pokemon'),
          statusCode: 200,
        );
      });

      final PokemonListResponse result = await pokemonRepository.getPokemonList(
        offset: 0,
        limit: 3,
      );

      expect(result, isA<PokemonListResponse>());
      expect(result.results.first.urlIndex, equals(1));
      expect(result.results.last.urlIndex, equals(3));
    });

    test('getPokemonById returns a Pokemon', () async {
      when(
        mockDio.get('/pokemon/1'),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'id': 1,
            'species': {
              'name': 'bulbasaur',
              'url': 'https://pokeapi.co/api/v2/pokemon-species/1/'
            },
            'sprites': {
              'front_default':
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
            },
            'weight': 69,
            'height': 7,
            'types': [
              {
                'slot': 1,
                'type': {
                  'name': 'grass',
                  'url': 'https://pokeapi.co/api/v2/type/12/'
                }
              },
              {
                'slot': 2,
                'type': {
                  'name': 'poison',
                  'url': 'https://pokeapi.co/api/v2/type/4/'
                },
              }
            ],
          },
          requestOptions: RequestOptions(path: '/pokemon/1'),
          statusCode: 200,
        );
      });

      final PokemonResponse result =
          await pokemonRepository.getPokemonById(id: 1);

      expect(result, isA<PokemonResponse>());
      expect(result.species.name, 'Bulbasaur');
      expect(result.weight, equals(69));
    });

    test('getGenerationList returns a list of Generation', () async {
      when(
        mockDio.get('/generation', queryParameters: {
          'offset': 0,
          'limit': 2,
        }),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'count': 9,
            'next': 'https://pokeapi.co/api/v2/generation?offset=2&limit=2',
            'previous': null,
            'results': [
              {
                'name': 'generation-i',
                'url': 'https://pokeapi.co/api/v2/generation/1/'
              },
              {
                'name': 'generation-ii',
                'url': 'https://pokeapi.co/api/v2/generation/2/'
              },
            ]
          },
          requestOptions: RequestOptions(path: '/generation'),
          statusCode: 200,
        );
      });

      final GenerationListResponse result =
          await pokemonRepository.getGenerationList(
        offset: 0,
        limit: 2,
      );

      expect(result, isA<GenerationListResponse>());
      expect(result.results.first.name, equals('Generation i'));
      expect(result.results.last.name, equals('Generation ii'));
    });

    test('getGenerationById returns a Generation', () async {
      when(
        mockDio.get('/generation/1'),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'id': 1,
            'name': 'generation-i',
            'pokemon_species': [
              {
                'name': 'bulbasaur',
                'url': 'https://pokeapi.co/api/v2/pokemon-species/1/'
              },
              {
                'name': 'charmander',
                'url': 'https://pokeapi.co/api/v2/pokemon-species/4/'
              },
              {
                'name': 'squirtle',
                'url': 'https://pokeapi.co/api/v2/pokemon-species/7/'
              },
            ]
          },
          requestOptions: RequestOptions(path: '/generation/1'),
          statusCode: 200,
        );
      });

      final GenerationResponse result =
          await pokemonRepository.getGenerationById(id: 1);

      expect(result, isA<GenerationResponse>());
      expect(result.id, 1);
      expect(result.pokemonSpecies.first.name, equals('Bulbasaur'));
    });

    test('getTypes returns a list of Type', () async {
      when(
        mockDio.get('/type', queryParameters: {
          'offset': 0,
          'limit': 5,
        }),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'count': 21,
            'next': 'https://pokeapi.co/api/v2/type?offset=5&limit=5',
            'previous': null,
            'results': [
              {'name': 'normal', 'url': 'https://pokeapi.co/api/v2/type/1/'},
              {'name': 'fighting', 'url': 'https://pokeapi.co/api/v2/type/2/'},
              {'name': 'flying', 'url': 'https://pokeapi.co/api/v2/type/3/'},
              {'name': 'poison', 'url': 'https://pokeapi.co/api/v2/type/4/'},
              {'name': 'ground', 'url': 'https://pokeapi.co/api/v2/type/5/'}
            ]
          },
          requestOptions: RequestOptions(path: '/type'),
          statusCode: 200,
        );
      });

      final TypeListResponse result = await pokemonRepository.getTypeList(
        offset: 0,
        limit: 5,
      );

      expect(result, isA<TypeListResponse>());
      expect(result.results.first.pokeType, equals(PokeType.normal));
      expect(result.results.last.pokeType, equals(PokeType.ground));
    });

    test('getTypeById returns a type', () async {
      when(
        mockDio.get('/type/1'),
      ).thenAnswer((_) async {
        return Response(
          data: {
            'id': 1,
            'name': 'normal',
            'pokemon': [
              {
                'pokemon': {
                  'name': 'pidgey',
                  'url': 'https://pokeapi.co/api/v2/pokemon/16/'
                },
                'slot': 1
              },
              {
                'pokemon': {
                  'name': 'pidgeotto',
                  'url': 'https://pokeapi.co/api/v2/pokemon/17/'
                },
                'slot': 1
              },
              {
                'pokemon': {
                  'name': 'pidgeot',
                  'url': 'https://pokeapi.co/api/v2/pokemon/18/'
                },
                'slot': 1
              },
            ]
          },
          requestOptions: RequestOptions(path: '/type/1'),
          statusCode: 200,
        );
      });

      final TypeResponse result = await pokemonRepository.getTypeById(id: 1);

      expect(result, isA<TypeResponse>());
      expect(result.id, 1);
      expect(result.pokeType, equals(PokeType.normal));
      expect(result.pokemons.first.pokemon.name, equals('Pidgey'));
    });
  });
}
