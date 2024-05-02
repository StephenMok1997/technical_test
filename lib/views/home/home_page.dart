import 'package:flutter/material.dart';
import 'package:technical_test/enum/home_tab.dart';

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
      body: Column(
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
                ListView.builder(
                  itemBuilder: (context, index) => Text(index.toString()),
                  itemCount: 100,
                ),
                const Placeholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
