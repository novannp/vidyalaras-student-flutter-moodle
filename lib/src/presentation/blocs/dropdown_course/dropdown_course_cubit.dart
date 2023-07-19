import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownCourseCubit extends Cubit<String> {
  DropdownCourseCubit() : super("all");

  void changeCategory(String category) => emit(category);
}
