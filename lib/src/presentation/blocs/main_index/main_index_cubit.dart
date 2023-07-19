import 'package:flutter_bloc/flutter_bloc.dart';

class MainIndexCubit extends Cubit<int> {
  MainIndexCubit() : super(0);

  void changeIndex(int index) => emit(index);
}
