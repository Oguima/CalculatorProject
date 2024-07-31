import UIKit
import DesignSystem

public class AccessibleButton: UIButton {
    
    public enum ButtonType {
        case primary
        case secondary
        case operation
    }
    
    //public convenience init(type buttonType: UIButton.ButtonType)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setupButton(_ type: ButtonType) {
        switch type {
        
        case .primary:
            backgroundColor = Colors.primaryButtonBackground
        case .secondary:
            backgroundColor = Colors.secondaryButtonBackground
        case .operation:
            backgroundColor = Colors.operatorButtonBackground
        }
        
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = Typography.largeFont
                
        layer.borderColor = Colors.borderColor.cgColor
        layer.borderWidth = Spacing.borderWidth
        layer.cornerRadius = Spacing.buttonSpacing
        
        isAccessibilityElement = true
        accessibilityTraits = .button
    }
    
    public func setAccessibilityLabel(_ label: String) {
        accessibilityLabel = label
    }
    
    public func setAccessibilityHint(_ hint: String) {
        accessibilityHint = hint
    }
}
