//
//  run_fishApp.swift
//  run_fish WatchKit Extension
//
//  Created by chaufan Yu on 2022/9/8.
//

import SwiftUI

@main
struct run_fishApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
