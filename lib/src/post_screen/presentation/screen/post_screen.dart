import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/shared_widget/autho_builder.dart';
import 'package:news_app/src/comment_screen/presentation/screen/comment_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const AuthorBuilder(authorName: 'BBC News', authorImg: AppAssets.trendingCircleAvatar, subtitle: '14m ago',),
              SizedBox(
                height: 3.h,
              ),
              Image.asset(
                AppAssets.trendingImg,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Europe',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 24),
                maxLines: 4,
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                  text: TextSpan(
                text:
                    'Ukrainian President Volodymyr Zelensky has accused European countries'
                    'that continue to buy Russian oil of "earning their money in other people\'s blood".',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              SizedBox(
                height: 3.h,
              ),
              RichText(
                  text: TextSpan(
                text:
                    'In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.',
                style: Theme.of(context).textTheme.labelLarge,
              )),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Row(
            children: [
              const Icon(Icons.favorite, color: Color(0xFFED2E7E)),
              SizedBox(
                width: 1.h,
              ),
              Text(
                '24.5',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 3.w,
              ),
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommentScreen()));
             }, icon:  const Icon(
               Icons.mode_comment_outlined,
             ),),
              SizedBox(
                width: 1.h,
              ),
              Text(
                '1K',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.bookmark,
                  color: AppColors.primaryColor,
                )),
            ],
          ),
        ));
  }
}
