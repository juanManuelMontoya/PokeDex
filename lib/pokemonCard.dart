import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  List pokeDex = [];
  int index;

  PokemonCard(this.pokeDex, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                'images/pokeball.png',
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                pokeDex[index]['name'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4, bottom: 4),
                    child: Text(
                      pokeDex[index]['type'][0].toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: CachedNetworkImage(
                imageUrl: pokeDex[index]['img'],
                height: 100,
                width: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
