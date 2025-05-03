//
//  Swiftgram_TestApp.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 01.05.2025.
//

import SwiftUI
import UIKit
//
//private let sampleBadges: [Badge] = [
//    .init(displayName: "Swiftgram", assetName: "swiftgram"),
//    .init(displayName: "Telegram", assetName: "telegram"),
//    .init(displayName: "Code Red",   assetName: "code_red"),
//    .init(displayName: "Silver",   assetName: "silver"),
//    .init(displayName: "Russian",   assetName: "russian"),
//]



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?  // ← add this

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // 1. Create the SwiftUI view you want to show.
        let contentView = NavigationView {
            NavigationLink {
                NewSettingsView()
            } label: {
                Text("Swiftgram")
            }
        }

        // 2. Wrap it in a UIHostingController.
        let hostingController = UIHostingController(rootView: contentView)

        // 3. Create the window and assign the hosting controller.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()

        return true
    }
}
