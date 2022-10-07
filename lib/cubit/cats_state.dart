// abstract class CatsState {}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CatsState {
  String? linkImage;
  final String? fact;
  String? todayDay;
  Box? catsFactsBox;

  CatsState({
    this.linkImage,
    this.fact,
    this.todayDay,
    this.catsFactsBox,
  });
}

class CatsInitialState extends CatsState {}

class CatsLoadingState extends CatsState {}

class CatsLoadedState extends CatsState {
  CatsLoadedState(
    String? linkImage,
    String? fact,
    String? todayDay,
    Box? catsFactsBox,
  ) : super(
          linkImage: linkImage,
          fact: fact,
          todayDay: todayDay,
          catsFactsBox: catsFactsBox,
        );
}

class CatsErrorState extends CatsState {
  final exception;

  CatsErrorState(this.exception);
}
