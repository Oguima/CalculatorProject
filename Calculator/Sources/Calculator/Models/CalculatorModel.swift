import Foundation

protocol CalculatorModelProtocol {
    func performOperation(_ operation: String, with input: String) -> String
    func updateCurrentInput(_ input: String)
    func reset()
    func getCurrentInput() -> String
    func getPreviousInput() -> String?
    func getCurrentOperation() -> String
}

class CalculatorModel: CalculatorModelProtocol {
    private var currentInput: String = "0"
    private var previousInput: String?
    private var currentOperation: String?
    
    func performOperation(_ operation: String, with input: String) -> String {
        if let previous = previousInput, let current = Double(input) {
            let previousValue = Double(previous) ?? 0
            let result: Double
            
            switch currentOperation {
            case "+":
                result = previousValue + current
            case "-":
                result = previousValue - current
            case "*":
                result = previousValue * current
            case "/":
                result = previousValue / current
            default:
                result = current
            }
            
            currentInput = String(result)
            return currentInput
        }
        
        previousInput = currentInput
        currentOperation = operation
        currentInput = input
        
        return currentInput
    }
    
    func updateCurrentInput(_ input: String) {
        if currentInput == "0" && input != "." {
            currentInput = input
        } else {
            currentInput += input
        }
    }
    
    func reset() {
        currentInput = "0"
        previousInput = nil
        currentOperation = nil
    }
    
    func getCurrentInput() -> String {
        return currentInput
    }
    
    func getPreviousInput() -> String? {
        return previousInput
    }
    
    func getCurrentOperation() -> String {
        return currentOperation ?? ""
    }
}
