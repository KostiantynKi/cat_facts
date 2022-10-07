import 'package:cat_facts/cubit/cats_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../ services/cats_api_provider.dart';
import '../ services/retrofit_api.dart';

class CounterCubit extends Cubit<CatsState> {
  /// {@macro brightness_cubit}
  CounterCubit() : super(CatsInitialState());

  void getData() {
    try {
      emit(CatsLoadingState());

      final today = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
      );
      var formatter = DateFormat.yMd().add_jm();
      String formattedDate = formatter.format(today);

      //! Use this is you are using 'https://cataas.com/cat' API for load image
      //! 'https://cataas.com/cat' API sometimes don't work
      // var formatterForImage = DateFormat('yyyyddMMHHmmss');
      // String formattedDateForImage = formatterForImage.format(today);
      // print(formattedDateForImage);
      // String linkImage = 'https://cataas.com/cat' + '#' + formattedDateForImage;

      //! If 'https://cataas.com/cat' don't work,
      //!  use 'https://unsplash.it/1600/900?random' API for load image
      imageCache.clear();
      String linkImage = 'https://unsplash.it/1600/900?random';

      Box catsFactsBox = Hive.box<String>('catsFacts');

      // catsFactsBox.add(state.fact!);

      print('${catsFactsBox.length}');

      RestClient(RetroApi().DioData()).getTasks().then((value) {
        emit(CatsLoadedState(
          linkImage,
          value.fact,
          formattedDate,
          catsFactsBox,
        ));
        // print('${catsFactsBox.length}');
        // catsFactsBox.add('222143');

        // Box<List> catsFactsBox = Hive.box('catsFacts');
        // catsFactsBox.add([state.fact!, formattedDate]);
        catsFactsBox.add(state.fact!);

        // Box catsFactsBox = Hive.box<String>('catsFacts');

        // catsFactsBox.close();
        // catsFactsBox.clear();
      });

      // emit(CatsLoadedState(linkImage, fact));
    } catch (e) {
      emit(CatsErrorState(e));
    }
  }

  void loadData() {
    // Box<String> catsFactsBox = Hive.box('catsFacts');
    // catsFactsBox.close();

    // print(state.fact);
    // catsFactsBox.add(state.fact!);
    // print('${catsFactsBox.length}');
    // print(
    //     'catsFactsBox.listenable().value.values is ${catsFactsBox.listenable().value.keys}');
    // print(
    //     'catsFactsBox.listenable().value.values is ${catsFactsBox.listenable().value.values}');
  }
}
