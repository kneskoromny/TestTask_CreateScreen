//
//  CustomCell.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 15.11.2021.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    // MARK: - UI Elements
    private let vertStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .equalSpacing
        sv.backgroundColor = .systemGreen
        return sv
    }()
    internal let nameView: CustomView = {
        let v = CustomView()
        v.text = "Имя"
        return v
    }()
    internal let ageView: CustomView = {
        let v = CustomView()
        v.text = "Возраст"
        return v
    }()
    private let deleteBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Удалить", for: .normal)
        b.backgroundColor = .orange
        return b
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addVertSV()
        addViewsToVertSV()
        addBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func addVertSV() {
        contentView.addSubview(vertStackView)
        
        vertStackView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(0)
            make.top.equalTo(contentView.snp_top).offset(10)
            make.bottom.equalTo(contentView.snp_bottom).offset(-10)
            make.width.equalTo(contentView.snp_width).multipliedBy(0.5)
        }
    }
    private func addViewsToVertSV() {
        vertStackView.addArrangedSubview(nameView)
        vertStackView.addArrangedSubview(ageView)
    }
    private func addBtn() {
        contentView.addSubview(deleteBtn)
        
        deleteBtn.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.left.equalTo(vertStackView.snp_right).offset(20)
        }
    }
    

}
