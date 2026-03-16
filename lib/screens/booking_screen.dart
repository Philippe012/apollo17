import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;

  const BookingScreen({Key? key, required this.destination}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGuests = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Booking Summary"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 51), blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(widget.destination.image, height: 60, width: 60, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.destination.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(widget.destination.price, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text("Personal Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value!.isEmpty ? "Enter name" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? "Enter email" : null,
              ),
              const SizedBox(height: 16),
              const Text("Number of Guests", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedGuests,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ["1", "2", "3", "4", "5+"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (val) => setState(() => _selectedGuests = val!),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Confirm Booking",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Success"),
                        content: const Text("Your booking has been confirmed!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx); // Close dialog
                              Navigator.pop(context); // Back to Detail
                              Navigator.pop(context); // Back to Home
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}