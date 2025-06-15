import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../config/const.dart';
import '../data/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Demo'), backgroundColor: AppConstants.primaryColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Section
            Padding(padding: const EdgeInsets.all(AppConstants.padding), child: Text('Carousel', style: Theme.of(context).textTheme.headlineSmall)),
            CarouselSlider(
              options: CarouselOptions(height: 200, autoPlay: true, enlargeCenterPage: true),
              items:
                  items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                            child: Image.asset(item.imagePath, fit: BoxFit.cover, width: double.infinity),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
            // GridView Section
            Padding(padding: const EdgeInsets.all(AppConstants.padding), child: Text('GridView', style: Theme.of(context).textTheme.headlineSmall)),
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(item.imagePath, fit: BoxFit.cover, width: double.infinity)),
                        Padding(padding: const EdgeInsets.all(8.0), child: Text(item.title)),
                      ],
                    ),
                  );
                },
              ),
            ),
            // ListView Section
            Padding(padding: const EdgeInsets.all(AppConstants.padding), child: Text('ListView', style: Theme.of(context).textTheme.headlineSmall)),
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(leading: Image.asset(item.imagePath, width: 50, height: 50, fit: BoxFit.cover), title: Text(item.title)),
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
