import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/api2cardscreen.dart';
import 'package:my_app/api2model.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: products.length, 
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]); 
        },
      ),
    );
  }
}