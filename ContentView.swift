import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var gender = ""
    @State private var occupation = ""
    @State private var hobbies = ""
    @State private var favorites = ""
    @State private var personality = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Let's Talk About Your Loved One")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Enter name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !name.isEmpty {
                    TextField("Enter age", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Picker("Gender", selection: $gender) {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                        Text("Other").tag("Other")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                if !gender.isEmpty {
                    TextField("Enter occupation", text: $occupation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter hobbies or interests", text: $hobbies)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter favorites", text: $favorites)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter personality", text: $personality)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Spacer()
                
                Button(action: startChat) {
                    Text("Start talking")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(!allFieldsFilledOut)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Missing Information"), message: Text("Please fill out all fields before starting the chat."), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
    
    var allFieldsFilledOut: Bool {
        !name.isEmpty && !age.isEmpty && !gender.isEmpty && !occupation.isEmpty && !hobbies.isEmpty && !favorites.isEmpty && !personality.isEmpty
    }

    func startChat() {
        if allFieldsFilledOut {
            let character = Character(name: name, age: age, gender: gender, occupation: occupation, hobbies: hobbies, favorites: favorites, personality: personality)
            let chatView = ChatView(character: character)
        } else {
            showAlert = true
        }
    }
}

struct ChatView: View {
    var character: Character
    @State private var message = ""
    
    func sendMessage() {
        let newMessage = Message(text: message, isSentByUser: true)
        let updatedCharacter = Character(name: character.name,
                                          age: character.age,
                                          gender: character.gender,
                                          occupation: character.occupation,
                                          hobbies: character.hobbies,
                                          favorites: character.favorites,
                                          personality: character.personality,
                                          messages: character.messages + [newMessage])
        character = updatedCharacter
        message = ""
    }

    var body: some View {
        VStack {
            Text("Welcome to your chat with \(character.name)!").font(.headline).padding()
            ScrollView {
                // Your chat message bubbles go here

            }
            HStack {
                TextField("Type a message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: sendMessage) {
                    Text("Send").bold()
                }
            }
        }
    }
}

struct Character {
    let name: String
    let age: String
    let gender: String
    let occupation: String
    let hobbies: String
    let favorites: String
    let personality: String
    var messages: [Message]
}

struct Message {
    let text: String
    let isSentByUser: Bool
}
