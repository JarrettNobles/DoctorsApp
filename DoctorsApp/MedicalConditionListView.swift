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

// This struct defines a SwiftUI view for displaying a list of medical conditions.
struct MedicalConditionListView: View {
    // An array of medical conditions that will be displayed in the view.
    let conditions: [String]

    var body: some View {
        // Create a vertical stack to arrange the view's content from top to bottom.
        VStack(alignment: .leading) {
            // Display a headline text for the section.
            Text("Medical Conditions:")
                .font(.headline) // Set the text style to headline.
                .padding(.bottom, 5) // Add a small space below the headline.

            // Use a ForEach loop to iterate through the list of medical conditions.
            ForEach(conditions, id: \.self) { condition in
                // Display each medical condition with a bullet point.
                Text("- \(condition)")
            }
        }
        .padding(.bottom, 10) // Add some space at the bottom of the stack.
    }
}

