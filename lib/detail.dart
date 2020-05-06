import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScreenArguments{
  final String featuree;
  final String nam;
  final int price;
  ScreenArguments(this.featuree, this.nam, this.price);
}

class DetailPages extends StatefulWidget {
  @override
  DetailPage createState() => DetailPage();
}

class DetailPage extends State<DetailPages> {
  @override

  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Detail',
            textAlign: TextAlign.center,
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.mode_edit,
              semanticLabel: 'modify',
            ),
            onPressed: () {
                Navigator.pushNamed(context, '/Edit');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              semanticLabel: 'delete',
            ),
            onPressed: () {

            },
          ),
        ],
      ),
        body: ListView(
              children: <Widget>[
                Image.asset(
                  'packages/shrine_images/0-0.jpg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 5),
                    child: Row(
                      children: <Widget>[
                        Text(args.nam, style: TextStyle(fontSize: 25.0, color: Colors.blue, fontWeight: FontWeight.bold)),
                        SizedBox(width: 80.0),
                        Icon(Icons.thumb_up, color: Colors.red, size: 25.0),
                        Text('  0'),
                      ],
                    ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
                    child: Row(
                      children: <Widget>[
                        Text(formatter.format(args.price), style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                      ],
                    ),
                ),
                Divider(height: 20.0, color: Colors.black),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Text('DOCUMNETSDFJASJFKLJFFSDFSDFSDFSFLKJSLKJFLKSJDLFKJSDLKFJLKDF', style: TextStyle(color: Colors.blue)),
                )
        ],
        ),
    );
  }
}