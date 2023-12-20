import SwiftUI

struct ContentView: View {
    
    @State private var randomInt = Int.random(in: 1...3)
    
    @State private var showAlert = false
    @State private var resultMessage = ""
    @State private var cpuS = ""
    
    func setCpuChoice() {
        switch randomInt {
        case 1:
            cpuS = "rock"
        case 2:
            cpuS = "paper"
        case 3:
            cpuS = "scissors"
        default:
            break
        }
    }
    
    func playGame(playerChoice: Int) {
        randomInt = Int.random(in: 1...3)
        
        switch playerChoice {
        case 1: // Rock
            if randomInt == 3 {
                resultMessage = "You Won!"
            } else if playerChoice == randomInt {
                resultMessage = "You Tied!"
            } else if playerChoice < randomInt {
                resultMessage = "You Lost!"
            }
        case 2: // Paper
            if randomInt == 1 {
                resultMessage = "You Won!"
            } else if playerChoice == randomInt {
                resultMessage = "You Tied!"
            } else if playerChoice < randomInt {
                resultMessage = "You Lost!"
            }
        case 3: // Scissors
            if randomInt == 2 {
                resultMessage = "You Won!"
            } else if playerChoice == randomInt {
                resultMessage = "You Tied!"
            } else if playerChoice > randomInt {
                resultMessage = "You Lost!"
            }
        default:
            break
        }
        
        showAlert = true
        setCpuChoice()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Your opponent chose \(cpuS)")
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Welcome to Rock, Paper, Scissors Game")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Button("Rock") {
                        playGame(playerChoice: 1)
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    
                    Button("Paper") {
                        playGame(playerChoice: 2)
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    
                    Button("Scissors") {
                        playGame(playerChoice: 3)
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(resultMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            setCpuChoice()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
