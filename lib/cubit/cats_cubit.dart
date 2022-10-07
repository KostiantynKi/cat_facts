import 'package:cat_facts/cubit/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../ services/cats_api_provider.dart';
import '../ services/retrofit_api.dart';
import '../models/cats_fact_model_hive.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitialState());

  void getData() async {
    try {
      emit(CatsLoadingState());

      var formatter = DateFormat.yMd().add_jm();
      var formattedDate = formatter.format(DateTime.now());

      //! Use this is you are using 'https://cataas.com/cat' API for load image
      //! 'https://cataas.com/cat' API sometimes don't work
      // final today = DateTime.now();
      // var formatterForImage = DateFormat('yyyyddMMHHmmss');
      // String formattedDateForImage = formatterForImage.format(today);
      // print(formattedDateForImage);
      // String linkImage = 'https://cataas.com/cat' + '#' + formattedDateForImage;

      //! If 'https://cataas.com/cat' don't work,
      //!  use 'https://unsplash.it/1600/900?random' API for load image:
      imageCache.clear();
      String linkImage = 'https://unsplash.it/1600/900?random';

      Box<CatsFacts> catsFactsBox = Hive.box<CatsFacts>('catsFacts');

      RestClient(RetroApi().dioData()).getTasks().then((value) {
        emit(CatsLoadedState(
          linkImage,
          value.fact,
          formattedDate,
          catsFactsBox,
        ));
        catsFactsBox.add(CatsFacts(fact: state.fact!, today: formattedDate));

        //* To clear the facts from the hive:
        // catsFactsBox.clear();
      });
    } catch (e) {
      emit(CatsErrorState(e));
    }
  }
}
