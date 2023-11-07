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

    // Flag to control the navigation
    @State private var isNavigatingToLogin = false

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
                        // Set the state to navigate to login
                        isNavigatingToLogin = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    // Text to prompt users to log in if they already have an account
                    Text("Already have an account? Log in.")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Set the state to navigate to login
                            isNavigatingToLogin = true
                        }

                    // Spacer to push content to the bottom
                    Spacer()
                }
            }
            // Navigation link to navigate to ContentView
            //getting a warning that was deprecated
            .background(
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isNavigatingToLogin,
                    label: { EmptyView() }
                )
            )
            // Remove any padding
            .padding(0)
        }
        .navigationBarHidden(true)
    }

    // Function to create a new account based on entered credentials
    //may possibly need to add the authentication line i added in the content view
    func createAccount(username: String, password: String) {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error
                    print("Create account error: \(error.localizedDescription)")
                    wrongNewUsername = true
                    wrongNewPassword = true
                } else {
                    // Account creation successful
                    print("Account created successfully")
                    wrongNewUsername = false
                    wrongNewPassword = false
                }
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
