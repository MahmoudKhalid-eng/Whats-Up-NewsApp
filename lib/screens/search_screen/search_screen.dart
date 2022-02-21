import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:news_app/shared/components/ArticleItem.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  style: TextStyle(
                      color: cubit.isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.deepOrange,
                    ),
                    labelText: cubit.isArabic ? 'إبحث هنا' : 'Search Here',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                  onChanged: (value) {
                    if (value != '') {
                      cubit.getSearchData(value);
                    } else {
                      cubit.clearSearch();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: (cubit.searchArticlesList.length > 0
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return articleItem(
                              cubit.searchArticlesList[index], context);
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
                        itemCount: cubit.searchArticlesList.length,
                      )
                    : Container()),
              ),
            ],
          ),
        );
      },
    );
  }
}
