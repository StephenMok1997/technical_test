import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/blocs/generation/generation_bloc.dart';
import 'package:technical_test/blocs/pokemon/pokemon_bloc.dart';
import 'package:technical_test/blocs/type/type_bloc.dart';
import 'package:technical_test/enum/home_tab.dart';
import 'package:technical_test/views/home/widgets/dashboard_tab.dart';
import 'package:technical_test/views/home/widgets/list_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = HomeTab.values.map((tab) => tab.text).toList();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: List.generate(
                tabs.length,
                (index) => Tab(
                  text: tabs[index],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const BlocProvider(
                    create: PokemonBloc.new,
                    child: ListTab(),
                  ),
                  MultiBlocProvider(
                    providers: const [
                      BlocProvider(
                        create: GenerationBloc.new,
                      ),
                      BlocProvider(
                        create: TypeBloc.new,
                      ),
                    ],
                    child: const DashboardTab(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
