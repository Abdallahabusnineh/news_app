import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/shared/shared_widget/autho_builder.dart';
import 'package:news_app/src/comment_screen/presentation/provider/comment_change_notifier.dart';
import 'package:news_app/src/new_sources/presentation/providers/newsource_notifier.dart';
import 'package:news_app/src/post_screen/presentation/provider/get_post_info_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsourceNotifier newsourceNotifier =ref.watch(newSourceChangeNotifierProviderTest);
    CommentChangeNotifier commentChangeNotifier =
        ref.watch(commentChangeNotifierProvider);
    GetPostInfoNotifier getPostInfoNotifier =
        ref.watch(getPostInfoNotifierProvider);
    var postItem = getPostInfoNotifier.getPostInfoModel;
    //  print('postItem ${postItem!.userId}');
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
        body: getPostInfoNotifier.isLoading
            ? const Center(
                child: SpinKitDoubleBounce(
                color: AppColors.primaryColor,
              ))
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthorBuilder(
                      authorName: postItem?.userName ?? '',
                      authorImg: AppAssets.trendingCircleAvatar,
                      subtitle: postItem?.createdAt ?? '',
                      id: postItem?.userId ?? 1,
                      isFollowed: newsourceNotifier.sources[postItem!.userId - 1].isFollowed,
                    ),
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
                      postItem.topicName,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      postItem.title ?? '',
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
                      text: postItem.content,
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
                    SizedBox(
                      height: 3.h,
                    ),
                    /* RichText(
                  text: TextSpan(
                text:
                    'In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.',
                style: Theme.of(context).textTheme.labelLarge,
              )),*/
                  ],
                ),
              ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
    border: Border.fromBorderSide(
    BorderSide(
    color: Theme.of(context).brightness == Brightness.light
    ? Colors.grey.shade200
        : Colors.transparent,
    width: 1,
    ),),),
          child: Row(
            children: [
              postItem?.isLiked ?? false
                  ? IconButton(
                      onPressed: () {
                        getPostInfoNotifier
                            .toggleLikePost(postItem?.postId ?? 0);
                      },
                      icon:
                          const Icon(Icons.favorite, color: Color(0xFFED2E7E)))
                  : IconButton(
                      onPressed: () {
                        getPostInfoNotifier
                            .toggleLikePost(postItem?.postId ?? 0);
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Color(0xFFED2E7E)),
                    ),
              Text(
                '${postItem?.likeCount}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 2.w,
              ),
              IconButton(
                onPressed: () {
                  commentChangeNotifier
                      .getCommentByPostId(postItem?.postId ?? 0);
                  appRouter.push(CommentRoute(postId: postItem?.postId ?? 0));
                },
                icon:  Image.asset(AppAssets.commentIcon,color: Theme.of(context).brightness == Brightness.light ? Colors.black : AppColors.whiteColor,),
              ),

              Text(
                "${postItem?.commentCount}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: postItem?.isBookMarked ?? false
                      ? const Icon(
                          Icons.bookmark,
                          color: AppColors.primaryColor,
                        )
                      : const Icon(
                          Icons.bookmark_outline,
                          color: AppColors.primaryColor,
                        )),
            ],
          ),
        ));
  }
}
