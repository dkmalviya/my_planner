import 'dart:convert';

import 'package:encrypt/encrypt.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';

class HouseDB {
  String encryptKey =
      'D6994463BFA25B8B679E016EE6C8308C9E52694DE9B4E803B461142876C4611C'; //AppKode
  String iv =
      '6977F4C247C4BD69C5549A706410C9EF8E56CD7DDABE89893EAAEEFF30516A11'; //anshuSoft

  readLoginStatus(String key) async {
    final prefs = await SharedPreferences.getInstance();

    bool? str = prefs.getBool(key);

    str ??= false;
    return str;
  }

  saveLoginStatus(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  saveEncryptedUserData(String key, value) async {
    try {
      String str = json.encode(value);
      final prefs = await SharedPreferences.getInstance();
      String encryptedValue = encryptUserData(encryptKey, iv, str);
      await prefs.setString(key, encryptedValue);
    } on Exception catch (e) {
      print("unable to save");
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  readEncryptedUserData(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? encryptedValue = prefs.getString(key);
      String decryptedValue =
          decryptUserData(encryptKey, iv, encryptedValue ?? "");

      return json.decode(decryptedValue);
    } on Exception catch (e) {
      // TODO
      print("Unable to read");
      return null;
    }

    //  return json.decode(value);
  }

  static String encryptUserData(
      String dataKey, String dataIv, String plainText) {
    try {
      final iv = prefix0.IV.fromUtf8(dataIv.substring(0, 16)); // Final IV
      var key = dataKey.toString().substring(0, 32);
      final encryptionKey = prefix0.Key.fromUtf8(key); // Final Encryption Key
      final encrypter = prefix0.Encrypter(
          prefix0.AES(encryptionKey, mode: prefix0.AESMode.cbc));
      final encrypted = encrypter.encrypt(plainText, iv: iv); // plainText
      return encrypted.base64;
    } catch (e) {
      return '';
    }
  }

  static String decryptUserData(
      String dataKey, String dataIv, String encryptText) {
    try {
      final iv = prefix0.IV.fromUtf8(dataIv.substring(0, 16)); // Final IV
      var key = dataKey.toString().substring(0, 32);
      final encryptionKey = prefix0.Key.fromUtf8(key); // Final Encryption Key
      final encrypter = prefix0.Encrypter(
          prefix0.AES(encryptionKey, mode: prefix0.AESMode.cbc));
      final decrypted = encrypter.decrypt(prefix0.Key.fromBase64(encryptText),
          iv: iv); // encryptText
      return decrypted;
    } catch (e) {
      return '';
    }
  }
}
