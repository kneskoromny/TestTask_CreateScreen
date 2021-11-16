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
    case delete
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
        addLabel()
        addImage()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        addLabel()
        addImage()
        
    }
    
    // MARK: - Private methods
    private func configure() {
        layer.borderWidth = 2
        layer.cornerRadius = 20
        
        backgroundColor = .white
        label.font = UIFont(name: "Menlo", size: 15)
    }
    
    private func addImage() {
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.right.equalTo(label.snp_left).offset(-5)
            make.centerY.equalTo(label.snp_centerY)
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
        case .delete:
            layer.borderWidth = 0
            label.text = "Удалить"
            label.textColor = .systemBlue
            image.isHidden = true
        }
    }
}
