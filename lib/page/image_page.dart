import 'package:cat_facts/cubit/cats_cubit.dart';
import 'package:cat_facts/cubit/cats_state.dart';
import 'package:cat_facts/page/fact_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    CatsCubit counterCubit = BlocProvider.of<CatsCubit>(context);
    return BlocBuilder<CatsCubit, CatsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
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
                            : const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    '${state.fact!} ${state.todayDay}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      counterCubit.getData();
                    },
                    child: Text(
                      'Another fact!',
                      style: Theme.of(context).textTheme.headline2,
                    )),
                const SizedBox(height: 4),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
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
                      style: Theme.of(context).textTheme.headline2,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
