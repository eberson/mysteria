import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class GameViewModel extends ChangeNotifier {
  int _dicas = 2;

  int get dicasColetadas => _dicas;

  static ChangeNotifierProvider<GameViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => GameViewModel(),
      );
}
