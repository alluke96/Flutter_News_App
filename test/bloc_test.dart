import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/models/news.dart';
import 'package:news_app/data/repositories/news.dart';
import 'package:news_app/presentation/bloc/news.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsBloc newsBloc;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    newsBloc = NewsBloc(mockNewsRepository);
  });

  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsLoaded] quando FetchNewsEvent é chamado com sucesso',
    build: () {
      when(mockNewsRepository.fetchNews()).thenAnswer(
          (_) async => [NewsModel(title: 'title', description: 'description', url: 'url', imageUrl: 'imageUrl')]);
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchNewsEvent()),
    expect: () => [NewsLoading(), isA<NewsLoaded>()],
  );

  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsError] quando FetchNewsEvent falha',
    build: () {
      when(mockNewsRepository.fetchNews()).thenThrow(Exception('Erro'));
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchNewsEvent()),
    expect: () => [NewsLoading(), isA<NewsError>()],
  );
}
