import 'package:flutter/foundation.dart';
import 'package:loki_wallet/src/domain/common/balance.dart';

class LokiBalance extends Balance {
  LokiBalance({@required this.fullBalance, @required this.unlockedBalance});

  final String fullBalance;
  final String unlockedBalance;
}
