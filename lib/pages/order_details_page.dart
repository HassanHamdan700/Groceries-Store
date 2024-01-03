import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderDetailsPage extends StatelessWidget {
  final List<dynamic> cartItems;

  const OrderDetailsPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Order Details'),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Order Summary',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return ListTile(
                    leading: Image.asset(
                      item[2],
                      height: 36,
                    ),
                    title: Text(item[0]),
                    subtitle: Text('\$${item[1]}'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Add your logic to gather order details
                  String itemName = "Example Item";
                  double itemPrice = 10.0;

                  // Create a map of data to send
                  Map<String, dynamic> data = {
                    'itemName': itemName,
                    'itemPrice': itemPrice.toString(),
                    // Add other fields as needed
                  };

                  // Send the data to the PHP script
                  Uri url = Uri.parse('https://hassanhamdan.000webhostapp.com/SignUp.php'); // Replace with your actual URL
                  var response = await http.post(url, body: data);

                  // Handle the response
                  if (response.statusCode == 200) {
                    print("Order saved successfully");
                  } else {
                    print("Failed to save order. Error: ${response.body}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Confirm Order',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += double.parse(item[1].toString());
    }
    return totalPrice;
  }
}