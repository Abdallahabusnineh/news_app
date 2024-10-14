import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';

class AuthorBuilder extends StatelessWidget {
  const AuthorBuilder({super.key, required this.authorName, required this.authorImg, required this.subtitle});
final String authorName,authorImg,subtitle;
  @override
  Widget build(BuildContext context) {
    return    Row(children: [
      CircleAvatar(
          backgroundImage:
           AssetImage(authorImg),),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authorName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
      const Spacer(),
      Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.primaryColor),
          child: TextButton(
            onPressed: () {},
            child: Text('Following',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)),
          )),
    ]);

  }
}
