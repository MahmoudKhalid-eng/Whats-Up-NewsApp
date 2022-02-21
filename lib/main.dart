import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/news_main/news_main_screen.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:news_app/shared/cache_helper/shared_preferences.dart';
import 'package:news_app/shared/diohelper/dio_helper.dart';
import 'package:news_app/shared/observer.dart';
import 'package:news_app/shared/themes/themes.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await SharedPrefHelper.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark = SharedPrefHelper.getData('darkMode');
  final bool? isArabic = SharedPrefHelper.getData('language');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeTheme(x: isDark)
        ..changeLanguage(x: isArabic)
        ..getBusinessData()
        ..getSportsData(),
      child: BlocConsumer<NewsCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              child: NewsMain(),
              textDirection:
                  cubit.isArabic ? TextDirection.rtl : TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
