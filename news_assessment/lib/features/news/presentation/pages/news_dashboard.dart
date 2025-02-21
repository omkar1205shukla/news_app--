import 'package:flutter/material.dart';
import 'package:news_assessment/features/news/presentation/model/category_item.dart';
import 'package:news_assessment/features/news/presentation/pages/profile_screen.dart';
import 'package:news_assessment/features/news/presentation/widgets/news_screen.dart';

class NewsDashboard extends StatefulWidget {
  const NewsDashboard({super.key});

  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
  List<CategoryItem> items = [
    CategoryItem(itemName: "Technology", itemPath: "assets/images/tech.jpg"),
    CategoryItem(itemName: "Economy", itemPath: "assets/images/economy.jpg"),
    CategoryItem(itemName: "Sports", itemPath: "assets/images/sports.jpg"),
    CategoryItem(itemName: "Health", itemPath: "assets/images/health.jpg"),
    CategoryItem(itemName: "Fun", itemPath: "assets/images/fun.jpg"),
    CategoryItem(itemName: "Science", itemPath: "assets/images/science.jpg"),
    CategoryItem(itemName: "General", itemPath: "assets/images/general.jpg"),
    CategoryItem(itemName: "Music", itemPath: "assets/images/music.jpg"),
    CategoryItem(itemName: "Arts", itemPath: "assets/images/arts.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          crossAxisSpacing: 10.0, // spacing between columns
        ),
        padding: const EdgeInsets.all(8.0), // padding around the grid
        itemCount: items.length, // total number of items
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsCategory(
                    category: items[index].itemName,
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(items[index].itemPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                items[index].itemName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
