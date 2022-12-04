import 'package:rxdart/rxdart.dart';

abstract class HomePageBloc {
  void onHomeSelected();

  void onHistorySelected();

  void onInfoSelected();

  ValueStream<HomeState> get state;
}

class HomePageBlocImpl implements HomePageBloc {
  HomePageBlocImpl();

  final _state = BehaviorSubject<HomeState>.seeded(HomeState.home());

  @override
  ValueStream<HomeState> get state => _state.stream;

  @override
  void onHomeSelected() {
    _state.add(HomeState.home());
  }

  @override
  void onHistorySelected() {
    _state.add(HomeState.history());
  }

  @override
  void onInfoSelected() {
    _state.add(HomeState.info());
  }
}

class HomeState {
  HomeState(this.tab);

  HomeTab tab;

  HomeState.home() : tab = HomeTab.home;

  HomeState.history() : tab = HomeTab.history;

  HomeState.info() : tab = HomeTab.info;
}

enum HomeTab {
  home,
  history,
  info,
}
