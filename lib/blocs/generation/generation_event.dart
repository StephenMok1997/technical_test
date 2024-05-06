part of 'generation_bloc.dart';

@immutable
sealed class GenerationEvent {}

class GenerationFetched extends GenerationEvent {
  GenerationFetched({
    this.offset,
    this.limit = 20,
  });

  final int? offset;
  final int? limit;
}
