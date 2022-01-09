// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:flutter/material.dart';

class Recipe {
  String name = "";
  String image = "";
  double rating = 0;
  int time = 0;

  Recipe(this.name, this.image, this.rating, this.time);

  factory Recipe.toJSON(dynamic json) {
    return Recipe(json['name'], json['images'][0]['hostedLargeUrl'],
        json['rating'] as double, json['totalTimeInSeconds'] as int);
  }

  static List<Recipe> convertToList(List snapshots) {
    return snapshots.map((e) => Recipe.toJSON(e)).toList();
  }
}
