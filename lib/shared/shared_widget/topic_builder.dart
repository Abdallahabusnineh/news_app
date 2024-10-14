import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopicBuilder extends StatelessWidget {
  const TopicBuilder({super.key, required this.image, required this.title, required this.subtitle});
final String image,title,subtitle;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 1.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text('Save',
                  style: Theme.of(context).textTheme.displayLarge),
            )),
      ],
    );
  }
}
