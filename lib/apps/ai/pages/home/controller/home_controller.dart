import 'package:system_package/system.dart';

class AiHomeController extends BaseStatus{

  late int _count;
  int get count => _count;

  AiHomeController(){
    reset();
  }

  void reset(){
    _count = 0;
  }

  void addOne(){
    _count++;
    setStatus(Status.success);
  }
  
}
