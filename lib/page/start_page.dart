import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/cubit/cats_state.dart';
import 'package:cat_facts/page/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatsCubit(),
      child: const StartView(),
    );
  }
}

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatsCubit counterCubit = BlocProvider.of<CatsCubit>(context);
    counterCubit.getData();
    return Scaffold(
      appBar: AppBar(title: const Text('Cats and other')),
      body: BlocBuilder<CatsCubit, CatsState>(
        builder: (context, state) {
          if (state is CatsLoadedState) {
            return const ImagePage();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
