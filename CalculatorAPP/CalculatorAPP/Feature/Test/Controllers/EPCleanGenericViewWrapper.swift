//
//  EPCleanGenericViewWrapper.swift
//
//
//  Created by Rafael Guimaraes dos Santos on 12/09/24.
//

import Foundation

import SwiftUI
import UIKit

public struct EPCleanGenericViewWrapper: UIViewControllerRepresentable {
     
    // Propriedades que você deseja passar para a view
    var viewModel: EPCleanGeneric.Model.ViewModel
    var listItems: [EPCleanLoan.Model.ViewModel.ListItemModel]
    weak var delegate: EPCleanGenericViewDelegate?

    func makeUIViewController(context: Context) -> EPCleanGenericView {
        let cleanGenericView = EPCleanGenericView()
        cleanGenericView.delegate = delegate
        return cleanGenericView
    }

    func updateUIView(_ uiViewController: EPCleanGenericView, context: Context) {
        uiView.displayScreenValues(with: viewModel, items: listItems, dataStore: /* seu PersonalLoanPaymentData aqui */)
    }
}
