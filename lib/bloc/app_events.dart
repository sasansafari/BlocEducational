import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
//استفاده از این متاتگ
//قصد نداریم رویداد های کلاس را تغییر دهیم
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class LoadArticleEvent extends ArticleEvent {
  @override
  List<Object?> get props => [];
}
