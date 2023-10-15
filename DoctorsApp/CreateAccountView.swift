import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct CreateAccountView: View {
    // State variables to store new account information
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    // Flags to indicate if there are issues with the entered new username and password
    @State private var wrongNewUsername = false
    @State private var wrongNewPassword = false

    // Flag to control navigation to the content view
    @State private var navigateToContentView = false

    var body: some View {
        NavigationView {
            // ZStack for layered UI elements
            ZStack {
                // Background color filling the safe area
                Color.blue.ignoresSafeArea()

                // Two concentric circles for decorative effect
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                // VStack to arrange UI elements vertically
                VStack {
                    // Spacer to push content to the top
                    Spacer()

                    // Title of the screen
                    Text("Create an Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    // Text field for entering the new username
                    TextField("Username", text: $newUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongNewUsername ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Secure text field for entering the new password
                    SecureField("Password", text: $newPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongNewPassword ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Secure text field for confirming the new password
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    // Button to trigger the creation of the new account
                    Button("Create Account") {
                        // Add logic to create the new account
                        createAccount(username: newUsername, password: newPassword)
                        // Set the state to navigate to ContentView
                        navigateToContentView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    // Text to prompt users to log in if they already have an account
                    Text("Already have an account? Log in.")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Set the state to navigate to ContentView
                            navigateToContentView = true
                        }

                    // Spacer to push content to the bottom
                    Spacer()
                }
            }
            // Hide the navigation bar
            .navigationBarHidden(true)
            // Full-screen cover to navigate to ContentView
            .fullScreenCover(isPresented: $navigateToContentView) {
                ContentView()
            }
            // Remove any padding
            .padding(0)
        }
    }

    // Function to create a new account based on entered credentials
    func createAccount(username: String, password: String) {
        // Add logic to create the new account
        // You can use Firebase Authentication methods here
        // (e.g., Auth.auth().createUser(withEmail:password:completion:))
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
