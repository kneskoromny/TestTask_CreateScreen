//
//  CustomView.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 15.11.2021.
//

import UIKit
import SnapKit

final class CustomView: UIView {
    
    // MARK: - Public properties
    public var text = "" {
        didSet {
            label.text = text
        }
    }
    
    // MARK: - Private properties
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        return sv
    }()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Введите данные"
        return tf
        
    }()
    
    private var label: UILabel = {
        let l = UILabel()
        l.text = "Текст"
        l.textColor = .darkGray
        return l
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMainView()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureMainView()
        addSubviews()
    }
    
    // MARK: - Private methods
    private func configureMainView() {
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        layer.cornerRadius = 10
    }
  
    private func addSubviews() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
    }
}
