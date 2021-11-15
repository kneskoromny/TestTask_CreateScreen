//
//  CustomView.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 15.11.2021.
//

import UIKit
import SnapKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(labelText: String) {
        super.init(frame: .zero)
        createSubviews(with: labelText)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func createSubviews(with labelText: String) {
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemIndigo.cgColor
        layer.cornerRadius = 10
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        let label = UILabel()
        label.text = labelText
        stackView.addArrangedSubview(label)
        
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Введите данные"
        stackView.addArrangedSubview(textField)
    }


}
