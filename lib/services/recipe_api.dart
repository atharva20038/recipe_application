// ignore_for_file: camel_case_types
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_application/services/recipe.dart';
import 'package:http/http.dart' as http;

class Recipe_Api {
  static Future<List<Recipe>> getRecipeList() async {
//     var options = {
//   method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {limit: '18', start: '0', tag: 'list.recipe.popular'},
//   headers: {
//     'x-rapidapi-host': 'yummly2.p.rapidapi.com',
//     'x-rapidapi-key': '0766272006mshcd646acaf3f8161p1b72fejsn9f2a25067dcd'
//   }
// };

    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '18', "start": '0', "tag": 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '0766272006mshcd646acaf3f8161p1b72fejsn9f2a25067dcd',
      'useQueryString': 'true',
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.convertToList(temp);
  }
}
