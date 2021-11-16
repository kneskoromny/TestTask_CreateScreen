//
//  CustomCell.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 15.11.2021.
//

import UIKit
import SnapKit

protocol CustomCellDelegate {
    func deleteRow(cell: UITableViewCell)
}

final class CustomCell: UITableViewCell {
    
    var delegate: CustomCellDelegate!
    
    // MARK: - UI Elements
    private let vertStackView: UIStackView = {
        let sv = UIStackView()
        sv.configure(with: .vertical)
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
    private let deleteBtn: CustomButton = {
        let b = CustomButton()
        b.configureView(with: .delete)
        b.addTarget(self, action: #selector(deleteChild), for: .touchUpInside)
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
    
    // MARK: - @objc methods
    @objc func deleteChild() {
        delegate.deleteRow(cell: self) 
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
        
        nameView.snp.makeConstraints { make in
            make.height.equalTo(vertStackView.snp_height).multipliedBy(0.45)
        }
        ageView.snp.makeConstraints { make in
            make.height.equalTo(vertStackView.snp_height).multipliedBy(0.45)
        }
    }
    private func addBtn() {
        contentView.addSubview(deleteBtn)
        
        deleteBtn.snp.makeConstraints { make in
            make.left.equalTo(vertStackView.snp_right).offset(20)
            make.size.equalTo(nameView).multipliedBy(0.5)
            make.centerY.equalTo(nameView.snp_centerY)
        }
    }
    

}
