import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:alif_test/features/top_headlines/ui/cubit/top_headlines_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';

class TopHeadlinesScreen extends StatelessWidget {
  const TopHeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DriftDbViewer(GetIt.I.get<NewsDatabase>()))),
              child: const Icon(Icons.book))
        ],
      ),
      body: SafeArea(child: BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesInitial) {
            context.read<TopHeadlinesCubit>().fetchHeadline(1);
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopHeadlineError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message,
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () =>
                        context.read<TopHeadlinesCubit>().reloadTopHeadlines(),
                    child: const Icon(Icons.refresh),
                  )
                ],
              ),
            );
          } else if (state is TopHeadlineSuccess) {
            return TopHeadlinesSuccessWidget(
                topHeadlineModel: state.topHeadlineModel);
          } else {
            return Container();
          }
        },
      )),
    );
  }
}

class TopHeadlinesSuccessWidget extends StatelessWidget {
  const TopHeadlinesSuccessWidget({Key? key, required this.topHeadlineModel})
      : super(key: key);

  final TopHeadlineModel topHeadlineModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        itemCount: topHeadlineModel.articles.length,
        itemBuilder: (context, index) {
          final item = topHeadlineModel.articles[index];
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
