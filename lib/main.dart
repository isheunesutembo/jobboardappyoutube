import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/auth/screens/register_screen.dart';
import 'package:jobboardapp/features/auth/screens/sign_in_screen.dart';
import 'package:jobboardapp/features/main/screen/main_screen.dart';
import 'package:jobboardapp/features/vacancies/screen/all_vacancies_screen.dart';
import 'package:jobboardapp/features/vacancies/screen/vacancy_by_category_screen.dart';
import 'package:jobboardapp/util/color.dart';
import 'package:jobboardapp/util/route.dart';

Widget _defaultHome=const SignInScreen();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final container =ProviderContainer();
  await container.read(localAuthRepositoryProvider).init();
  final result=container.read(localAuthRepositoryProvider).getUserToken();
  if(result!=null){
    _defaultHome=const MainScreen();
  }

  runApp( UncontrolledProviderScope(container: container,child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.light(surface: AppColors.backgroundColor),
      ),
      routes: {
        "/":(context)=>_defaultHome,
        Routes.mainscreen:(context)=>MainScreen(),
        Routes.signinscreen:(context)=>SignInScreen(),
        Routes.registercreen:(context)=>RegisterScreen(),
        Routes.allvacanciesscreen:(context)=>AllVacanciesScreen(),
        Routes.vacanciesbycategoryscreen:(context)=>VacancyByCategoryScreen()
      },
    );
  }
}
