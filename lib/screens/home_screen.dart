import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import '../widgets/destination_card.dart';
import '../utils/app_colors.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("TravelApp", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withValues(alpha: 26), blurRadius: 5)
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search destinations...",
                    prefixIcon: Icon(Icons.search, color: AppColors.textLight),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: TravelData.categories.length,
                itemBuilder: (context, index) {
                  final category = TravelData.categories[index];
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.white : AppColors.textDark,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
            ),
            
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: TravelData.destinations.length,
              itemBuilder: (context, index) {
                return DestinationCard(
                  destination: TravelData.destinations[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          destination: TravelData.destinations[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}