import 'package:flutter_bloc/flutter_bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelected(id) && isMax(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  bool isMax(String id) {
    int index = state.length;
    if (index > 1) {
      return false;
    } else {
      return true;
    }
  }
}
