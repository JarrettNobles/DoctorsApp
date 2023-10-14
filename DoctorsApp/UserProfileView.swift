//
//  UserProfileView.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//
import SwiftUI

struct UserProfileView: View {
    // Access the UserState as an environment object
    @EnvironmentObject var userState: UserState

    var body: some View {
        VStack {
            // Display the user's name
            Text("Welcome, \(userState.username)!")
                .font(.title)
                .padding()

            // Display the list of medications
            MedicationListView(medications: userState.medications)

            // Display the list of medical conditions
            MedicalConditionListView(conditions: userState.medicalConditions)

            // Add more content for the user profile as needed
        }
        .padding()
        .navigationBarTitle("User Profile")
    }
}


