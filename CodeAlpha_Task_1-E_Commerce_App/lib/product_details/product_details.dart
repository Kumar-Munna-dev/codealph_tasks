import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopitem/widgets/product_card.dart';
import 'package:shopitem/your_cart/your_cart.dart';

class ProductDetails extends StatelessWidget {
  final String imgUrl;
  final String productTitle;
  final String productCategory;
  final String productPrice;
  final String productDiscountPrice;

  ProductDetails({
    super.key,
    required this.imgUrl,
    required this.productTitle,
    required this.productCategory,
    required this.productPrice,
    required this.productDiscountPrice,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    String imgurls =
        'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/07d24bb874112230.jpg?q=80',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [Icon(Icons.verified), Text('Verified Seller')],
                ),
              ),
              Text(
                'Velocity Elite Pro X ',
                style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      '289.0',
                      style: tt.titleLarge?.copyWith(color: Colors.green),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '340.0',
                      style: tt.titleSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Product Details', style: tt.titleLarge?.copyWith()),
              Text(
                'leurm ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea com',
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Reviews', style: tt.titleLarge?.copyWith()),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('5', style: tt.titleLarge?.copyWith()),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.lightBlue),
                      Text('(124)'),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text('View All')),
                ],
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return reviewCard();
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10),
              Text('Related Products', style: tt.titleLarge?.copyWith()),

              /// Product Grid
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),

                padding: EdgeInsets.zero,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.66,
                ),

                itemCount: 6,

                itemBuilder: (context, index) {
                  return ProductCard(
                    imgUrl: imgurls,
                    productTitle: 'NEXX ARHAM TWS Bluetooth Headset',
                    productCategory: 'Electronics',
                    productPrice: '₹1,699',
                    productDiscountPrice: '₹299',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Add to Cart', style: tt.titleMedium),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourCart()),
                    );
                  },
                  label: Text(
                    'Buy Now',
                    style: tt.titleLarge?.copyWith(color: Colors.white),
                  ),
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget reviewCard() {
  return Container(
    width: 400,
    child: Card(
      child: ListTile(
        leading: CircleAvatar(radius: 20, child: Text('JD')),
        title: Text('Julian D.'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Verified Buyer · 2 days ago'),
            SizedBox(height: 4),
            Text('Great product. Quality is excellent.'),
          ],
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text('4.5'), Icon(Icons.star, size: 16)],
          ),
        ),
      ),
    ),
  );
}
