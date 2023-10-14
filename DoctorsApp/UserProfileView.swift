//
//  UserProfileView.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//

import SwiftUI
import Foundation


struct UserProfileView: View {
    @EnvironmentObject var userState: UserState

    var body: some View {
        VStack {
            Text("Welcome, \(userState.username)!")
                .font(.title)
                .padding()
            // Add more content for the user profile as needed
        }
    }
}


