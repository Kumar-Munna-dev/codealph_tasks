import 'package:flutter/material.dart';
import 'package:shopitem/widgets/product_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int currentIndex = 0;
  Map<IconData, String> category = {
    Icons.phone_android: 'Mobiles',
    Icons.laptop: 'Laptops',
    Icons.tv: 'TVs',
    Icons.headphones: 'Headphones',
    Icons.watch: 'Watches',
    Icons.home: 'Home Appliances',
  };
  String imgurls =
      'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,

                  itemBuilder: (context, index) {
                    bool isSelected = currentIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        print("Category:${index}");
                      },

                      child: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                //shape: BoxShape.circle,
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.blue.shade50,

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  category.values.toList()[index],
                                  style: TextStyle(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                // size: 30,
                                // color: isSelected ? Colors.white : Colors.blue,
                              ),
                            ),

                            //),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Trending Products", style: tt.titleLarge),
              ),

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

                itemCount: 16,

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
    );
  }
}
