import 'package:flutter/material.dart';
import 'package:shopitem/order_tracking/order_tracker_page.dart';

enum OrderStatus { delivered, processing, cancelled }

class OrderCard extends StatelessWidget {
  final String orderId;
  final String productName;
  final String variant;
  final String date;
  final double price;
  final String imageUrl;
  final OrderStatus status;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.productName,
    required this.variant,
    required this.date,
    required this.price,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    IconData statusIcon;
    Color statusColor;
    String statusText;

    switch (status) {
      case OrderStatus.delivered:
        statusIcon = Icons.done;
        statusColor = Colors.green;
        statusText = "Delivered";
        break;

      case OrderStatus.processing:
        statusIcon = Icons.rotate_right;
        statusColor = Colors.orange;
        statusText = "Processing";
        break;

      case OrderStatus.cancelled:
        statusIcon = Icons.close;
        statusColor = Colors.red;
        statusText = "Cancelled";
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withOpacity(.4),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: statusColor.withOpacity(.15),

                    child: Icon(statusIcon, size: 16, color: statusColor),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    statusText,
                    style: tt.bodyMedium?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(date, style: tt.bodySmall?.copyWith(color: Colors.grey)),

          const SizedBox(height: 14),

          /// PRODUCT
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      variant,
                      style: tt.bodyMedium?.copyWith(color: Colors.grey),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '\$${price.toStringAsFixed(2)}',

                      style: tt.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// BUTTONS
          Row(
            children: [
              if (status == OrderStatus.delivered)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},

                    icon: const Icon(Icons.refresh),

                    label: const Text("Reorder"),
                  ),
                ),

              if (status == OrderStatus.delivered) const SizedBox(width: 12),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderTrackerPage(orderId: orderId),
                      ),
                    );
                  },

                  icon: const Icon(Icons.shopping_bag_outlined),

                  label: const Text("Details"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
