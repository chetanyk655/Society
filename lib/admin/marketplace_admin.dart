import 'dart:convert';
import 'package:first_app/member/market_place/add_product.dart';
import 'package:first_app/member/market_place/view_product.dart';
import 'package:flutter/material.dart';

class MarketPlacePageAdmin extends StatefulWidget {
  MarketPlacePageAdmin({super.key, this.response});
  String? response;
  @override
  _MarketPlacePageAdminState createState() =>
      _MarketPlacePageAdminState(response: response);
}

class _MarketPlacePageAdminState extends State<MarketPlacePageAdmin> {
  _MarketPlacePageAdminState({this.response});
  String? response;
  Map<String, dynamic> parsedJson = {};
  List<Map<String, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    if (parsedJson.isEmpty) {
      parsedJson = jsonDecode(response!);
      if (parsedJson['status_code'] == 200) {
        for (int i = 0; i < parsedJson['total_prod']; i++) {
          items.add({
            "image": base64Decode(
                parsedJson['response']['products'][i]['image'].split(',').last),
            "name": parsedJson['response']['products'][i]['p_name'],
            "price": parsedJson['response']['products'][i]['price'].toString(),
            "desc": parsedJson['response']['products'][i]['descp']
          });
        }
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Marketplace',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('No items added yet',
                  style: TextStyle(color: Colors.white, fontSize: 18)))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detailed view when the item is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewProductPage(
                            image: items[index]['image'],
                            name: items[index]['name'],
                            price: items[index]['price'],
                            desc: items[index]['desc']),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(255, 29, 28, 28),
                            Color.fromARGB(255, 0, 0, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Display a small image
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  items[index]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Display item information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Price: ₹${items[index]['price']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
