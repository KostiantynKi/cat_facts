import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/cats_fact_model_hive.dart';

class FactHistoryScreen extends StatelessWidget {
  Box<CatsFacts>? catsFactsBox;
  FactHistoryScreen({super.key, required this.catsFactsBox});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: catsFactsBox!.listenable(),
      builder: (context, Box box, _) {
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            var theFact = box.get(index);
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.all(6.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${theFact.fact} Was saved: ${theFact.today}.',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
