 
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BlocAPi/bloc/app_events.dart';
import 'package:BlocAPi/bloc/app_state.dart';
import 'package:BlocAPi/bloc/blocs.dart';
import 'package:BlocAPi/model/article.dart';
import 'package:BlocAPi/repository/repositorys.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArticleBLoc(
        RepositoryProvider.of<Repository>(context)
        )..add(LoadArticleEvent()),
      child: Scaffold(

        body:  BlocBuilder<ArticleBLoc,ArticleState>(
          builder: (context, state) {

          if (state is ArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //- اگر وضعیت `ArticleLoadingState` باشد، یعنی بلوک در حال بارگذاری مقالات است، یک نمایشگر `CircularProgressIndicator` که یک نشانگر پیشرفت است نمایش داده می‌شود. این نشانگر معمولاً برای نشان دادن اینکه عملیات بارگذاری در حال انجام است استفاده می‌شود.
          if (state is ArticleLoadedState) {
            List<Article> articlesList= state.articles;

            return ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Card(child: Text(articlesList[index].title),),
                );
              },
            );

          }

          //- اگر وضعیت `ArticleLoadedState` باشد، یعنی مقالات با موفقیت بارگذاری شده‌اند، لیستی از مقالات در یک `ListView` نمایش داده می‌شود. از `ListView.builder` استفاده می‌شود تا بتوان به طور پویا و به اندازه‌ی لازم عناصر را در لیست نمایش داد.
          if (state is ArticleErrorState) {
            String  error= state.error;

            return Center(
              child: Text(error),
            );
            
          }

          //- در غیر این صورت، یعنی وضعیت دیگری به جز `ArticleLoadingState` و `ArticleLoadedState` است، یک `Container` خالی نمایش داده می‌شود.
          return Text("no data");
        },)
    ));
  }
}