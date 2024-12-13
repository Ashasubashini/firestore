import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  final _firestore = FirebaseFirestore.instance;

  String pname = '';
  String brand = '';
  String color = '';
  int size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(80),
        child: Column(
          children: [
            Text("Add a New Product"),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                pname = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Product Name"
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                brand = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Brand"
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                color = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Color"
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                size = int.tryParse(value) ?? 0;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Size"
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              child: Text("Add Product",
                  style: TextStyle(color: Colors.white)
              ),
              onPressed: () {
                _firestore.collection('products').add({
                  'pname' : pname,
                  'brand' : brand,
                  'color' : color,
                  'size' : size,

                });

              },
            )
          ],
        ),
      ),
    );

  }
}
