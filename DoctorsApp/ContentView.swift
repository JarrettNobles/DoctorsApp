import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    // State object to manage user's authentication state
    @StateObject var userState = UserState()

    // Variables to store username and password input
    @State private var username = ""
    @State private var password = ""

    // Flags to indicate if there are issues with the entered username and password
    @State private var wrongUsername = false
    @State private var wrongPassword = false

    // Flag to control navigation to the user profile screen
    @State private var showingLoginScreen = false

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
                    // Title of the screen
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    // Text field for entering the username
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongUsername ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Secure text field for entering the password
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2)
                        )

                    // Button to trigger the authentication process
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    // Navigation link to the user profile screen
                    NavigationLink(
                        destination: UserProfileView().environmentObject(userState),
                        isActive: $showingLoginScreen,
                        label: { EmptyView() }
                    )

                    // Navigation link to the account creation screen
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Create an Account")
                            .foregroundColor(.blue)
                            .padding()
                    }
                    .padding(.top, 20) // Add padding to separate the links
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }

    // Function to authenticate the user based on entered credentials
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "test" {
            wrongUsername = false
            if password.lowercased() == "test" {
                wrongPassword = false
                userState.isLoggedIn = true
                userState.username = username
                showingLoginScreen = true
            } else {
                wrongPassword = true
            }
        } else {
            wrongUsername = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
