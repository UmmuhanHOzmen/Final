import 'package:final_project/data/news_service.dart';
import 'package:final_project/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key); // baaak....!!!
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Başlık'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            print('menuye tıklandı');
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(articles[index].title),
                      subtitle: Text(
                        articles[index].author,
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(articles[index].description),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                            onPressed: () async {
                              await launch(articles[index].url);
                            },
                            child: Text('Habere Git'))
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

/*

class HomePage extends StatelessWidget {

  List<Articles> articles = []; //article listesi eklendi başlangıçta boş



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Başlık'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            print('menuye tıklandı');
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text('Haber başlığı'),
                      subtitle: Text('Yazar'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Açıklama kısmı buraya gelecek'),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(onPressed: null, child: Text('Habere Git'))
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

}

}
*/
