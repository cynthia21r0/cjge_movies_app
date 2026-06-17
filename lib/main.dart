import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cjge_movies_app/config/config.dart';
// import 'package:cjge_movies_app/config/theme/app_theme.dart';
// import 'presentation/screens/movies/home_screen.dart';


void main() async {
  await dotenv.load(fileName: '.env');

  print(dotenv.env["MOVIEDB_KEY"]);
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // Dependencias a instalar:
  // animate_do, card_swiper, dio, flutter_dotenv, flutter_riverpod, go_router, youtube_player_flutter

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // home: HomeScreen(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
