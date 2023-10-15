//
//  NavigationViewStyle.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/15/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
struct ClearNavigationViewStyle: NavigationViewStyle {
    func _body(configuration: NavigationViewStyleConfiguration) -> some View {
        configuration.content
            .onAppear {
                // Hide the navigation bar
                UINavigationBar.appearance().isHidden = true
            }
            .onDisappear {
                // Show the navigation bar when navigating back
                UINavigationBar.appearance().isHidden = false
            }
    }
}

