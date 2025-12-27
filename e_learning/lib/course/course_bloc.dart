import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/apiRepository.dart';
import 'package:e_learning/data/response/course_respon/course_respon.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final Apirepository apirepository;
  CourseBloc(this.apirepository) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      emit(CourseInitial());

      try {
        final coursesResponse = await apirepository.getCourses();

        // simulasi sukses
        emit(CourseLoaded(courseResponse: coursesResponse));
      } catch (e) {
        emit(CourseFailed(message: 'Failed to load course'));
      }
    });
  }
}
