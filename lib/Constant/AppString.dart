import 'package:firebase_admob/firebase_admob.dart';

class AppString{
  static const String selectLanguage = 'Select your Languages';
  static const String testDevice = 'YOUR_DEVICE_ID';
  static const String FbplacementId = 'YOUR_PLACEMENT_ID';
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );
}