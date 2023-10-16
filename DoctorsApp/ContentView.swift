import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

// ObservableObject to represent the state of the user in the app
class UserState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var email = ""
    // ... other properties
}

// ContentView is the main view of your app
struct ContentView: View {
    // ObservableObject to hold the state of the user
    @StateObject var userState = UserState()
    
    // State variables to capture user input for email and password
    @State private var email = ""
    @State private var password = ""
    
    // State variables to track if there are errors in email and password
    @State private var wrongEmail = false
    @State private var wrongPassword = false
    
    // State variable to control the navigation to the UserProfileView
    @State private var showingLoginScreen = false
    
    // State variable to present the CreateAccountView as a sheet
    @State private var isCreateAccountPresented = false
    
    // Body of the ContentView
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.blue.ignoresSafeArea()
                
                // Two concentric circles for decorative effect
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                
                // VStack to arrange UI elements vertically
                VStack {
                    // Title of the screen
                    Text("Login").font(.largeTitle).bold().padding()
                    
                    // Text field for entering email
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongEmail ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
                    // Secure text field for entering password
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
                    // Button to trigger user authentication
                    Button("Login") {
                        authenticateUser(authEmail: email, authPassword: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    // NavigationLink to UserProfileView
                    NavigationLink(
                        destination: UserProfileView().environmentObject(userState),
                        isActive: $showingLoginScreen,
                        label: { EmptyView() }
                    )
                    
                    // Button to toggle the presentation of CreateAccountView
                    Button("Create an Account") {
                        isCreateAccountPresented.toggle()
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isCreateAccountPresented) {
                CreateAccountView()
            }
        }
    }

    // Function to authenticate the user using Firebase
    func authenticateUser(authEmail: String, authPassword: String) {
        Auth.auth().signIn(withEmail: authEmail, password: authPassword) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle authentication error
                    print("Login error: \(error.localizedDescription)")
                    self.wrongEmail = true
                    self.wrongPassword = true
                } else if let user = result?.user {
                    // Authentication successful
                    self.wrongEmail = false
                    self.wrongPassword = false
                    self.userState.isLoggedIn = true
                    self.userState.email = authEmail
                    self.showingLoginScreen = true
                    
                    // Clear the email and password fields on successful login
                    self.email = ""
                    self.password = ""
                } else {
                    // Unexpected case, handle accordingly
                    print("Unexpected result from Firebase authentication.")
                }
            }
        }
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserState()) // Provide a default UserState instance
    }
}
