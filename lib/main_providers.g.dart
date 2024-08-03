import 'package:ifs_pass/apps/new_app/module.dart';
import 'package:system_package/system.dart';

class MainProviders{
  static List<SingleChildWidget> getProviders() {
    List<SingleChildWidget> providers = [];

    final newApp = NewAppModule();
    
    //Listar todos os apps
    providers.addAll(newApp.providers);

    return providers;
  }
}