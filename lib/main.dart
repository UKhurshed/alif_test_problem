import 'package:alif_test/app_bloc_observer.dart';
import 'package:alif_test/core/navigation/app_routes.dart';
import 'package:alif_test/features/upcoming_guides/ui/cubit/upcoming_guides_cubit.dart';
import 'package:alif_test/features/upcoming_guides/ui/screens/upcoming_guides_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alif_test/core/injector_container/injector_container.dart'
    as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.initIC();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I.get<UpcomingGuidesCubit>()),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: AppRoutes.generateRoute,
        home: UpcomingGuidesScreen(),
      ),
    );
  }
}
