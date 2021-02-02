import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                        'https://www.bbc.co.uk/news/special/2015/newsspec_10857/bbc_news_logo.png?cb=1'),
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
