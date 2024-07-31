import SwiftUI
import UIKit

public struct CalculatorViewControllerRepresentable: UIViewControllerRepresentable {
    
    public init() {}
    
    public func makeUIViewController(context: Context) -> CalculatorViewController {
        let viewModel = CalculatorViewModel(model: CalculatorModel())
        return CalculatorViewController(viewModel: viewModel)
    }

    public func updateUIViewController(_ uiViewController: CalculatorViewController, context: Context) {
        // No updates needed for now
    }
}

