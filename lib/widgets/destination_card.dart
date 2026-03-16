import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../utils/app_colors.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    Key? key,
    required this.destination,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [ 
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15), 
              child: Image.asset(
                destination.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Icon(Icons.image),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          destination.location,
                          style: const TextStyle(color: AppColors.white, fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8), // Cannot be const
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      destination.rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}