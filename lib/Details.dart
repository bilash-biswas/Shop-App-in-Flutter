import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api2model.dart';

class Details extends StatelessWidget {
  final Product product;
  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(product.category.toUpperCase(),style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                ListTile(
                  title: Text(product.title),
                  subtitle: Row(
                    children: [
                      Text('\$${product.price}'),
                      
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.orange),
                      Text('${product.rating}'),
                    ],
                  ),
                ),
                Container(
                  height: 41,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.amber,
                    border: Border.all(color: Colors.brown)
                    ),
                  child: Text(' Total Sell : ${product.count} ',style: TextStyle(color: Colors.white, fontSize: 27),)),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Text(product.description,style: TextStyle(fontSize: 17),),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
