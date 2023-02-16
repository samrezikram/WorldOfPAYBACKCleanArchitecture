//
//  WorldOfPAYBACKCleanApp.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 13/02/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    @Environment(\.scenePhase) var scenePhase

    init() {
        // App Lunch tasks
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                break
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }
}

