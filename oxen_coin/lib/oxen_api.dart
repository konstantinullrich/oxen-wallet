import 'dart:ffi';
import 'dart:io';

final DynamicLibrary oxenApi = Platform.isAndroid
    ? DynamicLibrary.open('liboxen_coin.so')
    : DynamicLibrary.open('oxen_coin.framework/oxen_coin');