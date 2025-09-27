import 'package:doctor_hunt/features/chat_view.dart';
import 'package:doctor_hunt/features/favorite_view.dart';
import 'package:doctor_hunt/features/home/presentation/controller/home_state.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/reservations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screen = [
    HomeView(),
    FavoriteView(),

    ReservationsView(),
    ChatView(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
