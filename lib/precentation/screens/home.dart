import '../widgets/home_app_bar.dart';
import '../widgets/home_category.dart';
import '../widgets/home_category_title.dart';
import '../widgets/home_flash_sale.dart';
import '../widgets/home_timer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset("assets/home/image.png"),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Super Flash Sale\n50% Off",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    HomeTimer(),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          const HomeCategoryTitle(
            firstTitle: "Category",
            secondTitle: "More Category",
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HomeCategory(
                  image: 'assets/home/category/shirt.png',
                  title: "Man shirt",
                ),
                HomeCategory(
                  image: 'assets/home/category/dress.png',
                  title: "Dress",
                ),
                HomeCategory(
                  image: 'assets/home/category/man bag.png',
                  title: "Man Work\nEquipment",
                ),
                HomeCategory(
                  image: 'assets/home/category/woman bag.png',
                  title: "Woman Bag",
                ),
                HomeCategory(
                  image: 'assets/home/category/man shoes.png',
                  title: "Man Shoes",
                ),
                HomeCategory(
                  image: 'assets/home/category/woman shoes.png',
                  title: "High Heels",
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const HomeCategoryTitle(
            firstTitle: "Flash Sale",
            secondTitle: "See More",
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HomeFlashSale(),
                HomeFlashSale(),
                HomeFlashSale(),
                HomeFlashSale(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const HomeCategoryTitle(
            firstTitle: "Mega Sale",
            secondTitle: "See More",
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HomeFlashSale(),
                HomeFlashSale(),
                HomeFlashSale(),
                HomeFlashSale(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
