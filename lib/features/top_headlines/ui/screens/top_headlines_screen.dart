import 'dart:developer';
import 'dart:io';

import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/data/local/top_headlines_local.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:alif_test/features/top_headlines/ui/bloc/top_headline/top_headlines_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopHeadlinesScreen extends StatelessWidget {
  const TopHeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TopHeadlinesLocalSource topHeadlinesLocalSource =
        TopHeadlinesLocalSource();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () async {
                  await topHeadlinesLocalSource.getLatestNews();
                },
                child: const Icon(Icons.read_more)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DriftDbViewer(GetIt.I.get<NewsDatabase>()))),
                child: const Icon(Icons.book)),
          )
        ],
      ),
      body: SafeArea(child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesInitial) {
            context.read<TopHeadlinesBloc>().add(GetTopHeadlines());
            return Center(
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator()
                  : const CircularProgressIndicator(),
            );
          } else if (state is TopHeadlinesError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage,
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 20),
                  // InkWell(
                  //   onTap: () =>
                  //       context.read<TopHeadlinesCubit>().reloadTopHeadlines(),
                  //   child: const Icon(Icons.refresh),
                  // )
                ],
              ),
            );
          } else if (state is TopHeadlinesSuccess) {
            return TopHeadlinesSuccessWidget(articles: state.articles);
          } else {
            return Container();
          }
        },
      )),
    );
  }
}

class TopHeadlinesSuccessWidget extends StatefulWidget {
  const TopHeadlinesSuccessWidget({Key? key, required this.articles})
      : super(key: key);

  final List<Article> articles;

  @override
  State<TopHeadlinesSuccessWidget> createState() =>
      _TopHeadlinesSuccessWidgetState();
}

class _TopHeadlinesSuccessWidgetState extends State<TopHeadlinesSuccessWidget> {
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

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator()
                  : const CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class TopHeadlineImage extends StatelessWidget {
  const TopHeadlineImage({Key? key, required this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        width: 90,
        height: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? "",
            fit: BoxFit.fitHeight,
            errorWidget: (context, error, stack) {
              return SizedBox(
                width: 90,
                height: 90,
                child: Image.asset('assets/images/default_img.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 10, bottom: 10),
        child: Column(
          children: [
            Text(title ?? "",
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
                child: Text(
              description ?? "",
              maxLines: 4,
            ))
          ],
        ),
      ),
    );
  }
}
