import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/state_management/cubit.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  late final String url;

  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return (BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                NewsCubit.get(context).isDark ? Colors.black : Colors.white,
            foregroundColor:
                NewsCubit.get(context).isDark ? Colors.white : Colors.black,
            title: Text(
                NewsCubit.get(context).isArabic ? 'إيه الأخبار' : "what's up"),
          ),
          body: WebView(
            initialUrl: url,
          ),
        );
      },
    ));
  }
}
