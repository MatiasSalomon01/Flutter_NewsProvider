import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return Text(noticias[index].title);
      },
    );
  }
}