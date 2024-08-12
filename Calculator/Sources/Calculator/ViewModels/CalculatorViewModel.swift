import Foundation

protocol CalculatorViewModelDelegate: AnyObject {
    func didUpdateDisplay(with text: String)
}

protocol CalculatorViewModelProtocol {
    func handleButtonTap(_ title: String)
    var currentInput: String { get }
    var delegate: CalculatorViewModelDelegate? { get set }
}

class CalculatorViewModel: CalculatorViewModelProtocol {
    
    private let model: CalculatorModelProtocol
    weak var delegate: CalculatorViewModelDelegate?
    
    var currentInput: String {
        return model.getCurrentInput()
    }
    
    init(model: CalculatorModelProtocol) {
        self.model = model
    }

    func handleButtonTap(_ title: String) {
        switch title {
        case "0"..."9", ".":
            model.updateCurrentInput(title)
            delegate?.didUpdateDisplay(with: model.getCurrentInput())
        case "+", "-", "*", "/":
            if let currentOperation = model.getPreviousInput() {
               // Perform previous operation
               model.performOperation(currentOperation, with: model.getCurrentInput())
               delegate?.didUpdateDisplay(with: model.getCurrentInput())
           }
           model.performOperation(title, with: model.getCurrentInput())
           delegate?.didUpdateDisplay(with: model.getCurrentInput())
        case "=":
            model.performOperation(model.getCurrentOperation(), with: model.getCurrentInput())
            delegate?.didUpdateDisplay(with: model.getCurrentInput())
            model.reset()
        case "AC":
            model.reset()
            model.updateCurrentInput("0")
            delegate?.didUpdateDisplay(with: model.getCurrentInput())
        case "+/-":
            let input = model.getCurrentInput()
            if let result = Double(input) {
                model.reset()
                let calculation = result * -1
                model.updateCurrentInput(calculation.description)
                delegate?.didUpdateDisplay(with: model.getCurrentInput())
            }
        case "%":
            let input = model.getCurrentInput()
            if let result = Double(input) {
                model.reset()
                let calculation = result / 100
                model.updateCurrentInput(calculation.description)
                delegate?.didUpdateDisplay(with: model.getCurrentInput())
            }
        default:
            break
        }
    }
    
}
