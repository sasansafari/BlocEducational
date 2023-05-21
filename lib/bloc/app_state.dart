import 'package:equatable/equatable.dart';
import 'package:BlocAPi/model/article.dart';

abstract class ArticleState extends Equatable {}

//loading state

class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//data loaded state

class ArticleLoadedState extends ArticleState {
  ArticleLoadedState(this.articles);
  final List<Article> articles;

  @override
  // TODO: implement props
  List<Object?> get props => [articles];
}

//data error loading state

class ArticleErrorState extends ArticleState {
  ArticleErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
