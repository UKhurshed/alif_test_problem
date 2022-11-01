part of 'upcoming_guides_cubit.dart';

@immutable
abstract class UpcomingGuidesState {}

class UpcomingGuidesInitial extends UpcomingGuidesState {}

class UpcomingGuidesSuccess extends UpcomingGuidesState {
  final List<UpcomingGuides> upcomingGuides;

  UpcomingGuidesSuccess({required this.upcomingGuides});
}

class UpcomingGuidesError extends UpcomingGuidesState {
  final Failure failure;

  UpcomingGuidesError({required this.failure});
}
