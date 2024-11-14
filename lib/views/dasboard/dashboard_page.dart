import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone/config/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav_bar.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final String profileImageUrl = "assets/images/img_profile_pict.jpg";

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  @override
  void initState() {
    getToken().then(
      (value) {
        // Your code for token handling can go here
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 11, left: 5),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(profileImageUrl),
                  radius: 20,
                ),
              ),
              const SizedBox(width: 8),
              RichText(
                text: const TextSpan(
                  text: 'Welcome\n',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Artha',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9, top: 11),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_sharp,
                color: Colors.green,
                size: 28,
              ),
              onPressed: () {
                // Notification action
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2.8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.search, color: Colors.grey, size: 26),
                suffixIcon:
                    const Icon(Icons.mic, color: Colors.black, size: 26),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
          const SizedBox(height: 5),

          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: [
              'assets/images/bunga1.jpg',
              'assets/images/bunga2.jpg',
              'assets/images/bunga3.jpg'
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                'Ayo Temukan apa \n yang anda cari',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Ayo Temukan',
                                  style: TextStyle(
                                      color: hijau,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_forward,
                                  color: hijau,
                                  size: 23,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 10),
          // Recent Learning Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pelatihan Terbaru',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: hijau,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
          ListTile(
            title: const Text('Pertanian'),
            subtitle: const Text('Cara membasmi hama tikus'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          ListTile(
            title: const Text('Peternakan'),
            subtitle: const Text('Budidaya ayam freerange'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          ListTile(
            title: const Text('Perikanan'),
            subtitle: const Text('Budidaya ikan gabus'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          const SizedBox(height: 16),

          // Special for You Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Spesial untuk kamu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: hijau,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
          // Grid of Special Cards
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 3,
                  ),
                  children: [
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/telur.jpg',
                      productName: 'Telur Ayam',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Turun',
                      priceChangeColor: Colors.green,
                      priceChangeIcon: Icons.arrow_downward,
                    ),
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/jagung.jpg',
                      productName: 'Jagung',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Turun',
                      priceChangeColor: Colors.green,
                      priceChangeIcon: Icons.arrow_downward,
                    ),
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/pakcoy.jpg',
                      productName: 'Pakcoy Segar',
                      price: 'Rp 10.000/ikt',
                      priceChange: 'Harga Naik',
                      priceChangeColor: Colors.red,
                      priceChangeIcon: Icons.arrow_upward,
                    ),
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/tomat.jpg',
                      productName: 'Tomat Merah Segar',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Normal',
                      priceChangeColor: Colors.blue,
                      priceChangeIcon: Icons.remove,
                    ),
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/lele.jpg',
                      productName: 'Ikan Lele',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Naik',
                      priceChangeColor: Colors.red,
                      priceChangeIcon: Icons.arrow_upward,
                    ),
                    buildCatalogProductCard(
                      imageUrl: 'assets/images/telur.jpg',
                      productName: 'Telur Ayam',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Turun',
                      priceChangeColor: Colors.green,
                      priceChangeIcon: Icons.arrow_downward,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Widget buildCatalogProductCard({
    required String imageUrl,
    required String productName,
    required String price,
    required String priceChange,
    required Color priceChangeColor,
    required IconData priceChangeIcon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                    color: priceChangeColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(priceChangeIcon, color: Colors.white, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        priceChange,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(price, style: TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}
