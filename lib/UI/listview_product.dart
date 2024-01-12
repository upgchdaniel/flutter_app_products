import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:flutter_app_products/UI/product_screen.dart';
import 'package:flutter_app_products/UI/product_information.dart';
import 'package:flutter_app_products/UI/listview_product.dart';

class ListViewProduct extends StatefulWidget {
  const ListViewProduct({super.key});

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

final productReference = FirebaseDatabase.instance.reference().child('product')

class _ListViewProductState extends State<ListViewProduct> {

  List<Product> items;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _onProductAddedSubscription = productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangedSubscription = productReference.onChildChanged.listen(_onProductChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onProductAddedSubscription.cancel();
    _onProductChangedSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product DB',
      home: Scaffold(
      appBar: AppBar(
        title: Text('Product information'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position){
                return Column(
                  children: <widget>[
                    Divider(height: 7.0,),
                    Row(
                      
                    )
                  ],
                )
              },
          ),
        ),
      ),
    );
  }
}
