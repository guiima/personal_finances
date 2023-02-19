import 'package:flutter/material.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String content;

  const CardComponent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.backgroundColor,
          width: 1,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(-1, 2), // changes position of shadow
          ),
        ],
        color: AppColors.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.subTitle,
                  fontWeight: FontWeight.w500,
                ),
              ).paddingTop(16),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.subTitle,
                  fontWeight: FontWeight.w400,
                ),
              ).paddingBottom(16),
            ],
          ),
          const Icon(Icons.more_horiz)
        ],
      ).paddingHorizontal(16),
    );
  }
}
