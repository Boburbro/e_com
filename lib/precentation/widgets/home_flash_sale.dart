import 'package:flutter/material.dart';

class HomeFlashSale extends StatelessWidget {
  const HomeFlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/home/flash/image1.png',
                    height: 85,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "FS - Nike Air\nMax 270 React...",
                maxLines: 2,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "\$299,43",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "\$534,33",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "24% Off",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
