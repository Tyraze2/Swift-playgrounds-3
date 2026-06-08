import SwiftUI

struct signInUserName: View {
    @State var userName: String = "" 
    @State var passWord = ""
    @State var passwordAgain = ""
    @State var isSignedIn = false
    @State var buttonOutput = ""
    var body: some View{
        VStack(spacing: 0.1) {
            
            if isSignedIn {
                Text("Welcome, \(userData.userProfile.userName ?? "Guest")")
            }
            else {
                TextField("userName", text: $userName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 400)
                SecureField("Password", text: $passWord)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 400)
                SecureField("Enter Password Again", text: $passwordAgain)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 400)
                Button("Sign Up"){
                    if (userData.userProfile.userName ?? "").isEmpty {
                        userData.userProfile.userName = nil
                    }
                    if userName == " " || userName == "  " || userName == "   " || userName == "    "{
                        userData.userProfile.userName = nil
                    }
                    if passWord == passwordAgain && passWord.count >= 7 {
                        buttonOutput = "Account Created"
                        isSignedIn = true
                        userData.userProfile.userName = userName
                        userData.userProfile.passWord = passWord
                        if userName == "Admin" && passWord == "admin1" {
                            userData.userProfile.isAdmin = true
                        }
                    }
                    else if passWord.count < 7 {
                        buttonOutput = "Not enough Characters"
                    }
                    else if passWord != passwordAgain {
                        buttonOutput = "Passwords do not match"
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                Text(buttonOutput)
                    .foregroundStyle(.red)
            }
        }
    }
}


