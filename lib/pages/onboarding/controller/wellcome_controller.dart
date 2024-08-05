import 'package:system_package/system.dart';

class WellcomeController extends BaseStatus{

  late int _count;
  int get count => _count;

  WellcomeController(){
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