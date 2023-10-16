import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class UserState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var email = ""
    // ... other properties
}

struct ContentView: View {
    @StateObject var userState = UserState()
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = false
    @State private var wrongPassword = false
    @State private var showingLoginScreen = false
    @State private var isCreateAccountPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongEmail ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
                    Button("Login") {
                        authenticateUser(authEmail: email, authPassword: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(
                        destination: UserProfileView().environmentObject(userState),
                        isActive: $showingLoginScreen,
                        label: { EmptyView() }
                    )
                    
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

    
    func authenticateUser(authEmail: String, authPassword: String) {
        Auth.auth().signIn(withEmail: authEmail, password: authPassword) { result, error in
            DispatchQueue.main.async {
                if let error = error {
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
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(UserState()) // Provide a default UserState instance
        }
    }

