import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void updateData(String username, String password) {
    emit(LoginLoading());
    if (username.isEmpty || password.isEmpty) {
      emit(LoginError());
    } else {
      emit(LoginLoaded(username));
    }
  }
}
