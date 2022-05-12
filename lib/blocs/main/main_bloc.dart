import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(InitialMainState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
