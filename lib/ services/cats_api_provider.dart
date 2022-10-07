// import 'package:cat_facts/models/cat_fact_model.dart';
import 'package:cat_facts/models/cats_fact_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:io';

// part 'cats_api_provider.g.dart';
// part 'package:retro/services/cats_api_provider.g.dart';
part 'cats_api_provider.g.dart';

@RestApi(baseUrl: "https://catfact.ninja/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/fact?max_length=140")
  Future<CatsFact> getTasks();
}
