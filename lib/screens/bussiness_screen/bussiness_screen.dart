import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:news_app/shared/components/ArticleItem.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    var list = cubit.businessArticlesList;
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return articleItem(list[index], context);
          },
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 1,
              color: cubit.isDark ? Colors.grey : Colors.black,
            ),
          ),
          itemCount: (cubit.businessArticlesList.length),
          physics: BouncingScrollPhysics(),
        );
      },
    );
  }
}
