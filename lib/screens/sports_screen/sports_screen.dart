import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:news_app/shared/components/ArticleItem.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var article = cubit.sportsArticlesList;

        return ListView.separated(
          itemBuilder: (context, index) {
            return articleItem(article[index], context);
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 1,
                color: cubit.isDark ? Colors.grey : Colors.black,
              ),
            );
          },
          itemCount: cubit.sportsArticlesList.length,
          physics: BouncingScrollPhysics(),
        );
      },
    );
  }
}
