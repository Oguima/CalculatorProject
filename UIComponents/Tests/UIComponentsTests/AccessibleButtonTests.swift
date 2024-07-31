import XCTest
import DesignSystem
@testable import UIComponents

class AccessibleButtonTests: XCTestCase {
    
    var accessibleButton: AccessibleButton!
    
    override func setUp() {
        super.setUp()
        accessibleButton = AccessibleButton()
    }
    
    override func tearDown() {
        accessibleButton = nil
        super.tearDown()
    }
    
    func testButtonBackgroundColor() {
        XCTAssertEqual(accessibleButton.backgroundColor, Colors.background)
    }
    
    func testButtonTitleColor() {
        XCTAssertEqual(accessibleButton.titleColor(for: .normal), .white)
    }
    
    func testButtonCornerRadius() {
        XCTAssertEqual(accessibleButton.layer.cornerRadius, 10.0)
    }
    
    func testButtonFont() {
        XCTAssertEqual(accessibleButton.titleLabel?.font, Typography.buttonFont)
    }
    
}
