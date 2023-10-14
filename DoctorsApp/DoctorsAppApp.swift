//
//  DoctorsAppApp.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//
import SwiftUI

@main
struct DoctorsAppApp: App {
    @StateObject var userState = UserState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userState)
        }
    }
}

