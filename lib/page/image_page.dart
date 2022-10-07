import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/cubit/cats_state.dart';
import 'package:cat_facts/page/fact_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    // counterCubit.getData();
    return BlocBuilder<CounterCubit, CatsState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 400,
                  child: Image.network(
                    state.linkImage!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text('${state.fact!} ${state.todayDay}'),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    counterCubit.getData();
                  },
                  child: Text(
                    'Another fact!',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FactHistoryScreen(
                                catsFactsBox: state.catsFactsBox!,
                              )),
                    );
                  },
                  child: Text(
                    'Fact history',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        );
      },
    );
  }
}
