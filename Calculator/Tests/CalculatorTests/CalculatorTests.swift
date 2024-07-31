import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var model: CalculatorModel!
    var viewModel: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        model = CalculatorModel()
        viewModel = CalculatorViewModel(model: model)
    }

    func testInitialResult() {
        XCTAssertEqual(viewModel.currentInput, "0")
    }

    func testAddition() {
        model.performOperation("+", with: "10")
        XCTAssertEqual(viewModel.currentInput, "10")
    }

    func testSubtraction() {
        model.performOperation("-", with: "5")
        XCTAssertEqual(viewModel.currentInput, "5")
    }
}
