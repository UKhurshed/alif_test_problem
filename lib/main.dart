import 'package:alif_test/app_bloc_observer.dart';
import 'package:alif_test/features/top_headlines/ui/cubit/top_headlines_cubit.dart';
import 'package:alif_test/features/top_headlines/ui/screens/top_headlines_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopHeadlinesCubit>(
        create: (_) => TopHeadlinesCubit(),
        child: const MaterialApp(home: TopHeadlinesScreen()));
  }
}
