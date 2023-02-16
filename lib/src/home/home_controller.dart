import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/auth/auth_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final AuthService service = AuthService();

  @action
  Future<void> signOut() async {
    await service.signOut();
  }
}
