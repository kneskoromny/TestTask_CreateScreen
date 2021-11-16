//
//  Extension + UIStackView.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 16.11.2021.
//

import Foundation
import UIKit

extension UIStackView {
    func configure(with state: NSLayoutConstraint.Axis) {
        switch state {
        case .vertical:
            axis = .vertical
            spacing = 20
            distribution = .equalSpacing
        case .horizontal:
            axis = .horizontal
            spacing = 20
            distribution = .fillEqually
        @unknown default:
            fatalError()
        }
    }
}
