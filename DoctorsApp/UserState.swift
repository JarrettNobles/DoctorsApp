//
//  UserState.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//

import Foundation
import SwiftUI

class UserState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
}

