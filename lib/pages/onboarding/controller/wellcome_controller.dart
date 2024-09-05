import 'package:flutter/material.dart';
import 'package:ifs_pass/main_module.dart';
import 'package:ifs_pass/services/ifspass_serivce.dart';
import 'package:system_package/system.dart';

class WellcomeController extends BaseStatus {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  late SystemUser? _user;
  SystemUser? get user => _user;

  bool get isValidLogin =>
      userNameCtrl.text.length == 7 && passwordCtrl.text.isNotEmpty;

  bool get haveAccount => user != null;

  late bool _allowTerms;
  bool get allowTerms => _allowTerms;

  bool get needPermission {
    for (final permission in permissions) {
      if (!permission.greated) {
        return true;
      }
    }

    return false;
  }

  late List<SystemPermission> _permissions;
  List<SystemPermission> get permissions => _permissions;

  late String? _moodleToken;
  String? get moodleToken => _moodleToken;

  WellcomeController() {
    reset();
  }

  void reset() {
    userNameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    _user = null;
    _allowTerms = false;
    _permissions = MainModule.permissions;
    _moodleToken = null;
  }

  void resetLogin() {
    userNameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    _user = null;
    _moodleToken = null;

    notifyListeners();
  }

  Future<SystemRequestResult> login() async {
    setStatus(Status.loading);

    try {
      SystemUser? user;

      (_, user) = await IfspassService.login(
        username: userNameCtrl.text,
        password: passwordCtrl.text,
      );

      _user = user;
      userNameCtrl.clear();
      passwordCtrl.clear();

      await checkPermissions();

      setStatus(Status.success);
      return SystemRequestResult(
        status: true,
      );
    } on SystemDioException catch (error) {
      if (error is FirstAccessDioExcepition) {
        _moodleToken = error.moodleToken;
        setStatus(Status.error);
        return SystemRequestResult(
          status: true,
          title: error.title,
          message: error.subTitle,
        );
      }

      setStatus(Status.error);
      return SystemRequestResult(
        status: false,
        title: 'Erro ao fazer login.',
        message: 'Matrícula ou senha incorreta.',
      );
    }
  }

  void setAllowTerms(value) {
    _allowTerms = value;
  }

  Future<void> checkPermissions() async {
    for (final permission in permissions) {
      await permission.check();
    }

    notifyListeners();
  }

  Future<SystemRequestResult> setPassword() async {
    try {
      Uri uri = Uri.parse(
        'https://sistemas.slt.ifsp.edu.br/ldap/trocasenha.php?page=moodle',
      );

      await launchUrl(uri);

      userNameCtrl.clear();
      passwordCtrl.clear();

      setStatus(Status.success);
      return SystemRequestResult(
        status: true,
      );
    } catch (error) {
      setStatus(Status.error);
      return SystemRequestResult(
        status: false,
        title: 'Erro ao abrir url.',
        message:
            'Tente novamente mais tarde ou use o portal Moodle para alterar a senha.',
      );
    }
  }
}
