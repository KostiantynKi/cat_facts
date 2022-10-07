import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/cats_fact_model_hive.dart';

void main() async {
  /// This may be needed if you use another API:
  // MyWidgetsBinding();

  await Hive.initFlutter();
  Hive.registerAdapter(CatsFactsAdapter());

  await Hive.openBox<CatsFacts>('catsFacts');

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatsCubit(),
      // child: const AppView(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const StartPage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
