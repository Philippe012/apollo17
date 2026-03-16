import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: isOutlined
            ? null
            : const LinearGradient(colors: [AppColors.primary, AppColors.secondary]), // Added 'const' here
        borderRadius: BorderRadius.circular(12),
        border: isOutlined
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 77), // Replaced 'withOpacity' with 'withValues'
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isOutlined ? AppColors.primary : AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}