//
//  ViewController.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 15.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UI elements
    private let vertStackView: UIStackView = {
        let sv = UIStackView()
        sv.configure(with: .vertical)
        return sv
    }()
    private let horStackView: UIStackView = {
        let sv = UIStackView()
        sv.configure(with: .horizontal)
        return sv
    }()
    private let persLabel: UILabel = {
        let l = UILabel()
        l.text = "Персональные данные"
        l.font = UIFont(name: "Menlo-Bold", size: 18)
        
        return l
    }()
    private let childLabel: UILabel = {
        let l = UILabel()
        l.text = "Дети (макс. 5)"
        l.font = UIFont(name: "Menlo", size: 15)
        return l
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
    private let addChildBtn: CustomButton = {
        let b = CustomButton()
        b.configureView(with: .add)
        return b
    }()
    private let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    private let clearBtn: CustomButton = {
        let b = CustomButton()
        b.configureView(with: .clear)
        return b
    }()
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVertSV()
        addViewsToVertSV()
        addViewsToHorizSV()
        
        addTableView()
        addClearBtn()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "childCell")
        
        tableView.isHidden = true
        clearBtn.isHidden = true
    }
    
    // MARK: - Private methods
    private func addVertSV() {
        view.addSubview(vertStackView)
        
        vertStackView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(view.snp_height).multipliedBy(0.4)
        }
    }
    private func addViewsToVertSV() {
        vertStackView.addArrangedSubview(persLabel)
        vertStackView.addArrangedSubview(nameView)
        vertStackView.addArrangedSubview(ageView)
        vertStackView.addArrangedSubview(horStackView)
        
        nameView.snp.makeConstraints { make in
            make.height.equalTo(vertStackView.snp_height).multipliedBy(0.25)
        }
        ageView.snp.makeConstraints { make in
            make.height.equalTo(vertStackView.snp_height).multipliedBy(0.25)
        }
        
        horStackView.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(nameView.snp_height)
        }
    }
    private func addViewsToHorizSV() {
        horStackView.addArrangedSubview(childLabel)
        horStackView.addArrangedSubview(addChildBtn)
        
        addChildBtn.snp.makeConstraints { make in
            make.size.greaterThanOrEqualTo(nameView).multipliedBy(0.6)
        }
    }
    private func addTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(vertStackView.snp_bottom).offset(40)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(view.snp_height).multipliedBy(0.3)
        }
    }
    private func addClearBtn() {
        view.addSubview(clearBtn)
        
        clearBtn.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp_bottom).offset(40)
            make.size.equalTo(nameView).multipliedBy(0.6)
            make.centerX.equalTo(tableView.snp_centerX)
        }
    }
    
}
// MARK: - Table View Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childCell") as! CustomCell
        return cell
    }
    
    
}
// MARK: - Table View Delegate
extension ViewController: UITableViewDelegate {
    
}




