import UIKit
import DesignSystem
import UIComponents

class CalculatorView: UIView {
    
    private let displayLabel: AccessibleLabel = {
        let label = AccessibleLabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.textAlignment = .right
        label.backgroundColor = Colors.background
        label.textColor = Colors.text
        label.numberOfLines = 1
        return label
    }()
        
    private let buttonGrid: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
        
    private let buttons: [[AccessibleButton]] = {
        let titles = [
            ["AC", "+/-", "%", "/"],
            ["7", "8", "9", "*"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["0", ".", "="]
        ]
        
        let types = [
            [AccessibleButton.ButtonType.primary, AccessibleButton.ButtonType.primary, AccessibleButton.ButtonType.primary, AccessibleButton.ButtonType.operation],
            [AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.operation],
            [AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.operation],
            [AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.operation],
            [AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.secondary, AccessibleButton.ButtonType.operation]
        ]
        
        return titles.enumerated().map { (rowIndex, row) in
            row.enumerated().map { (colIndex, title) in
                let button = AccessibleButton(type: .system)
                button.setupButton(types[rowIndex][colIndex])
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = Typography.bodyFont //UIFont.systemFont(ofSize: 24)
                button.layer.masksToBounds = true
                return button
            }
        }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(displayLabel)
        addSubview(buttonGrid)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonGrid.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayLabel.heightAnchor.constraint(equalToConstant: 100),
            
            buttonGrid.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 10),
            buttonGrid.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonGrid.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonGrid.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        setupButtonGrid()
    }
    
    private func setupButtonGrid() {
        for rowButtons in buttons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for button in rowButtons {
                rowStackView.addArrangedSubview(button)
            }
            
            buttonGrid.addArrangedSubview(rowStackView)
        }
    }
    
    // MARK: - Public Methods
        
    func setButtonTarget(target: AnyObject, action: Selector, for controlEvents: UIControl.Event) {
        for rowButtons in buttons {
            for button in rowButtons {
                button.addTarget(target, action: action, for: controlEvents)
            }
        }
    }
    
    func updateDisplay(text: String) {
        displayLabel.text = text
    }
}
