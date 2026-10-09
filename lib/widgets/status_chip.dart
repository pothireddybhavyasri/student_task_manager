import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/themes.dart';

class StatusChip extends StatelessWidget {
  final bool isCompleted;
  const StatusChip({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final color = isCompleted ? AppColors.success : AppColors.pending;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isCompleted ? Icons.check_circle : Icons.pending, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            isCompleted ? 'Done' : 'Pending',
            style: GoogleFonts.inter(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
