import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackerPage extends StatelessWidget {
  final String orderId;

  const OrderTrackerPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    final List<OrderPoint> timeline = [
  OrderPoint(
    title: "Order Placed",
    address: "Mumbai Warehouse",
    date: DateTime(2026, 12, 20),
    isCompleted: true,
  ),
  OrderPoint(
    title: "Packed",
    address: "Mumbai Sorting Center",
    date: DateTime(2026, 12, 21),
    isCompleted: true,
  ),
  OrderPoint(
    title: "Shipped",
    address: "Pune Hub",
    date: DateTime(2026, 12, 22),
    isCompleted: true,
  ),
  OrderPoint(
    title: "Out For Delivery",
    address: "Khar, Mumbai",
    date: DateTime(2026, 12, 25),
    isCompleted: false,
  ),
  OrderPoint(
    title: "Delivered",
    address: "Customer Address",
    date: DateTime(2026, 12, 26),
    isCompleted: false,
  ),
];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #$orderId",
              style: tt.titleMedium,
            ),
            Text(
              "Placed on Dec 20, 2026",
              style: tt.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Shipped",
                          style: tt.titleLarge,
                        ),
                        const Chip(
                          label: Text("SECURE"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const LinearProgressIndicator(
                      value: 0.6,
                      minHeight: 10,
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("60% Completed"),
                        Text("2 Days Left"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: timeline.length,
                itemBuilder: (context, index) {
                  return CustomTimelineTile(
                    isFirst: index == 0,
                    isLast: index == timeline.length - 1,
                    orderPoint: timeline[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final OrderPoint orderPoint;

  const CustomTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.orderPoint,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: orderPoint.isCompleted
            ? Colors.green
            : Colors.grey,
        indicator: Icon(
          orderPoint.isCompleted
              ? Icons.check
              : Icons.radio_button_unchecked,
          color: Colors.white,
          size: 18,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: orderPoint.isCompleted
            ? Colors.green
            : Colors.grey,
      ),
      afterLineStyle: LineStyle(
        color: orderPoint.isCompleted
            ? Colors.green
            : Colors.grey,
      ),
      endChild: OrderDetails(
        orderPoint: orderPoint,
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final OrderPoint orderPoint;

  const OrderDetails({
    super.key,
    required this.orderPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.local_shipping),
        title: Text(orderPoint.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(orderPoint.address),
            const SizedBox(height: 4),
            Text(
              "${orderPoint.date.day}/${orderPoint.date.month}/${orderPoint.date.year}",
            ),
          ],
        ),
      ),
    );
  }
}
class OrderPoint {
  final String title;
  final String address;
  final DateTime date;
  final bool isCompleted;

  OrderPoint({
    required this.title,
    required this.address,
    required this.date,
    required this.isCompleted,
  });
}