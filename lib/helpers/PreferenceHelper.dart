import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PrefUtils.dart';

class PreferenceHelper {
  SharedPreferences prefs;

  PreferenceHelper(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  void saveIsUserNew(bool isLoggedIn) {
    prefs.setBool(PrefUtils.IS_USERNEW, isLoggedIn);
  }

  bool getIsUserNew() {
    return prefs.getBool(PrefUtils.IS_USERNEW) ?? true;
  }

  void sevePinKey(final String pinkey) {
    prefs.setString(PrefUtils.KEY_PIN_IDENTIFIER, pinkey);
  }

  String GetPinKey() {
    return prefs.getString(PrefUtils.KEY_PIN_IDENTIFIER) ?? "";
  }

  void saveIsSpinSound(bool isSinSound) {
    prefs.setBool(PrefUtils.IS_SPINSOUND, isSinSound);
  }

  bool getIsSpinSound() {
    return prefs.getBool(PrefUtils.IS_SPINSOUND) ?? true;
  }

  void saveIsSwitchNotification(bool isNotification) {
    prefs.setBool(PrefUtils.IS_NOTIFICATION, isNotification);
  }

  bool getIsSwitchNotification() {
    return prefs.getBool(PrefUtils.IS_NOTIFICATION) ?? true;
  }



  void saveIsUserLoggedIn(bool isLoggedIn) {
    prefs.setBool(PrefUtils.IS_LOGGED_IN, isLoggedIn);
  }

  bool getIsUserLoggedIn() {
    return prefs.getBool(PrefUtils.IS_LOGGED_IN) ?? false;
  }

  void saveFirebaseToken(String token) {
    prefs.setString(PrefUtils.FB_TOKEN, token);
  }

  String getFirebaseToken() {
    return prefs.getString(PrefUtils.FB_TOKEN) ?? "";
  }

  void saveJackporttime(String time) {
    prefs.setString(PrefUtils.JACKPORT_TIME, time);
  }

  String getJackporttime() {
    return prefs.getString(PrefUtils.JACKPORT_TIME) ?? "";
  }

  void saveReceiveAddress(String token) {
    prefs.setString(PrefUtils.RECEIVE_ADDRESS, token);
  }

  String getReceiveAddress() {
    return prefs.getString(PrefUtils.RECEIVE_ADDRESS) ?? "";
  }



  void clearAll() {
    prefs.remove(PrefUtils.USER_DATA);
    prefs.remove(PrefUtils.IS_LOGGED_IN);
    prefs.remove(PrefUtils.USER_BALANCE);
    prefs.remove(PrefUtils.FB_TOKEN);
    prefs.remove(PrefUtils.IS_SPINSOUND);
    prefs.remove(PrefUtils.RECEIVE_ADDRESS);
    prefs.remove(PrefUtils.KEY_PIN_IDENTIFIER);
  }
}
