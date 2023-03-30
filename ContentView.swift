import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var occupation: String = ""
    @State private var hobbies: String = ""
    @State private var favorites: String = ""
    @State private var personality: String = ""
    
    var body: some View {
        NavigationView {
            Group {
                VStack(alignment: .leading) {
                    Text("Let's Talk About Your Loved One")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                    Text("What is the name of your loved one?")
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    if !name.isEmpty {
                        Text("How old do you want \(name) to be in this conversation?")
                        TextField("Enter age", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                    
                    if !age.isEmpty {
                        Text("\(name)'s gender")
                        Picker("Gender", selection: $gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                            Text("Other").tag("Other")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    if !gender.isEmpty {
                        Text("\(name)'s occupation")
                        TextField("Enter occupation", text: $occupation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                    
                    if !occupation.isEmpty {
                        Text("\(name)'s hobbies or interests")
                        TextField("Enter hobbies or interests", text: $hobbies)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                    
                    if !hobbies.isEmpty {
                        Text("\(name)'s favorite books, movies, or TV shows")
                        TextField("Enter favorites", text: $favorites)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                    
                    if !favorites.isEmpty {
                        Text("How would you describe \(name)'s personality in a few words?")
                        TextField("Enter personality", text: $personality)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        // Start talking action
                    }) {
                        Text("Start talking")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .padding()
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
}
