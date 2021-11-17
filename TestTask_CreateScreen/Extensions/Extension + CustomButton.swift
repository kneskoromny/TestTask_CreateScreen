//
//  Extension + CustomButton.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 17.11.2021.
//

import UIKit

enum ButtonState {
    case add
    case clear
    case delete
}

extension CustomButton {
    func makeImage() -> UIImageView {
        let i = UIImageView()
        i.image = UIImage(systemName: "plus")
        return i
    }
    func makeLabel() -> UILabel {
        let l = UILabel()
        return l
    }
    
    // MARK: - Configure depends state
    public func configureView(with state: ButtonState) {
        switch state {
        case .add:
            layer.borderColor = UIColor.systemBlue.cgColor
            label.text = "Добавить ребенка"
            label.textColor = .systemBlue
        case .clear:
            layer.borderColor = UIColor.systemRed.cgColor
            label.text = "Очистить"
            label.textColor = .systemRed
            image.isHidden = true
        case .delete:
            layer.borderWidth = 0
            label.text = "Удалить"
            label.textColor = .systemBlue
            image.isHidden = true
        }
    }
}
