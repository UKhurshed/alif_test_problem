import 'package:alif_test/features/top_headlines/domain/entities/top_headlines.dart';
import 'package:alif_test/features/top_headlines/ui/bloc/top_headline/top_headlines_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class ListOfTopHeadlines extends StatefulWidget {
  const ListOfTopHeadlines({Key? key, required this.articles})
      : super(key: key);

  final List<TopHeadlines> articles;

  @override
  State<ListOfTopHeadlines> createState() =>
      _ListOfTopHeadlinesState();
}

class _ListOfTopHeadlinesState extends State<ListOfTopHeadlines> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(pagination);
    super.initState();
  }

  void pagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      BlocProvider.of<TopHeadlinesBloc>(context).add(GetTopHeadlines());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        controller: _scrollController,
        itemCount: widget.articles.length + 1,
        itemBuilder: (context, index) {
          if (index >= widget.articles.length) {
            return const BottomLoader();
          }
          final item = widget.articles[index];
          return Container(
            height: 120,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: Row(
              children: [
                TopHeadlineImage(imageUrl: item.urlToImage),
                const SizedBox(width: 20),
                TitleAndDescription(
                    title: item.title, description: item.description)
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
