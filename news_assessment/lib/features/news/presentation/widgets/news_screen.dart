import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/di/di.dart';
import '../../data/entities/remote_news_response.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import 'news_card.dart';

class NewsCategory extends StatefulWidget {
  const NewsCategory({required this.category, super.key});
  final String category;
  @override
  State<NewsCategory> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsCategory> {
  late NewsBloc _homeBloc;
  final int _pageSize = 20;
  final PagingController<int, Article?> _paginationController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _homeBloc = getIt<NewsBloc>();
    _paginationController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    _homeBloc.add(NewsEvent.getNewsEvent(
        category: widget.category, limit: _pageSize, pageNo: pageKey));
  }

  @override
  void dispose() {
    _paginationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(color: Colors.purple),
        ),
      ),
      body: BlocListener<NewsBloc, NewsState>(
          bloc: _homeBloc,
          listener: (context, state) async {
            if (state is NewsLoadedState) {
              try {
                final newItems = state.userModel.articles;
                final isLastPage = newItems.length < _pageSize;
                if (isLastPage) {
                  _paginationController.appendLastPage(newItems);
                } else {
                  _paginationController.appendPage(
                      newItems, _paginationController.nextPageKey! + 1);
                }
              } catch (error) {
                _paginationController.error = error;
              }
            }
          },
          child: PagedListView<int, Article?>(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            pagingController: _paginationController,
            builderDelegate: PagedChildBuilderDelegate<Article?>(
                itemBuilder: (BuildContext context, Article? item, int index) {
              return NewsCard(
                index: index,
                article: item!,
                isFavourite: false,
              );
            }),
          )),
    );
  }
}
