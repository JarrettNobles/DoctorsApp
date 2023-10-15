//
//  MedicalConditionListView.swift
//  DoctorsApp
//
//  Created by jarrett nobles on 10/14/23.
//
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth



struct MedicalConditionListView: View {
    let conditions: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Medical Conditions:")
                .font(.headline)
                .padding(.bottom, 5)

            // Display the list of medical conditions
            ForEach(conditions, id: \.self) { condition in
                Text("- \(condition)")
            }
        }
        .padding(.bottom, 10)
    }
}

