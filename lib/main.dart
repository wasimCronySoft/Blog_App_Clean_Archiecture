import 'package:clean_arch_application/core/constants/api_key.dart';
import 'package:clean_arch_application/core/routes/routes.dart';
import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/core/theme/app_theme.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: ApiKey.urlKey, anonKey: ApiKey.apiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      onGenerateRoute: RoutesGenerator.generateRoutes,
      initialRoute: Routes.login,
      home: const LoginView(),
    );
  }
}
