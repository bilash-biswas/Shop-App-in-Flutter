import 'package:flutter/material.dart';
import 'package:my_app/Details.dart';
import 'package:my_app/api2model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(product: product,),  
          ),
        );
      },
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
                hoverColor: Colors.orange.shade200,
                title: Text(product.title),
                subtitle: Row(
                  children: [
                    Text('\$${product.price}'),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        product.category,
                        style: const TextStyle(
                          backgroundColor: Colors.indigo,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
