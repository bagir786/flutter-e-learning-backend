part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

final class CourseLoaded extends CourseState {
  final CourseRespon courseResponse;

  CourseLoaded({required this.courseResponse});
}

final class CourseFailed extends CourseState {
  final String message;

  CourseFailed({required this.message});
}
