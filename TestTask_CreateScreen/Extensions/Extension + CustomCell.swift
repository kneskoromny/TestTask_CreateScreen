//
//  Extension + CustomCell.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 17.11.2021.
//

import UIKit

extension CustomCell {
    func makeVertStackView() -> UIStackView {
        let sv = UIStackView()
        sv.configure(with: .vertical)
        return sv
    }
    func makeNameView() -> CustomView {
        let v = CustomView()
        v.text = "Имя"
        return v
    }
    func makeAgeView() -> CustomView {
        let v = CustomView()
        v.text = "Возраст"
        return v
    }
    func makeDeleteBtn()-> CustomButton {
        let b = CustomButton()
        b.configureView(with: .delete)
        b.addTarget(self, action: #selector(deleteChild), for: .touchUpInside)
        return b
    }
}
