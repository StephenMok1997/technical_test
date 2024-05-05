import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/blocs/generation/generation_bloc.dart';
import 'package:technical_test/widgets/basic_info_card.dart';
import 'package:technical_test/widgets/generation_bar_chart.dart';
import 'package:technical_test/widgets/shadow_container.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  void initState() {
    super.initState();
    context.read<GenerationBloc>().add(
          GenerationFetched(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          BlocBuilder<GenerationBloc, GenerationState>(
            builder: (context, state) {
              switch (state) {
                case GenerationInitial():
                case GenerationFetchedLoading():
                  return _loadingWidget();
                case GenerationFetchedSuccess():
                  return _summary(state);
                case GenerationFetchedFailure():
                  return const Text('Error');
              }
            },
          ),
        ],
      ),
    );
  }

  Column _summary(GenerationFetchedSuccess state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BasicInfoCard(
                  title: 'Total Pokemons:',
                  value: state.total.toString(),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BasicInfoCard(
                  title: 'Total Generations:',
                  value: state.generations.length.toString(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 300.0,
          child: ShadowContainer(
            child: GenerationBarChart(
              generations: state.generations,
            ),
          ),
        ),
      ],
    );
  }

  Column _loadingWidget() {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: ShadowContainer(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: ShadowContainer(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        SizedBox(
          height: 300.0,
          child: ShadowContainer(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
