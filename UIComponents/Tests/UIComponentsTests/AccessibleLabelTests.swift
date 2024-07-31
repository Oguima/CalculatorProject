import XCTest
import DesignSystem
@testable import UIComponents

class AccessibleLabelTests: XCTestCase {
    
    var accessibleLabel: AccessibleLabel!
    
    override func setUp() {
        super.setUp()
        accessibleLabel = AccessibleLabel()
    }
    
    override func tearDown() {
        accessibleLabel = nil
        super.tearDown()
    }
    
    func testLabelTextColor() {
        XCTAssertEqual(accessibleLabel.textColor, Colors.text)
    }
    
    func testLabelFont() {
        XCTAssertEqual(accessibleLabel.font, Typography.bodyFont)
    }
}

