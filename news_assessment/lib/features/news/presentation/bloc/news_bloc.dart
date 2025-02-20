import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/entities/remote_news_response.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/usecases/get_news_uc.dart';
import 'news_event.dart';
import 'news_state.dart';

@Injectable()
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;
  NewsBloc({required this.getNewsUseCase}) : super(const NewsState.initial()) {
    on<GetNewsEvent>(_getNews);
  }

  void _getNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    try {
      Either<Failure, RemoteNewsResponse> response =
          await getNewsUseCase.getNews(
              category: event.category,
              pageNo: event.pageNo,
              limit: event.limit);
      response.fold((error) => emit(NewsState.failed(message: error.message)),
          (result) => emit(NewsState.loaded(userModel: result)));
    } catch (error) {
      emit(NewsState.failed(message: error.toString()));
    }
  }
}
