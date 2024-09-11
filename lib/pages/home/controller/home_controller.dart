import 'package:ifs_pass/apps_modules.g.dart';
import 'package:system_package/system.dart';

class HomeController extends BaseStatus {
  late SystemUser? _user;
  SystemUser? get user => _user;

  late bool _isBlocked;
  bool get isBlocked => _isBlocked;

  List<SystemAppModule> get apps => APP_MODULES;

  HomeController() {
    reset();
  }

  void reset() {
    _user = null;
    _isBlocked = true;

    notifyListeners();
  }

  Future<void> init() async {
    final userMap = await LocalData.readData(key: DataKey.user);

    _user = SystemUser.fromJson(userMap);
    _isBlocked = !IfspassApi().haveToken();

    notifyListeners();
  }

  Future<void> logout() async {
    await SecureLocalData.clearData(SecureDataKey.userName);
    await SecureLocalData.clearData(SecureDataKey.password);
    await LocalData.clearData(key: DataKey.user);
    IfspassApi().removeInterceptor<TokenInterceptor>();

    reset();
  }

  Future<void> changeBlocked() async {
    if (!_isBlocked) {
      IfspassApi().removeInterceptor<TokenInterceptor>();
    }

    await init();
  }
}
