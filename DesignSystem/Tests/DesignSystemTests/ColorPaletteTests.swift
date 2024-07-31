// Tests/DesignSystemTests/ColorPaletteTests.swift
import XCTest
@testable import DesignSystem

final class ColorPaletteTests: XCTestCase {
    func testPrimaryColor() {
        let expectedColor = UIColor(hex: "#F09A36")
        XCTAssertEqual(Colors.primaryButtonBackground , expectedColor)
    }
}
