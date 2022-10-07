import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/cubit/cats_state.dart';
import 'package:cat_facts/page/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import ' services/cats_api_provider.dart';
import ' services/image_cash_clear.dart';

void main() async {
  // MyWidgetsBinding();

  await Hive.initFlutter();
  await Hive.openBox<String>('catsFacts');

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      // child: const AppView(),
      child: MaterialApp(home: const CounterPage()),
    );
  }
}
