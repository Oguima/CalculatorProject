import UIKit

public class CalculatorViewController: UIViewController {
    private var viewModel: CalculatorViewModelProtocol
    private let calculatorView = CalculatorView()

    init(viewModel: CalculatorViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        setupView()
        setupConstraints()
        
        calculatorView.setButtonTarget(target: self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
    }
    
    @objc private func handleButtonTap(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        viewModel.handleButtonTap(title)
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(calculatorView)
        
        calculatorView.frame = view.bounds
        calculatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    private func setupConstraints() {
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CalculatorViewController: CalculatorViewModelDelegate {
    func didUpdateDisplay(with text: String) {
        calculatorView.updateDisplay(text: text)
    }
}
