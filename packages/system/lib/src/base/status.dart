
import 'package:flutter/material.dart';
import 'package:system_package/src/enum/status.dart';

abstract class BaseStatus with ChangeNotifier{
  Status _status = Status.pristine;

  void setStatus(Status status){
    _status = status;
    notifyListeners();
  }

  bool get isPristine => _status == Status.pristine;
  bool get isloading => _status == Status.loading;
  bool get hasError => _status == Status.error;
  bool get hasSuccess => _status == Status.success;
  Status get nowStatus => _status;

}