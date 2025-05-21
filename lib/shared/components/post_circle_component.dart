import 'package:flutter/material.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/theme/constants/app_paddings.dart';

class PostCircleComponent extends StatelessWidget {
  final String imageUrl;

  const PostCircleComponent({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.small,
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.accent, width: 2),
      ),
      child: Padding(
        padding: AppPaddings.extraSmall,
        child: ClipOval(child: Image.network(imageUrl, fit: BoxFit.cover)),
      ),
    );
  }
}
