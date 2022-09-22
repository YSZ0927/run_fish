//
//  run_fishApp.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/8.
//

import SwiftUI
import AMapFoundationKit

@available(iOS 15.0, *)
@main
struct run_fishApp: App {
    init() {
        AMapServices.shared()?.apiKey = "ecac08e69cde66f3f219995fb2d673bb"
        AMapServices.shared()?.enableHTTPS = true
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
