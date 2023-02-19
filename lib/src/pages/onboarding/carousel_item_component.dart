import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class CarouselItemComponent extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const CarouselItemComponent({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          image,
          height: 200,
        ).paddingTop(50).paddingBottom(40),
        Text(
          title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.primaryTitle,
          ),
        ).paddingBottom(32),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.body,
          ),
        ),
      ],
    );
  }
}
