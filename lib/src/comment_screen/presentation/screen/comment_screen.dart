
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/app_router.dart';
import 'package:news_app/src/comment_screen/presentation/provider/comment_change_notifier.dart';
import 'package:news_app/src/comment_screen/presentation/widget/comment_widget.dart';
import 'package:news_app/src/visit_profile_author/presentation/provider/profile_author_notifier.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:auto_route/auto_route.dart';
@RoutePage()
class CommentScreen extends ConsumerWidget {
  const CommentScreen({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileAuthorNotifier profileAuthorNotifier =
        ref.watch(profileAuthorProvider);
    CommentChangeNotifier commentChangeNotifier =
        ref.watch(commentChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: commentChangeNotifier.isLoading
          ? const Center(
              child: SpinKitDoubleBounce(color: AppColors.primaryColor))
          : RefreshIndicator(
              onRefresh: () {
                return commentChangeNotifier.getCommentByPostId(postId);
              },
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                  bottom: 15.h,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: commentChangeNotifier.comments.length,
                itemBuilder: (context, index) {
                  var item = commentChangeNotifier.comments[index];
                  return InkWell(
                    onTap: () {
                      profileAuthorNotifier.getProfileAuthor(item.userId);
                      appRouter.push(const VisitProfileAuthorRoute());
                    },
                    onLongPress: () {
                      AwesomeDialog(
                        context: context,
                        dialogBorderRadius: BorderRadius.circular(10),
                        dialogBackgroundColor:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.white
                                : AppColors.blackColor,
                        animType: AnimType.topSlide,
                        title: 'dfas',
                        dialogType: DialogType.question,
                        btnCancelOnPress: () {},
                        body: Column(
                          children: [
                            const FittedBox(
                              child: Text(
                                'Are you sure want to edit your comment?',
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              controller: commentChangeNotifier
                                  .editingCommentController,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: 'edit your comment ',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  prefixIcon: const Icon(Icons.edit),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                            ),
                          ],
                        ),
                        btnOkOnPress: () {
                          commentChangeNotifier.editComment(
                              postId, item.commentId);
                        },
                        btnOkText: 'Edit',
                        btnCancelText: 'No',
                      ).show();
                    },
                    child: CommentWidget(
                        name: item.userName,
                        comment: item.commentContent,
                        date: item.createdAt.substring(0, 10),
                        likeNum: '125',
                        image: AppAssets.notificationImg),
                  );
                },
              ),
            ),
      bottomSheet: Form(
        key: commentChangeNotifier.formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : Colors.transparent,
                width: 1,
              ),
            )
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: commentChangeNotifier.commentController,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                      hintText: 'Type your comment',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              IconButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 4.w,
                    )),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColors.primaryColor),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                  ),
                  onPressed: () {
                    if (commentChangeNotifier.formKey.currentState!
                        .validate()) {
                      commentChangeNotifier.createComment(postId);
                    } else {
                      print(
                          'error ${commentChangeNotifier.formKey.currentState!.validate()}');
                    }
                  },
                  icon: Image.asset(AppAssets.sendComment)),
            ],
          ),
        ),
      ),
    );
  }
}
