import 'package:flutter/material.dart';
import 'package:news_app/shared/core/theme/app_colors.dart';
import 'package:news_app/shared/core/utils/app_assets.dart';
import 'package:news_app/shared/core/utils/font_style.dart';
import 'package:news_app/shared/shared_widget/post_builder/post_builder_model.dart';
import 'package:news_app/shared/shared_widget/post_builder/widget/post_builder_widget.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class PostBuilder extends StatelessWidget {
  PostBuilder({
    super.key, required this.isTrendingPost,
  });
final bool isTrendingPost ;


  @override
  Widget build(BuildContext context) {
    return isTrendingPost ?isTrendingPostBuilder():
    latestPostBuilder();
  }

}
