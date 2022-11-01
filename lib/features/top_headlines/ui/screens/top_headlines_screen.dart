import 'dart:developer';
import 'dart:io';
import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/core/network/dio_exceptions.dart';
import 'package:alif_test/core/utils/extensions.dart';
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
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.appWidth * 20.w),
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
                  Text(
                      MapFailureToLocalizationResource.fromFailure(
                          context, state.failure),
                      style: const TextStyle(color: Colors.red)),
                  SizedBox(height: context.appHeight * 20.h)
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
