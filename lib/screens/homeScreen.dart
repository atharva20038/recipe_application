// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_application/services/recipe.dart';
import 'package:recipe_application/services/recipe_api.dart';

import 'common-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  List<Recipe> recipe_list = [];

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future<void> getList() async {
    recipe_list = await Recipe_Api.getRecipeList();
    setState(() {
      check = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // shadowColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Food Recipe",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: !check
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ListView.builder(
                      itemCount: recipe_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CommonWidget(
                            recipe_list[index].image,
                            recipe_list[index].name,
                            recipe_list[index].rating,
                            recipe_list[index].time ~/ 60);
                      })),
            ),
    );
  }
}
