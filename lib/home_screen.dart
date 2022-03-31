import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemonCard.dart';
import 'package:pokedex/topBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokeDex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        TopBar(),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokeDex.length != null
                  ? Expanded(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: pokeDex.length,
                      itemBuilder: (context, index) {
                        return PokemonCard(pokeDex, index);
                      },
                    ))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        )
      ],
    ));
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokeDex = decodedJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
