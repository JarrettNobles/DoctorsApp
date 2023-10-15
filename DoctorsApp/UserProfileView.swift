import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


struct UserProfileView: View {
    // Access the UserState as an environment object
    @EnvironmentObject var userState: UserState

    var body: some View {
        ZStack(alignment: .top) {
            // Blue box that fills the top quarter of the screen
            Color.blue
                .frame(height: UIScreen.main.bounds.height / 4)
                .ignoresSafeArea()

            VStack(alignment: .center, spacing: 0) {
                // Display the profile picture (replace "placeholder" with the actual image)
                //change to work from database
                Image("ProfilePictures/jarrett.jpg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80) // Adjust the size of the profile picture
                    .clipShape(Circle())
                    .padding()
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)
                    .offset(y: 60) // Move the profile picture downward

                // Display the welcome message with the user's name
                Text(userState.username)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top, 80) // Add space between the profile picture and the name

                Spacer() // Spacer to push content below the user name to the bottom

                // Use VStack with alignment .center to center the remaining content
                VStack(alignment: .center) {
                    // Display the list of medications
                    MedicationListView(medications: userState.medications)

                    // Display the list of medical conditions
                    MedicalConditionListView(conditions: userState.medicalConditions)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center) // Center content horizontally

                Spacer() // Spacer to push content above medications and conditions to the bottom
            }
            .navigationBarTitle("User Profile", displayMode: .inline)
        }
    }
}
