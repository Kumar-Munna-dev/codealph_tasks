import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:shopitem/widgets/product_card.dart';
import 'package:shopitem/widgets/web_nav_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<IconData, String> category = {
      Icons.phone_android: 'Mobiles',
      Icons.laptop: 'Laptops',
      Icons.tv: 'TVs',
      Icons.headphones: 'Headphones',
      Icons.watch: 'Watches',
      Icons.home: 'Home Appliances',
    };
    List<String> carousel = [
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/07d24bb874112230.jpg?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/b75869eafbb70268.jpg?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/3fb3f4b33ea4d412.png?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/3dc5a6ef47bc8583.jpg?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/005d7d402fafad07.png?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/e7ac32f00c292ca9.png?q=80',
      'https://rukminim2.flixcart.com/fk-p-flap/1600/780/image/b75869eafbb70268.jpg?q=80',
    ];
    String imgurls =
        'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

    final tt = Theme.of(context).textTheme;
    int crossCounts = MediaQuery.of(context).size.width > 800 ? 6 : 3;
    return Scaffold(
      appBar: webAppBar(context),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterCarousel(
                options: FlutterCarouselOptions(
                  height: 200.0,
                  showIndicator: true,
                  autoPlay: true,
                  initialPage: 1,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: carousel.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          print('Carousel: ${carousel.indexOf(i)}');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(i, fit: BoxFit.fill),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              /// Categories Title
              Text('Categories', style: tt.titleLarge),

              const SizedBox(height: 20),

              /// Categories List
              SizedBox(
                height: 110,
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
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.blue.shade50,
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Icon(
                                  category.keys.toList()[index],
                                  size: 30,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.blue,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              category.values.toList()[index],
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// Trending Title
              Text('Trending Now', style: tt.titleLarge),

              const SizedBox(height: 12),

              /// Product Grid
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),

                padding: EdgeInsets.zero,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCounts,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
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
    );
  }
}
