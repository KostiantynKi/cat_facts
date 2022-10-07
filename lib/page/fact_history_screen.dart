import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FactHistoryScreen extends StatelessWidget {
  Box catsFactsBox;
  FactHistoryScreen({required this.catsFactsBox});
  @override
  Widget build(BuildContext context) {
    // Box<String> catsFactsBox = Hive.box('catsFacts');

    return ValueListenableBuilder(
      // valueListenable: Hive.box('catsFacts').listenable(), //!!
      valueListenable: catsFactsBox.listenable(), //!!
      builder: (context, Box box, _) {
        // var box = Hive.box('catsFacts');
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            // String theFact = box.getAt(index);
            // var theFact = box.listenable().value.keys;
            var theFact = box.get(index);

            return Card(
                    child: Text(
              '${theFact}',
            ))
                // title: Text('${box.listenable().value.keys}'),
                ;
          },
        );
      },
    );
  }
}
