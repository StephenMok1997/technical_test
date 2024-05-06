part of 'type_bloc.dart';

@immutable
sealed class TypeState {}

final class TypeInitial extends TypeState {}

final class TypeFetchedLoading extends TypeState {}

final class TypeFetchedSuccess extends TypeState {
  TypeFetchedSuccess({
    required this.types,
    required this.total,
    required this.highestType,
  });

  final List<TypeResponse> types;
  final int total;
  final PokeType highestType;
}

final class TypeFetchedFailure extends TypeState {}
