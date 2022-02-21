import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bussiness_screen/bussiness_screen.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:news_app/screens/sports_screen/sports_screen.dart';
import 'package:news_app/screens/state_management/states.dart';
import 'package:news_app/shared/cache_helper/shared_preferences.dart';
import 'package:news_app/shared/diohelper/dio_helper.dart';

class NewsCubit extends Cubit<States> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int selectedScreenIndex = 0;
  var screensList = [
    BusinessScreen(),
    SportsScreen(),
    SearchScreen(),
  ];

  void changeSelectedScreen(int newIndex) {
    if (this.selectedScreenIndex == 2) {
      searchArticlesList = [];
    }
    this.selectedScreenIndex = newIndex;
    emit(ScreenChangeState());
  }

  List<dynamic> businessArticlesList = [];

  void getBusinessData() {
    String key = (this.isArabic ? 'eg' : 'US');
    print(key);
    DioHelper.getData(
      'v2/top-headlines',
      {
        'country': key,
        'category': 'business',
        'apiKey': '623f7f737c5e491884ac9f7a7b8e7a3e',
      },
    ).then((value) {
      this.businessArticlesList = value.data['articles'];
      emit(GetBusinessDataState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<dynamic> sportsArticlesList = [];

  void getSportsData() {
    String key = (isArabic ? 'eg' : 'US');
    DioHelper.getData(
      'v2/top-headlines',
      {
        'country': key,
        'category': 'sport',
        'apiKey': '623f7f737c5e491884ac9f7a7b8e7a3e',
      },
    ).then((value) {
      this.sportsArticlesList = value.data['articles'];
      emit(GetSportsDataState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  bool isDark = true;

  void changeTheme({bool? x}) {
    if (x != null) {
      isDark = x;
    } else {
      isDark = !isDark;
      SharedPrefHelper.putData('darkMode', isDark).then((value) {});
    }
    emit(ChangeThemeState());
  }

  List<dynamic> searchArticlesList = [];

  void getSearchData(String q) {
    if (q != '') {
      String key = (isArabic ? 'ar' : 'en');
      DioHelper.getData(
        'v2/everything',
        {
          'q': '$q',
          'language': key,
          'apiKey': '623f7f737c5e491884ac9f7a7b8e7a3e',
        },
      ).then((value) {
        this.searchArticlesList = value.data['articles'];
        emit(GetSearchDataState());
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      searchArticlesList = [];
    }
  }

  bool isArabic = true;

  void changeLanguage({bool? x}) {
    if (x != null) {
      isArabic = x;
    } else {
      isArabic = !isArabic;
      SharedPrefHelper.putData('language', isArabic).then((value) {});
    }
    searchArticlesList = [];
    businessArticlesList = [];
    sportsArticlesList = [];
    getBusinessData();
    getSportsData();
    emit(ChangeLanguageState());
  }

  void clearSearch() {
    searchArticlesList = [];
    emit(ClearSearchState());
  }
}
