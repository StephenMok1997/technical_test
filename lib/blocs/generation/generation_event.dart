part of 'generation_bloc.dart';

@immutable
sealed class GenerationEvent {}

class GenerationFetched extends GenerationEvent {
  GenerationFetched();
}
