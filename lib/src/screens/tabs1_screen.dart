import 'package:flutter/material.dart';
import 'package:news_app/src/services/services.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatefulWidget {

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    
    return Scaffold(
      //ListaNoticias(headlines)
      body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator(color: theme.primaryColor,))
            : ListaNoticias(headlines)
   );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}