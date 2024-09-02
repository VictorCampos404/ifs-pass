import 'package:flutter/material.dart';
import 'package:ifs_pass/services/ifspass_serivce.dart';
import 'package:system_package/system.dart';

class WellcomeController extends BaseStatus {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool get isValidLogin =>
      userNameCtrl.text.length == 7 && passwordCtrl.text.isNotEmpty;

  WellcomeController() {
    reset();
  }

  void reset() {
    userNameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  void resetLogin() {
    userNameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();

    notifyListeners();
  }

  Future<SystemRequestResult> login() async {
    setStatus(Status.loading);

    try {
      final response = await IfspassService.login(
        username: userNameCtrl.text,
        password: passwordCtrl.text,
      );

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
        title: 'Erro ao fazer login.',
        message: 'Matrícula ou senha incorreta.',
      );
    }
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
