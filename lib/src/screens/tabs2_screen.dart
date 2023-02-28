import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';
import 'package:news_app/src/services/services.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:provider/provider.dart';


class Tab2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _ListaCategorias()),
          ],
        )
       ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder:(context, index) {
        final name = categories[index].name;

        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoryButton(categories[index]),
              SizedBox(height: 5,),
              Text('${name[0].toUpperCase()}${name.substring(1)}',)
            ]
          ),
        );
      }, 
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        // print('${categoria.name}');
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon, 
          color: (newsService.selectedCategory == categoria.name) 
                  ? theme.primaryColor
                  : Colors.black54
        )
      ),
    );
  }
}