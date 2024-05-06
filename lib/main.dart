import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/core/env_config.dart';

import 'package:technical_test/network/http/dio_config.dart';
import 'package:technical_test/network/http/http_client.dart';
import 'package:technical_test/repositories/repository_providers.dart';
import 'package:technical_test/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient.initClient(
    config: DioConfig(
      baseUrl: '${EnvConfig.apiUrl}/${EnvConfig.apiVersion}',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: RepositoryProviders.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
