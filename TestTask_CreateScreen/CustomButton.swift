//
//  CustomButton.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 16.11.2021.
//

import UIKit
import SnapKit

enum ButtonState {
    case add
    case clear
}

final class CustomButton: UIButton {
    
    private let image: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "plus")
        return i
    }()
    private let label: UILabel = {
        let l = UILabel()
        
        return l
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addImage()
        addLabel()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        addImage()
        addLabel()
        
    }
    
    // MARK: - Private methods
    private func configure() {
        layer.borderWidth = 2
        layer.cornerRadius = 20
        
        backgroundColor = .white
    }
    
    private func addImage() {
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
    }
    private func addLabel() {
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalTo(self.snp_center)
        }
    }
    
}

// MARK: - Configure depends state
extension CustomButton {
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
        }
    }
}
