//
//  MedicationListView.swift
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



struct MedicationListView: View {
    let medications: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Medications:")
                .font(.headline)
                .padding(.bottom, 5)

            // Display the list of medications
            ForEach(medications, id: \.self) { medication in
                Text("- \(medication)")
            }
        }
        .padding(.bottom, 10)
    }
}

