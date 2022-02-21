import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';

class NewsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.isArabic ? 'إيه الأخبار' : "What's up",
              style: TextStyle(
                color: cubit.isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeLanguage();
                },
                icon: Icon(Icons.language),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_center_sharp),
                  label: cubit.isArabic ? 'أعمال' : 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: cubit.isArabic ? 'رياضة' : 'Sport'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: cubit.isArabic ? 'بحث' : 'Search'),
            ],
            onTap: (index) {
              cubit.changeSelectedScreen(index);
            },
            currentIndex: cubit.selectedScreenIndex,
          ),
          body: cubit.businessArticlesList.length == 0
              ? Center(child: CircularProgressIndicator())
              : cubit.screensList[cubit.selectedScreenIndex],
        );
      },
    );
  }
}
