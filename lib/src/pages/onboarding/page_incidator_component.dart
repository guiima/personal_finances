import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/src/pages/onboarding/carousel_item_component.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class PageIndicatorComponent extends StatefulWidget {
  final int currentIndex;
  final CarouselController controller;
  final List<CarouselItemComponent> carouselItemList;

  const PageIndicatorComponent({
    super.key,
    required this.currentIndex,
    required this.controller,
    required this.carouselItemList,
  });

  @override
  State<PageIndicatorComponent> createState() => _PageIndicatorComponentState();
}

class _PageIndicatorComponentState extends State<PageIndicatorComponent> {
  @override
  Widget build(BuildContext context) {
    final Color color = (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : AppColors.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: widget.carouselItemList.map(
            (CarouselItemComponent url) {
              int index = widget.carouselItemList.indexOf(url);
              return GestureDetector(
                onTap: () => widget.controller.animateToPage(index),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color
                        .withOpacity(widget.currentIndex == index ? 0.9 : 0.4),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.auth),
          child: const Text(
            'Pular',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ).paddingLTRB(42, 0, 42, 32);
  }
}
