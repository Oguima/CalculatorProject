import SwiftUI
import Calculator
//import Pods_CalculatorAPP

struct ContentView: View {
    
   @State private var mockViewModel = MockViewModel()
   @State private var mockListItems = createMockListItemModels()
    
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
