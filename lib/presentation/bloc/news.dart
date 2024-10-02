import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/models/news.dart';
import 'package:news_app/data/repositories/news.dart';

// Definição dos eventos
abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {}

// Definição dos estados
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

// Bloc para gerenciar eventos e estados
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    // Registra o evento FetchNewsEvent e a função que processa o evento
    on<FetchNewsEvent>(_onFetchNews);
  }

  // Função que processa o FetchNewsEvent
  void _onFetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final List<NewsModel> news = await newsRepository.fetchNews();
      emit(NewsLoaded(news));
    } catch (error) {
      emit(NewsError('Error loading news: $error'));
    }
  }
}
