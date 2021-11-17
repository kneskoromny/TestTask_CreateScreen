//
//  Extension + UIView.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 17.11.2021.
//

import UIKit

extension ViewController {
    
    func makeVertStackView() -> UIStackView {
        let sv = UIStackView()
        sv.configure(with: .vertical)
        return sv
    }
    func makeHorizStackView() -> UIStackView {
        let sv = UIStackView()
        sv.configure(with: .horizontal)
        return sv
    }
    func makePersLabel() -> UILabel {
        let l = UILabel()
        l.text = "Персональные данные"
        l.font = UIFont(name: "Menlo-Bold", size: 18)
        return l
    }
    func makeChildLabel() -> UILabel {
        let l = UILabel()
        l.text = "Дети (макс. 5)"
        l.font = UIFont(name: "Menlo", size: 15)
        return l
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
    func makeAddBtn() -> CustomButton {
        let b = CustomButton()
        b.configureView(with: .add)
        b.addTarget(self,
                    action: #selector(add),
                    for: .touchUpInside)
        return b
    }
    func makeClearBtn() -> CustomButton {
        let b = CustomButton()
        b.configureView(with: .clear)
        b.addTarget(self,
                    action: #selector(clear),
                    for: .touchUpInside)
        return b
    }
    func makeTableView() -> UITableView {
        let tv = UITableView()
        return tv
    }
}
