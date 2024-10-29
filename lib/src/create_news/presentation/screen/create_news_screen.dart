import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/create_news/presentation/provider/create_post_notifer.dart';
import 'package:news_app/src/create_news/presentation/widget/all_border_dash.dart';
import 'package:news_app/src/home/presentation/widget/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:auto_route/auto_route.dart';
@RoutePage()
class CreateNewsPost extends ConsumerWidget {
  CreateNewsPost({super.key});

  String? selectedCategoryKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreatePostNotifer createPostNotifer = ref.watch(createPostNotiferProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create News",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: createPostNotifer.isLoading
          ? const Center(
              child: SpinKitDoubleBounce(
              color: AppColors.primaryColor,
            ))
          : CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: Form(
                      key: createPostNotifer.formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5.w, right: 5.w, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            createPostNotifer.attachmentFile != null
                                ? Expanded(
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          Image.file(
                                            createPostNotifer.attachmentFile!,
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: IconButton(
                                              style: IconButton.styleFrom(
                                                iconSize: 3.h,
                                                backgroundColor:
                                                    AppColors.whiteColor,
                                              ),
                                              onPressed: () {
                                                createPostNotifer
                                                    .pickPostFile();
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color:
                                                    AppColors.lightPurpleColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        createPostNotifer.pickPostFile();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.27,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.grey.shade200
                                            : AppColors.textFormFieldDarkMode,
                                        child: CustomPaint(
                                          painter: DashedBorderPainter(),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.add,
                                                    size: 40,
                                                    color: AppColors
                                                        .lightPurpleColor),
                                                SizedBox(height: 1.h),
                                                Text("Add Cover Photo",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 2.h),
                            // News Title Input
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    controller:
                                        createPostNotifer.postTitleController,
                                    decoration: InputDecoration(
                                      hintText: "News title",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(fontSize: 24),
                                      border: InputBorder.none,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 24),
                                  ),
                                ),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    hint: Text('Select Category',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                    value: selectedCategoryKey,
                                    items:
                                        categories.keys.map((String category) {
                                      return DropdownMenuItem<String>(
                                        value: category,
                                        child: Text(category),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      selectedCategoryKey = newValue.toString();
                                      categories.values.toList();
                                      categories[selectedCategoryKey!];
                                      createPostNotifer.topicId =
                                          categories[selectedCategoryKey!];
                                      print(
                                          'new value $selectedCategoryKey ${createPostNotifer.topicId}');
                                    },
                                    //************************************ another way to do it ***********************************
                                    //${categories.values.elementAt(categories.keys.toList().indexOf(selectedCategoryKey!))}
                                  ),
                                )
                              ],
                            ),
                            const Divider(),
                            // News Article Input
                            Expanded(
                              child: TextFormField(
                                  controller:
                                      createPostNotifer.postContentController,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: "Add News/Article",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontSize: 16),
                                    border: InputBorder.none,
                                  ),
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                            ),
                            // Rich Text Editing Toolbar
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : AppColors.textFormFieldDarkMode,
                                  boxShadow: [
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 10,
                                          )
                                        : const BoxShadow(),
                                  ]),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.format_bold),
                                    onPressed: () {
                                      // Handle bold text formatting
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.format_italic),
                                    onPressed: () {
                                      // Handle italic text formatting
                                    },
                                  ),
                                  IconButton(
                                    icon:
                                        const Icon(Icons.format_list_numbered),
                                    onPressed: () {
                                      // Handle bullet list
                                    },
                                  ),
                                  IconButton(
                                    icon:
                                        const Icon(Icons.format_list_bulleted),
                                    onPressed: () {
                                      // Handle bullet list
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.link),
                                    onPressed: () {
                                      // Handle adding links
                                      createPostNotifer.pickPostFile();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // Publish Button
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade200
              : Colors.black,
        ))),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.text_fields),
              onPressed: () {
                // Handle font size changes
              },
            ),
            IconButton(
              icon: const Icon(Icons.format_align_left),
              onPressed: () {
                // Handle adding images
              },
            ),
            IconButton(
              icon: const Icon(Icons.image),
              onPressed: () {
                // Handle adding images
                createPostNotifer.pickPostFile();
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                // Handle other formatting options
              },
            ),
            const Spacer(),
            if (createPostNotifer.postContentController.text.isEmpty ||
                createPostNotifer.postTitleController.text.isEmpty ||
                createPostNotifer.attachmentFile == null ||
                createPostNotifer.topicId == null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryButtonColor,
                  foregroundColor: AppColors.secondaryButtonForGroundColor,
                ),
                onPressed: () {
                  showToast(
                      text: 'You should fill all the fields ',
                      state: ToastState.WARNING);
                },
                child: const Text("Publish"),
              )
            else
              ElevatedButton(
                onPressed: () {
                  // Handle publish action
                  if (createPostNotifer.formKey.currentState!.validate()) {
                    createPostNotifer.createPost(context);
                  }
                },
                child: const Text("Publish"),
              ),
          ],
        ),
      ),
    );
  }
}
