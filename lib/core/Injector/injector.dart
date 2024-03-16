import 'package:clean_arch_application/core/Injector/auth_injector.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final instance = GetIt.instance;
  static Future<void> init() async {
    await AuthInjector.init();
  }
}
