import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/src/create_news/presentation/widget/all_border_dash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateNewsPost extends StatelessWidget {
  const CreateNewsPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create News",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Handle cover photo upload
                ImagePicker.platform.pickImage(source: ImageSource.gallery);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade200
                    : AppColors.textFormFieldDarkMode,
                width: double.infinity,
                child: CustomPaint(
                  painter: DashedBorderPainter(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add,
                            size: 40, color: AppColors.lightPurpleColor),
                        SizedBox(height: 1.h),
                        Text("Add Cover Photo",
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // News Title Input
            TextFormField(
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
            const Divider(),

            // News Article Input
            Expanded(
              child: TextFormField(
                  maxLines: null,

                  decoration: InputDecoration(
                    hintText: "Add News/Article",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 16),

                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.labelLarge),
            ),

            // Rich Text Editing Toolbar
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : AppColors.textFormFieldDarkMode,
                  boxShadow: [
                    Theme.of(context).brightness == Brightness.light
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
                    icon: const Icon(Icons.format_list_numbered),
                    onPressed: () {
                      // Handle bullet list
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_list_bulleted),
                    onPressed: () {
                      // Handle bullet list
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: () {
                      // Handle adding links
                    },
                  ),
                ],
              ),
            ),

            // Publish Button
          ],
        ),
      ),
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
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                // Handle other formatting options
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle publish action
              },
              child: const Text("Publish"),
            ),
          ],
        ),
      ),
    );
  }
}
