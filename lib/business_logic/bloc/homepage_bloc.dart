import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/data/models/homepage_model.dart';
import 'package:pull_refresh/data/repo/homepage_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HomePageRepo homePageRepo;

  late List<HomepageModel> data;

  HomepageBloc(this.homePageRepo) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) async {
      if (event is LoadData) {
        emit(HomepageLoading());
        await Future.delayed(const Duration(seconds: 2), () async {
          data = (await homePageRepo.fetchDetails()).cast<HomepageModel>();
          emit(HomepageLoaded(data));
        });
      } else if (event is NavBack) {
        emit(HomepageInitial());
      }
    });
  }
}
