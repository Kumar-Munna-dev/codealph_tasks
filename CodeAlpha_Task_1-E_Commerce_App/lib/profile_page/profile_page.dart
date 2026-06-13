import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 30),

              /// PROFILE SECTIONS
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(radius: 45, child: Text('MK')),
                    ),
                    SizedBox(height: 10),
                    Text('MUNNA KUMAR'),
                    Text('LAPTOPUSE18@GNAIL.COM'),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.white),
                      label: Text(
                        'Edit Profile',
                        style: tt.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '24',
                                style: tt.titleLarge?.copyWith(
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text(
                                'Wishlist',
                                style: tt.titleMedium?.copyWith(
                                  color: Colors.black,
                                  fontStyle: FontStyle.values[1],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '12',
                                style: tt.titleLarge?.copyWith(
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text(
                                'Coupons',
                                style: tt.titleMedium?.copyWith(
                                  color: Colors.black,
                                  fontStyle: FontStyle.values[1],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '1450',
                                style: tt.titleLarge?.copyWith(
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text(
                                'Points',
                                style: tt.titleMedium?.copyWith(
                                  color: Colors.black,
                                  fontStyle: FontStyle.values[1],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Text('My Orders'),
              Container(
                height: 250,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    
                    my_order(
                      title: 'Processing',
                      subtitle: '2 items being prepared',
                      icon: Icons.rotate_left,
                      ontap: () {},
                    ),
                    my_order(
                      title: 'Shipped',
                      subtitle: '1 order out for delivery',
                      icon: Icons.local_shipping,
                      ontap: () {},
                    ),
                    my_order(
                      title: 'Review Needed',
                      subtitle: 'Help other by sharing feedback',
                      icon: Icons.star,
                      ontap: () {},
                    ),
                  ],
                ),
              ),

              Text('Accounts Settings'),
              Container(
                height: 250,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    listTile(
                      title: 'Personal information',
                      icon: Icons.person,
                      ontap: () {},
                    ),
                    listTile(
                      title: 'Addresses',
                      icon: Icons.gps_fixed,
                      ontap: () {},
                    ),
                    listTile(
                      title: 'Payments Methods',
                      icon: Icons.payment,
                      ontap: () {},
                    ),
                    listTile(
                      title: 'Notifications',
                      icon: Icons.notifications,
                      ontap: () {},
                    ),
                  ],
                ),
              ),

              Text('Support & Legal'),
              Container(
                height: 250,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    listTile(
                      title: 'Help Center',
                      icon: Icons.help_center,
                      ontap: () {},
                    ),
                    listTile(
                      title: 'Privacy Policy',
                      icon: Icons.privacy_tip,
                      ontap: () {},
                    ),
                    listTile(
                      title: 'Terms & Conditions',
                      icon: Icons.description,
                      ontap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget my_order({
  required String title,
  required String subtitle,
  required IconData icon,
  required VoidCallback ontap,
}) {
  return ListTile(
    leading: Container(child: Icon(icon)),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: ontap,
  );
}

Widget listTile({
  required String title,
  required IconData icon,
  required VoidCallback ontap,
}) {
  return ListTile(
    leading: Container(child: Icon(icon)),
    title: Text(title),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: ontap,
  );
}
