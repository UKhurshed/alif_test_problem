import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/features/upcoming_guides/domain/entities/upcoming_guides.dart';
import 'package:alif_test/features/upcoming_guides/domain/usecase/get_latest_upcoming_guides.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'upcoming_guides_state.dart';

class UpcomingGuidesCubit extends Cubit<UpcomingGuidesState> {
  UpcomingGuidesCubit({required this.getLatestUpcomingGuides})
      : super(UpcomingGuidesInitial());

  final GetLatestUpcomingGuides getLatestUpcomingGuides;

  Future<void> getGuides() async {
    final result = await getLatestUpcomingGuides.call("");
    result.fold((error) => emit(UpcomingGuidesError(failure: error)),
        (success) => emit(UpcomingGuidesSuccess(upcomingGuides: success)));
  }
}
