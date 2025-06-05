import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEvent {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static AnalyticsEvent? singleInstance;
  static AnalyticsEvent getSingleton() {
    singleInstance ??= AnalyticsEvent();
    return singleInstance ?? AnalyticsEvent();
  }

  AnalyticsEvent() {
    analytics.setAnalyticsCollectionEnabled(true);
    setIsAppOpen();
  }

  Future<void> setIsAppOpen() async {
    await analytics.logAppOpen();
  }

  Future<void> setUserLogin() async {
    // user = await connection.getUser();
    await analytics.logLogin();
    // await analytics.setUserId(id: connection.user?.id.toString());
    // await facebookAppEvents.setUserID(user.id);
    // await setUserProperty(user);
    return;
  }

  Future<void> setUserSignUp() async {
    await sendAnalyticsEvent(
      'signup',
    );

    return;
  }

  Future<void> setNewReminder() async {
    await sendAnalyticsEvent('reminder');

    return;
  }

  Future<void> setCallReminder() async {
    await sendAnalyticsEvent('reminder');

    return;
  }

  Future<void> setUserName(String name) async {
    await sendAnalyticsEvent('setUserName', params: {'name': name});

    return;
  }

  Future<void> sendAnalyticsEvent(String eventName,
      {Map<String, dynamic>? params}) async {
    await analytics.logEvent(
      name: eventName,
      parameters: params == null ? null : Map<String, Object>.from(params),
    );
    return;
  }

  // Future<void> setUserId() async {
  //   await analytics.setUserId(id: connection.user?.id.toString());
  // }

  Future<void> setCurrentScreen(
      {String screenName = '', String screenClassOverride = ''}) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenClassOverride,
    );
  }

  Future<void> setAnalyticsCollectionEnabled({bool enabled = false}) async {
    await analytics.setAnalyticsCollectionEnabled(enabled);
  }

  Future<void> setUserProperty(user) async {
    await analytics.setUserProperty(name: 'fullName', value: user['fullName']);
    return;
  }

  Future logTutorialBegin() async {
    await analytics.logTutorialBegin();
  }

  Future logTutorialEnd() async {
    await analytics.logTutorialComplete();
  }

  Future<void> setUserLogOut() async {
    await analytics.setUserId(id: null);
  }
}
