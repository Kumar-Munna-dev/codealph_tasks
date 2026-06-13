import 'package:flutter/material.dart';

class YourCart extends StatelessWidget {
  const YourCart({super.key});

  @override
  Widget build(BuildContext context) {
    String imgurls =
        'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shopping Bag", style: tt.titleLarge),
                  Text("3 ITEMS", style: tt.titleMedium),
                ],
              ),
            ),
            SizedBox(height: 20),
            shoppingCart(context),
            shoppingCart(context),
            shoppingCart(context),
            SizedBox(height: 20),
            promoCode(),
            SizedBox(height: 20),
            orderSummary(),
          ],
        ),
      ),
    );
  }
}

Widget shoppingCart(BuildContext context) {
  String imgurls =
      'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

  final tt = Theme.of(context).textTheme;
  return Container(
    height: 120,
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          child: Image.network(imgurls, fit: BoxFit.cover),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('crimson Velocity Runner', style: tt.titleMedium),
            Text('Size 42 | Colors: Bule', style: tt.titleSmall),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text('1', style: tt.bodyLarge),
                      Text('1', style: tt.bodyLarge),
                      Text('1', style: tt.bodyLarge),
                    ],
                  ),
                ),
                Text('299.00', style: tt.titleMedium),
              ],
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      ],
    ),
  );
}

Widget promoCode() {
  return Container(
    margin: const EdgeInsets.all(12),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PROMO CODE"),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hint: Text(
                    'Enter promo code',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('APPLY', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget orderSummary() {
  return Card(
    margin: const EdgeInsets.all(12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          ListTile(
            title: const Text('Subtotal'),
            trailing: const Text('299.00'),
          ),

          ListTile(
            title: const Text('Estimated Shipping'),
            trailing: const Text('40.00'),
          ),

          ListTile(
            title: const Text('Estimated Tax'),
            trailing: const Text('9.00'),
          ),

          const Divider(),

          ListTile(title: const Text('Total'), trailing: const Text('348.00')),

          const SizedBox(height: 10),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.payment, color: Colors.white),
              label: const Text(
                'Secure Checkout',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
