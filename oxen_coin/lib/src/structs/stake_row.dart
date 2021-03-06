import 'dart:ffi';
import 'package:ffi/ffi.dart';

class StakeRow extends Struct {
  Pointer<Utf8> _serviceNodeKey;

  @Uint64()
  int _amount;

  String get serviceNodeKey => Utf8.fromUtf8(_serviceNodeKey);
  int get amount => _amount;
}
