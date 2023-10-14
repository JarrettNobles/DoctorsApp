import SwiftUI

struct ContentView: View {
    @StateObject var userState = UserState()

    //username variable
    @State private var username = ""
    //password variable
    @State private var password = ""
    //wrong
    @State private var wrongUsername = false
    //wrong password
    @State private var wrongPassword = false
    @State private var showingLoginScreen = false

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

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongUsername ? Color.red : Color.clear, lineWidth: 2)
                        )

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2)
                        )

                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    //not sure how to fix deprecated warning?
                    NavigationLink(
                        destination: UserProfileView().environmentObject(userState),
                        isActive: $showingLoginScreen,
                        label: { EmptyView() }
                    )
                }
            }
            .navigationBarHidden(true)
        }
    }

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
