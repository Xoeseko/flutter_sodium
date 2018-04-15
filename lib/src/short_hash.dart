import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import '../flutter_sodium.dart';

/// Computes short hashes using the SipHash-2-4 algorithm.
class ShortHash {
  /// Generates a random key for use with short hashing.
  static Future<Uint8List> generateKey() => Sodium.cryptoShorthashKeygen();

  /// Computes a fixed-size fingerprint for given value and key.
  static Future<Uint8List> hash(Uint8List value, Uint8List key) =>
      Sodium.cryptoShorthash(value, key);

  /// Computes a fixed-size fingerprint for given value string and key.
  static Future<Uint8List> hashString(String value, Uint8List key)
  {
      return Sodium.cryptoShorthash(utf8.encode(value), key);
  }
}
