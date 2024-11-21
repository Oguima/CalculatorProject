import UIKit
import SnapKit

protocol EPCleanGenericViewDelegate: AnyObject {
    func didTapBack()
    func didTapClose()
    //func didTapCellButton(type: EPCleanLoan.Model.EPLoanCellType)
    func didTapBottomButton()
    
    func didTapBottomButton2()
    func didTapBottomButton3()
    func didTapBottomButton4()
    func didTapBottomButton5()
    func didTapBottomButton6()
    func didTapBottomButton7()
    func didTapBottomButton8()
    func didTapBottomButton9()
}

final class EPCleanGenericView: UIView {
    
    // MARK: - Views
    public lazy var header: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        // Add back and close buttons here
        // Set up your buttons and actions
        return view
    }()
    
    public lazy var groupTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let tbView = UITableView()
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tbView.layer.backgroundColor = UIColor.white.cgColor
        tbView.separatorStyle = .none
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.isScrollEnabled = true
        tbView.dataSource = self
        tbView.delegate = self
        return tbView
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bottom Button", for: .normal)
        button.backgroundColor = .systemBlue
        //button.setTitleColor(.white, for: .white)
        button.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonStackView = UIStackView()
    
    // MARK: - Properties
    let cellHeight: CGFloat = 145
    private var viewModel: EPCleanGeneric.Model.ViewModel?
    var listItems: [EPCleanLoan.Model.ListItemModel] = []
    weak var delegate: EPCleanGenericViewDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        self.backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        addComponents()
        addConstraints()
        
        setupTableView()
        setupButtonStackView()
        setupBottomButton()
    }
    
    private func addComponents() {
        addSubview(header)
        addSubview(groupTitle)
        addSubview(tableView)
        addSubview(buttonStackView)
        addSubview(bottomButton)
    }
    
    private func setupTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(groupTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(buttonStackView.snp.top).offset(-20)
        }
    }
    
    private func setupButtonStackView() {
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 10
        buttonStackView.distribution = .fillEqually
        
        for i in 2...10 {
            let button = UIButton(type: .system)
            button.setTitle("Bottom Button \(i)", for: .normal)
            button.backgroundColor = .systemBlue
            button.addTarget(self, action: #selector(didTapButtonGeneric(_:)), for: .touchUpInside)
            button.tag = i
            
            buttonStackView.addArrangedSubview(button)
        }

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStackView)

        buttonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50 * 9 + 10 * 8)
            make.bottom.equalTo(bottomButton.snp.top).offset(-20)
        }
    }
    
    private func setupBottomButton() {
        bottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func addConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60) // Ajuste a altura conforme necessário
        }
        
        groupTitle.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(80)
        }
    }
    
    // MARK: - Logic display
    func displayScreenValues(with loanViewModel: EPCleanLoan.Model.ViewModel, items: [EPCleanLoan.Model.ListItemModel], dataStore: EPCleanGeneric.Model.PersonalLoanPaymentData) {
        self.listItems.removeAll()
        self.listItems = items
     
        groupTitle.text = "\(dataStore.titlePersonalLoan ?? "")"
        //bottomButton.setTitle(loanViewModel.response?.mainButton, for: .normal)
        
        tableView.snp.remakeConstraints { make in
            make.bottom.equalTo(bottomButton.snp.top).offset(-32)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(getTableViewHeight())
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Private functions
    @objc private func didTapBottomButton() {
        delegate?.didTapBottomButton()
    }
    
    @objc private func didTapButtonGeneric(_ sender: UIButton) {
        let buttonIndex = sender.tag
        switch buttonIndex {
        case 2:
            delegate?.didTapBottomButton2()
        case 3:
            delegate?.didTapBottomButton3()
        case 4:
            delegate?.didTapBottomButton4()
        case 5:
            delegate?.didTapBottomButton5()
        case 6:
            delegate?.didTapBottomButton6()
        case 7:
            delegate?.didTapBottomButton7()
        case 8:
            delegate?.didTapBottomButton8()
        default:
            delegate?.didTapBottomButton9()
        }
    }

    private func getTableViewHeight() -> CGFloat {
        return self.listItems.reduce(0) { $0 + $1.heightRow }
    }
}

// MARK: - Extensions
extension EPCleanGenericView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = self.listItems[indexPath.row]
        cell.textLabel?.text = cellData.panCellListItemModel?.title // Ajuste conforme necessário
        return cell
    }
}

extension EPCleanGenericView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.listItems[indexPath.row]
       // delegate?.didTapCellButton(type: item.cellType ?? .installmentsEdit)
    }
}

enum EPCleanGeneric {
    enum Model {
        struct PersonalLoanPaymentData {
            var origin: String?
            var originFlowAnalytics: String?
            var paymentValue: Double?
            var accountBalance: Double?
            var modalRetentionMessage: String?
            var titlePersonalLoan: String?
            var preApprovedValue: String?
            var loanValue: Double?
            
            public init(origin: String? = nil, originFlowAnalytics: String? = nil, paymentValue: Double? = nil, accountBalance: Double? = nil, modalRetentionMessage: String? = nil, titlePersonalLoan: String? = nil, preApprovedValue: String? = nil, loanValue: Double? = nil) {
                self.origin = origin
                self.originFlowAnalytics = originFlowAnalytics
                self.paymentValue = paymentValue
                self.accountBalance = accountBalance
                self.modalRetentionMessage = modalRetentionMessage
                self.titlePersonalLoan = titlePersonalLoan
                self.preApprovedValue = preApprovedValue
                self.loanValue = loanValue
            }
        }
        
        struct ViewModel {
            var value: String?
            var titlePersonalLoan: String?
            
            
        }
    }
}

enum EPCleanLoan {
    enum Model {
        enum EPLoanCellType {
            case installmentsEdit
            case dateEdit
            case link
            // Adicione outros tipos de células conforme necessário
        }
        
        struct ListItemModel {
            var panCellListItemModel: PanCellListItemModel? // Pode ser um modelo específico para a célula
            var cellType: EPLoanCellType? // Tipo da célula
            var heightRow: CGFloat // Altura da célula
            
            // Inicializador
            init(panCellListItemModel: PanCellListItemModel? = nil, cellType: EPLoanCellType? = nil, heightRow: CGFloat) {
                self.panCellListItemModel = panCellListItemModel
                self.cellType = cellType
                self.heightRow = heightRow
            }
        }
        
        struct ViewModel {
            var isInsuranceFixedFee: Bool?
            
            struct ListItemModel {
                let order: Int?
                var panCellListItemModel: PanCellListItemModel?
                var heightRow: CGFloat
                let isSeparator: Bool
                var isSwitchOn: Bool
                var cellType: EPLoanCellType?

                init(order: Int = 0,
                     panCellListItemModel: PanCellListItemModel?,
                     heightRow: CGFloat = 200,
                     isSeparator: Bool = false,
                     isSwitchOn: Bool = false,
                     cellType: EPLoanCellType? = nil) {
                    self.order = order
                    self.panCellListItemModel = panCellListItemModel
                    self.heightRow = heightRow
                    self.isSeparator = isSeparator
                    self.isSwitchOn = isSwitchOn
                    self.cellType = cellType
                }
            }
        }
        
        // Exemplo de modelo para a célula
        struct PanCellListItemModel {
            var title: String?
            var subtitle: String?
            var type: EPLoanCellType
            
            // Inicializador
            init(title: String? = nil, subtitle: String? = nil, type: EPLoanCellType) {
                self.title = title
                self.subtitle = subtitle
                self.type = type
            }
        }
    }
}
