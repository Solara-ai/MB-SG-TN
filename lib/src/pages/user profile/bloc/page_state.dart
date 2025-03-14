import 'package:schedule_gen_and_time_management/domain/model/user.dart';

class PageState {
    final User ? user ;
    PageState ({this.user});
    PageState coppyWith ({User ?user}) {
      return PageState(user: user ?? this.user);
    }
    
}

