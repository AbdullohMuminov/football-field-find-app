import 'package:football_field_find/src/core/constants/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomStatusWidget extends StatelessWidget {
  final bool? isAvailable;

  const CustomStatusWidget({
    super.key,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        height: 24.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isAvailable ?? false ? context.theme.colorScheme.primaryContainer : context.theme.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: REdgeInsets.only(top: 4, right: 8, bottom: 4, left: 8),
            child: Text(
              isAvailable ?? false ? "Working" : "Closed",
              style: context.textTheme.bodyMedium?.copyWith(
                color: isAvailable ?? false ? context.theme.colorScheme.surface : context.theme.colorScheme.onTertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
