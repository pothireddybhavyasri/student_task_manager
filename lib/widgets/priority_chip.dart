import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/themes.dart';

class PriorityChip extends StatelessWidget {
  final String priority;
  const PriorityChip({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final color = priority == 'High' ? AppColors.highPriority : AppColors.mediumPriority;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.flag, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            priority,
            style: GoogleFonts.inter(
              color: color, 
              fontWeight: FontWeight.w600, 
              fontSize: 12
            ),
          ),
        ],
      ),
    );
  }
}
