import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BlocAPi/bloc/app_events.dart';
import 'package:BlocAPi/bloc/app_state.dart';
import 'package:BlocAPi/repository/repositorys.dart';

class ArticleBLoc extends Bloc<ArticleEvent,ArticleState>{
  //این کلاس بلاک دو کلاس استیت . ایونت  رو دریفات میکنه
  
  late final Repository _repository;

 ArticleBLoc(this._repository):super(ArticleLoadingState()){


  //روی ایونت لود آرتیکل
  on<LoadArticleEvent>(((event, emit) async {

    //خالت لودینگ آرتیکل را منتشر میکنیم با ایمیت
    emit(ArticleLoadingState());

    try{
      final articles = await _repository.getArticles();
      emit(ArticleLoadedState(articles));

    }catch(e){
            emit(ArticleErrorState(e.toString()));

    }
  }));

 }

}