//
//  CustomButton.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 16.11.2021.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {
    lazy var image = makeImage()
    lazy var label = makeLabel()
    
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

