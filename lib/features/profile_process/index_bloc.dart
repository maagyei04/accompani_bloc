import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileProcessEvent { nextPageWithData, nextPage }

class ProfileProcessBloc extends Bloc<ProfileProcessEvent, int> {
  ProfileProcessBloc() : super(0);

  Stream<int> mapEventToState(ProfileProcessEvent event) async* {
    switch (event) {
      case ProfileProcessEvent.nextPageWithData:
        yield state + 1;
        break;
      case ProfileProcessEvent.nextPage:
        yield state + 1;
        break;
    }
  }
}
