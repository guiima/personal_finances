import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/pages/auth/auth_service.dart';
import 'package:personal_finances/src/pages/home/home_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final AuthService service = AuthService();
  final HomeService homeService = HomeService();

  @action
  Future<void> signOut() async {
    await service.signOut();
  }

  @action
  Future<void> getUser() async {
    await homeService.getUser();
  }
}
