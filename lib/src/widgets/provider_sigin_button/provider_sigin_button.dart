import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum Provider {
  google,
  facebook;

  String get icon {
    switch (this) {
      case Provider.google:
        return 'assets/google.svg';
      case Provider.facebook:
        return 'assets/facebook.svg';
    }
  }
}

class ProviderSiginComponent extends StatelessWidget {
  final Function? onTap;
  final Provider provider;

  const ProviderSiginComponent({
    super.key,
    this.onTap,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: GestureDetector(
          onTap: () => onTap?.call(),
          child: SvgPicture.asset(provider.icon),
        ),
      ),
    );
  }
}
