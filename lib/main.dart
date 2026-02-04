import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_task/core/config/injection.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/core/routes/routes_generator.dart';
import 'package:tamkeen_task/core/service/bloc_observer.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const FlutterTask());
}

class FlutterTask extends StatelessWidget {
  const FlutterTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: AppRoutes.welcomeScreen,
      
    );
  }
}
