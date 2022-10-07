import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/cubit/cats_state.dart';
import 'package:cat_facts/page/fact_history_screen.dart';
import 'package:cat_facts/page/image_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CounterPage extends StatelessWidget {
  /// {@macro counter_page}
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    counterCubit.getData();
    return Scaffold(
      appBar: AppBar(title: const Text('Cats')),
      body: Container(
        child: BlocBuilder<CounterCubit, CatsState>(
          builder: (context, state) {
            if (state is CatsLoadedState) {
              return ImagePage();
            } else {
              return const Center(child: CircularProgressIndicator());
            }

            // return Text('$count', style: Theme.of(context).textTheme.headline1);
          },
        ),
      ),
    );
  }
}
