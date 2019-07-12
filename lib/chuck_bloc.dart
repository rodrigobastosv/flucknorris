import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ChuckBloc extends BlocBase {

  ChuckBloc();

  final BehaviorSubject<String> _chuckSubject = BehaviorSubject<String>.seeded(null);

  Stream<String> get chuckObservable => _chuckSubject.stream;

  void pushJoke(String joke) {
    _chuckSubject.sink.add(joke);
  }

  @override
  void dispose() {
    _chuckSubject.close();
    super.dispose();
  }
}