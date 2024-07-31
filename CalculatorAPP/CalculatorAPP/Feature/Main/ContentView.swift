import SwiftUI
import Calculator

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack {
                    CalculatorViewControllerRepresentable()
                        .edgesIgnoringSafeArea(.all)
                }
                .navigationBarTitle("Calculator", displayMode: .inline)
            }
        }
}

#Preview {
    ContentView()
}
