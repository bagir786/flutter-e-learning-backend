import 'package:bloc/bloc.dart';
import 'package:e_learning/data/login_response/login_response.dart';
import 'package:e_learning/data/repository/ApiRepository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Apirepository apirepository;
  LoginBloc(this.apirepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      //add event handdler for loginbutoonpressed

      if (event is LoginButtonPressed) {
        //add state for loginprogres
        emit(LoginInProgres());

        try {
          final response = await apirepository.authenticate(
            event.identifier,
            event.password,
          );

          await apirepository.saveTokenToPrefs(response.jwt.toString());

          emit(LoginScucces(response));
        } catch (e) {
          emit(LoginFailed(e.toString()));
        }
      }
    });
  }
}
