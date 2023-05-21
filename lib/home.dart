 
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
        body:  BlocBuilder<ArticleBLoc,ArticleState>(builder: (context, state) {
          if (state is ArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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


          return Container();
        },)
    ));
  }
}