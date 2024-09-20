import 'package:flutter/material.dart';

import 'add_product_screen.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class MarketplaceScreen extends StatefulWidget {
  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Product 1',
      description: 'Description of Product 1',
      price: 100.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // Add more sample products if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductScreen()),
              ).then((newProduct) {
                if (newProduct != null) {
                  setState(() {
                    products.add(newProduct);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(products[index].imageUrl),
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            onTap: () {
              // Navigate to product details page if needed
            },
          );
        },
      ),
    );
  }
}
