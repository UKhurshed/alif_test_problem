import 'dart:io';
import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/ui/bloc/top_headline/top_headlines_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:alif_test/features/top_headlines/ui/widgets/widgets.dart';

class TopHeadlinesScreen extends StatelessWidget {
  const TopHeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () async {}, child: const Icon(Icons.read_more)),
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
            return ListOfTopHeadlines(articles: state.articles);
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
