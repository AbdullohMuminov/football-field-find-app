import 'package:football_field_find/src/core/constants/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_field_find/src/core/widgets/app_material_context.dart';
import '../../../../core/style/app_images.dart';
import 'package:flutter/material.dart';
import 'custom_status_widget.dart';

class CustomCardWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final String? address;
  final int? pricePerHour;
  final bool? isAvailable;

  const CustomCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.address,
    required this.pricePerHour,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          border: Border.all(
            width: 1.w,
            color: context.theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
              child: Stack(
                children: [
                  Image.network(
                    image ?? "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: 140.w,
                    loadingBuilder: (context, child, loading) => loading != null ? AppImages.imageNotLoaded : child,
                    errorBuilder: (context, error, stackTrace) => AppImages.imageNotLoaded,
                  ),
                  CustomStatusWidget(
                    isAvailable: isAvailable,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "Unknown",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.theme.colorScheme.secondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text(
                      address ?? "Unknown",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.surfaceBright,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text(
                      pricePerHour != null ? "$pricePerHour uzs/hour" : "Unknown price",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          height: 36.h,
                          minWidth: 135.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          color: isAvailable ?? false ? context.theme.colorScheme.primary : context.theme.colorScheme.surfaceBright,
                          elevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            "Book now!",
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.theme.colorScheme.surface,
                            ),
                          ),
                        ),
                        const Spacer(),
                        MaterialButton(
                          onPressed: () {},
                          height: 36.h,
                          minWidth: 36.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          color: themeController.isLight ? const Color.fromRGBO(247, 247, 247, 1) : const Color(0xFF2a5278),
                          elevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          padding: EdgeInsets.zero,
                          child: themeController.isLight ? AppImages.directionIconLightMode : AppImages.directionIconDarkMode,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
