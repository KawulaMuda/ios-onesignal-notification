//
//  ios_onesignal_notificationApp.swift
//  ios onesignal notification
//
//  Created by Ihwan ID on 11/10/20.
//

import SwiftUI
import UIKit
import OneSignal

@main
struct ios_onesignal_notificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      //Remove this method to stop OneSignal Debugging
      OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)

      //START OneSignal initialization code
      let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false, kOSSettingsKeyInAppLaunchURL: false]

      // Replace 'YOUR_ONESIGNAL_APP_ID' with your OneSignal App ID.
      OneSignal.initWithLaunchOptions(launchOptions,
        appId: "81de4771-fe18-4718-9e27-19cc3039acc2",
        handleNotificationAction: nil,
        settings: onesignalInitSettings)

      OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;

      // promptForPushNotifications will show the native iOS notification permission prompt.
      // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
      OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
      })
      //END OneSignal initializataion code

       return true
    }
}

struct ios_onesignal_notificationApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
