import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assessment/features/news/presentation/pages/news_dashboard.dart';

import 'core/di/di.dart';
import 'features/news/presentation/bloc/news_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(create: (context) => getIt<NewsBloc>())
        ],
        child: const NewsDashboard(),
      ),
    );
  }
}
