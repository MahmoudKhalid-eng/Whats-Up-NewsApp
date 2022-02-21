import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/web_view/web_view.dart';

Widget articleItem(article, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(article['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  article['urlToImage'] == null
                      ? 'https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png'
                      : '${article['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          color: NewsCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: NewsCubit.get(context).isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
