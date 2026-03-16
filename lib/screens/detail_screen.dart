import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Image.asset(
                  destination.image,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(height: 300, color: Colors.grey),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destination.name,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark),
                      ),
                      Text(
                        destination.price,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.textLight),
                      const SizedBox(width: 4),
                      Text(destination.location, style: const TextStyle(color: AppColors.textLight)),
                      const SizedBox(width: 16),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text("${destination.rating}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    destination.description,
                    style: const TextStyle(height: 1.5, color: AppColors.textLight),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "Book Now",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(destination: destination),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}