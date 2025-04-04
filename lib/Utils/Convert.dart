import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class Convert {
  static String hash(Uint8List bytes) {
    return sha256.convert(bytes).toString();
  }
}