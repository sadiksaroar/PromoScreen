import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PromoScreen(),
    );
  }
}

class PromoScreen extends StatelessWidget {
  final List<Map<String, String>> promoData = [
    {
      'title': 'Quality eggs at an affordable price',
      'image': 'images/banner-09.jpg.png',
      'color': 'FFF0F6',
    },
    {
      'title': 'Get the best quality products',
      'image': 'images/getsProduct.png',
      'color': 'FAF4E1',
    },
    {
      'title': 'Shopping with us for better quality',
      'image': 'images/lacchi.png',
      'color': 'EAF4EB',
    },
    {
      'title': 'Great Value Rising Crust Frozen Pizza, Supreme',
      'image': 'images/pizza.png',
      'color': 'FFF8E6',
    },
    {
      'title': 'Snacks that nourishes fresh & clean',
      'image': 'images/orange.png',
      'color': 'E1F4E8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView.builder(
        itemCount: promoData.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = promoData[index];
          return PromoCard(
            title: item['title']!,
            image: item['image']!,
            backgroundColor: Color(int.parse('0xFF${item['color']}')),
            isReversed: index == 2, // Third item will have a reversed layout
          );
        },
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;
  final bool isReversed;

  PromoCard({required this.title, required this.image, required this.backgroundColor, this.isReversed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: isReversed
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.black,
            ),
            child: Text('Shop Now', style: TextStyle(color: Colors.white)),
          ),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Only This Week',
                  style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text('Shop Now', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Image.asset(
            image,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
