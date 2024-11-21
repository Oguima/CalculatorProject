//
//  File.swift
//  
//
//  Created by Rafael Guimaraes dos Santos on 12/09/24.
//

import Foundation

// Mock para EPCleanGeneric.Model.ViewModel
public struct MockViewModel {
    var value: String?
    var titlePersonalLoan: String?

    public init(value: String? = "Mock Value", titlePersonalLoan: String? = "Mock Title Personal Loan") {
        self.value = value
        self.titlePersonalLoan = titlePersonalLoan
    }
}

public func createMockListItemModels() -> [EPCleanLoan.Model.ListItemModel] {
    let item1 = EPCleanLoan.Model.ListItemModel(
        panCellListItemModel: EPCleanLoan.Model.PanCellListItemModel(title: "Item 1", subtitle: "Descrição 1", type: .installmentsEdit),
        cellType: .installmentsEdit,
        heightRow: 145
    )
    
    let item2 = EPCleanLoan.Model.ListItemModel(
        panCellListItemModel: EPCleanLoan.Model.PanCellListItemModel(title: "Item 2", subtitle: "Descrição 2", type: .dateEdit),
        cellType: .dateEdit,
        heightRow: 145
    )
    
    let item3 = EPCleanLoan.Model.ListItemModel(
        panCellListItemModel: EPCleanLoan.Model.PanCellListItemModel(title: "Item 3", subtitle: "Descrição 3", type: .link),
        cellType: .link,
        heightRow: 145
    )
    
    return [item1, item2, item3]
}
