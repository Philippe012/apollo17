import '../models/destination.dart';

class TravelData {
  static final List<Destination> destinations = [
    Destination(
      id: 1,
      name: "Kigali, Rwanda",
      location: "Africa",
      price: "\$1,200",
      rating: 4.8,
      image: "assets/images/bali.jpg",
      description: "Experience the tropical paradise of Bali. Enjoy pristine beaches, ancient temples, and vibrant culture. Perfect for relaxation and adventure.",
    ),
    Destination(
      id: 2,
      name: "Paris, France",
      location: "Europe",
      price: "\$2,500",
      rating: 4.9,
      image: "assets/images/paris.jpg",
      description: "Visit the city of love and lights. Explore the Eiffel Tower, Louvre Museum, and enjoy world-class cuisine in the heart of France.",
    ),
    Destination(
      id: 3,
      name: "Tokyo, Japan",
      location: "Asia",
      price: "\$1,800",
      rating: 4.7,
      image: "assets/images/tokyo.jpg",
      description: "A blend of the ultramodern and the traditional. From neon-lit skyscrapers to historic temples, Tokyo offers a unique experience.",
    ),
    Destination(
      id: 4,
      name: "New York, USA",
      location: "North America",
      price: "\$2,100",
      rating: 4.6,
      image: "assets/images/newyork.jpg",
      description: "The city that never sleeps. Experience Broadway, Central Park, and the iconic skyline of Manhattan.",
    ),
  ];

  static final List<String> categories = [
    "All",
    "Asia",
    "Europe",
    "Americas",
    "Africa"
  ];
}