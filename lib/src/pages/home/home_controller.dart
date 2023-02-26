import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/global_states/user/user_service.dart';
import 'package:personal_finances/src/global_states/user/user_state.dart';
import 'package:personal_finances/src/pages/auth/auth_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final UserState _userState = UserState.instace;
  final UserService _userService = UserService();
  final AuthService service = AuthService();

  @action
  Future<void> signOut() async {
    await service.signOut();
  }

  @action
  Future<void> initialize() async {
    if (_userState.isEmpity) {
      getUser();
    }
  }

  Future<void> getUser() async {
    try {
      _userService.getUserByUidAndSalveInGlobalState();
    } catch (e) {
      Exception();
    }
  }
}
