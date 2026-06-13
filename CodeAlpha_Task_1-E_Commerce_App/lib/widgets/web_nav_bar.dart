import 'package:flutter/material.dart';

PreferredSizeWidget webAppBar(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return width < 800
      ? AppBar(
          title: const Text("Item Shop"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            //IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket)),
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(child: Icon(Icons.person)),
            ),
          ],
        )
      : AppBar(
  toolbarHeight: 110,
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text("Item Shop"),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Sign Up"),
          ),
        ],
      ),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        children: [
          TextButton(onPressed: () {}, child: Text("Mobile")),
          TextButton(onPressed: () {}, child: Text("Laptop")),
          TextButton(onPressed: () {}, child: Text("TVs")),
          TextButton(onPressed: () {}, child: Text("Headphones")),
          TextButton(onPressed: () {}, child: Text("Watches")),
          TextButton(onPressed: () {}, child: Text("Home Appliances")),
        ],
      ),
    ],
  ),
);
}
