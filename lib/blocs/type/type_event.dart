part of 'type_bloc.dart';

@immutable
sealed class TypeEvent {}

class TypeFetched extends TypeEvent {
  TypeFetched({
    this.offset,
    this.limit = 30,
  });

  final int? offset;
  final int? limit;
}
