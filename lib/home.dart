
import 'package:Shrine/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String dropdownStr = "ASC";

class _HomePageState extends State<HomePage> {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 8,
                          color: Colors.blueGrey),
                    ),
                    Container(
                      child: Expanded(
                        child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 10.0, color: Colors.blue,),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/Detail',
                                    arguments: ScreenArguments(
                                      product.assetName,
                                      product.name,
                                      product.price,
                                    ),
                                  );
                                },
                              ),
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person,
            semanticLabel: 'person',
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/Profile');
          },
        ),
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              semanticLabel: 'add',
            ),
            onPressed: () {
              print('add');
            },
          ),
        ],
      ),
      body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(padding: EdgeInsets.fromLTRB(30, 20, 10, 8)),
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: DropdownButton<String>(
                  value: dropdownStr,
                  onChanged: (String newValue){
                    setState(() {
                      dropdownStr = newValue;
                    });
                  },
                  items: <String> ['ASC', 'DESC'].map<DropdownMenuItem<String>> ((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
              ),
              expandedHeight: 80,
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context),
            )
          ]
      ),
    );
  }
}