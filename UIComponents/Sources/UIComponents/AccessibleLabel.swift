import UIKit
import DesignSystem

public class AccessibleLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }
    
    private func setupLabel() {
        font = Typography.primaryFont
        textColor = Colors.text
        isAccessibilityElement = true
    }
    
    public func setAccessibilityLabel(_ label: String) {
        accessibilityLabel = label
    }
    
    public func setAccessibilityHint(_ hint: String) {
        accessibilityHint = hint
    }
}
