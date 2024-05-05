part of 'generation_bloc.dart';

@immutable
sealed class GenerationState {}

final class GenerationInitial extends GenerationState {}

final class GenerationFetchedLoading extends GenerationState {}

final class GenerationFetchedSuccess extends GenerationState {
  GenerationFetchedSuccess({
    required this.generations,
    required this.total,
  });

  final List<GenerationResponse> generations;
  final int total;
}

final class GenerationFetchedFailure extends GenerationState {}
