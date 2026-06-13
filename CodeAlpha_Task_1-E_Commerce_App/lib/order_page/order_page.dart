import 'package:flutter/material.dart';
import 'package:shopitem/widgets/reorder_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    String imgurls =
        'https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?q=80&w=580&auto=format&fit=crop';

    return Scaffold(
      appBar: AppBar(
        title: const Text('ItemShop'),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// TITLE
          Text(
            'My Orders',
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          /// SEARCH
          TextField(
            decoration: InputDecoration(
              hintText: 'Search past purchases',

              prefixIcon: const Icon(Icons.search),

              filled: true,

              fillColor: cs.surfaceContainerHighest.withOpacity(.4),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// FILTERS
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                FilterChipWidget(title: 'All Orders', selected: true),

                FilterChipWidget(title: 'Processing'),

                FilterChipWidget(title: 'Delivered'),

                FilterChipWidget(title: 'Cancelled'),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// ORDERS
          OrderCard(
            orderId: 'ORDER #LX-88291',
            productName: 'Chronos Elite Series 7',
            variant: 'Silver • 42mm',
            date: 'October 24, 2023',
            price: 125,
            imageUrl: imgurls,
            status: OrderStatus.delivered,
          ),
          OrderCard(
            orderId: 'ORDER #LX-88291',
            productName: 'Chronos Elite Series 7',
            variant: 'Silver • 42mm',
            date: 'October 24, 2023',
            price: 125,
            imageUrl: imgurls,
            status: OrderStatus.cancelled,
          ),
          OrderCard(
            orderId: 'ORDER #LX-88291',
            productName: 'Chronos Elite Series 7',
            variant: 'Silver • 42mm',
            date: 'October 24, 2023',
            price: 125,
            imageUrl: imgurls,
            status: OrderStatus.processing,
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String title;
  final bool selected;

  const FilterChipWidget({
    super.key,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

        decoration: BoxDecoration(
          color: selected
              ? cs.primary
              : cs.surfaceContainerHighest.withOpacity(.5),

          borderRadius: BorderRadius.circular(30),
        ),

        child: Center(
          child: Text(
            title,

            style: tt.bodyMedium?.copyWith(
              color: selected ? cs.onPrimary : cs.onSurface,

              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
