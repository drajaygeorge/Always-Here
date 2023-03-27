import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var occupation: String = ""
    @State private var hobbies: String = ""
    @State private var favorites: String = ""
    @State private var personality: String = ""
    @State private var strengths: String = ""
    @State private var weaknesses: String = ""
    @State private var goals: String = ""
    @State private var fears: String = ""
    
    var body: some View {
        NavigationView {
            Group {
                VStack(alignment: .leading) {
                    Text("What is the name of your loved one?")
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("How old do you want \(name) to be in this conversation?")
                    TextField("Enter age", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s gender")
                    TextField("Enter gender", text: $gender)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s occupation")
                    TextField("Enter occupation", text: $occupation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                }
                
                VStack(alignment: .leading) {
                    Text("\(name)'s hobbies or interests")
                    TextField("Enter hobbies or interests", text: $hobbies)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s favorite books, movies, or TV shows")
                    TextField("Enter favorites", text: $favorites)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("How would you describe \(name)'s personality in a few words?")
                    TextField("Enter personality", text: $personality)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                }
                
                VStack(alignment: .leading) {
                    Text("\(name)'s strengths")
                    TextField("Enter strengths", text: $strengths)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s weaknesses")
                    TextField("Enter weaknesses", text: $weaknesses)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s goals or ambitions")
                    TextField("Enter goals", text: $goals)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    Text("\(name)'s fears or challenges")
                    TextField("Enter fears", text: $fears)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                }
            }
            .padding()
            .navigationBarTitle("Character Information")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
}
