import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mquadb/data/repositories/home_repo.dart';
import 'data/repositories/repositories.dart';
import 'presentation/screens/splash/splash_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    RepositoryProvider(
      create: (context) => Repositories(homeRepo: HomeRepo()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'First Method',
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
            ),
            home: const Splash(),
          );
        });
  }
}
