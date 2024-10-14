import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.name, required this.comment, required this.date, required this.likeNum, required this.image});
final String name,comment,date,likeNum,image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 2.h
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            // Placeholder image
            radius: 20,
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  comment,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                      date,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                        onTap: () {

                        },
                        child: const Icon(Icons.favorite_outline,size: 20,)),
                    SizedBox(width: 1.w,),
                    Text(
                      '$likeNum Likes',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                        onTap: () {

                        },
                        child: const Icon(Icons.reply_outlined,size: 20,)),
                    SizedBox(width: 1.w,),
                    Text(
                      'Reply',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
