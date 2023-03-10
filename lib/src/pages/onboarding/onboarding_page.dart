import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_finances/src/pages/onboarding/carousel_item_component.dart';
import 'package:personal_finances/src/pages/onboarding/onboarding_controller.dart';
import 'package:personal_finances/src/pages/onboarding/page_incidator_component.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final CarouselController _controller = CarouselController();
  final OnboardinglController _onboardinglController = OnboardinglController();

  late List<CarouselItemComponent> carouselItemList;
  late List<Widget> items;

  @override
  void initState() {
    initializeCarousel();

    SchedulerBinding.instance.scheduleFrameCallback((_) {
      _onboardinglController.finisheOnboardingShow();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: height * 0.8,
                  ),
                  child: CarouselSlider(
                    items: items = carouselItemList
                        .map((CarouselItemComponent item) => item)
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: height * 0.7,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        _onboardinglController.setIndex(index);
                      },
                    ),
                  ),
                ),
              ),
              PageIndicatorComponent(
                controller: _controller,
                currentIndex: _onboardinglController.currentIndex,
                carouselItemList: carouselItemList,
              ),
            ],
          );
        },
      ),
    );
  }

  void initializeCarousel() {
    carouselItemList = <CarouselItemComponent>[
      const CarouselItemComponent(
        image: 'assets/money_piggy.svg',
        title: 'Registre suas receitas e despesas',
        content:
            'Tenha uma vis??o completa de suas finan??as registrando todas as suas receitas e despesas mensais. Assim, voc?? poder?? controlar seus gastos e tomar decis??es financeiras mais inteligentes.',
      ),
      const CarouselItemComponent(
        image: 'assets/static_chart.svg',
        title: 'Gerencie seus investimentos, reserva de emerg??ncia e d??vidas',
        content:
            'Mantenha um registro detalhado de seus investimentos, reserve um fundo para emerg??ncias e gerencie suas d??vidas de forma eficiente. Tenha a tranquilidade de saber que est?? preparado para qualquer situa????o.',
      ),
      const CarouselItemComponent(
        image: 'assets/projections.svg',
        title: 'Alcance seus sonhos e aproveite oportunidades',
        content:
            'Defina seus objetivos financeiros e alcance-os com nossa ajuda. Al??m disso, esteja preparado para aproveitar qualquer oportunidade que surja, registrando o dinheiro destinado a isso.',
      )
    ];
  }
}
