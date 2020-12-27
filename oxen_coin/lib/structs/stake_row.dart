import 'dart:ffi';
import 'package:ffi/ffi.dart';

class StakeRow extends Struct {
  @Int64()
  int amount;
  Pointer<Utf8> serviceNodeKey;

  String getServiceNodeKey() => Utf8.fromUtf8(serviceNodeKey);
  int getAmount() => amount;
}
