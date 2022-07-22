import 'package:flutter_bloc/flutter_bloc.dart';

class TagRecommendedCubit extends Cubit<int> {
  TagRecommendedCubit() : super(0);

  void setTag(int newTag) {
    emit(newTag);
  }
}
