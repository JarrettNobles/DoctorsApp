//
//  UserState.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class uuserState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    @Published var medications: [String] = [] // Add user's medications
    @Published var medicalConditions: [String] = [] // Add user's medical conditions
}

