import 'package:flutter/foundation.dart';
import 'package:oxen_wallet/src/domain/common/balance.dart';

class OxenBalance extends Balance {
  OxenBalance({@required this.fullBalance, @required this.unlockedBalance});

  final String fullBalance;
  final String unlockedBalance;
}
