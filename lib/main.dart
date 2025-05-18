import 'package:flutter/material.dart';
import 'package:flutter_login_app/services/preferences_service.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'providers/restaurante_provider.dart';
import 'providers/culinaria_provider.dart';
import 'providers/avaliacao_provider.dart';
import 'providers/usuario_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestauranteProvider()),
        ChangeNotifierProvider(create: (_) => CulinariaProvider()),
        ChangeNotifierProvider(create: (_) => AvaliacaoProvider()),
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
