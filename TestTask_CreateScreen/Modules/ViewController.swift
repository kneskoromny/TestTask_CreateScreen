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
        b.addTarget(self,
                    action: #selector(add),
                    for: .touchUpInside)
        return b
    }()
    private let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    private let clearBtn: CustomButton = {
        let b = CustomButton()
        b.configureView(with: .clear)
        b.addTarget(self,
                    action: #selector(clear),
                    for: .touchUpInside)
        return b
    }()
    
    // Data
    private var childList: [String] = [] {
        didSet {
            // TODO: добавить свитч - при изменении кол-ва с 5 до 4 кнопка добавить должна появляться
            if childList.count == 5 {
                addChildBtn.isHidden = true
            }
            if childList.count == 0 {
                clearBtn.isHidden = true
            }
        }
    }
    var number = 1
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVertSV()
        addViewsToVertSV()
        addViewsToHorizSV()
        
        addTableView()
        addClearBtn()
        
        tableView.dataSource = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "childCell")
        
        tableView.isHidden = true
        clearBtn.isHidden = true
    }
    
    // MARK: - @objc methods
    @objc func add() {
        childList.append("child \(number)")
        number += 1
        print(#function, "child list count: \(childList.count)")
        print(childList)
        tableView.insertRows(at: [[0, 0]], with: .right)
        //tableView.reloadData()
        tableView.isHidden = false
        clearBtn.isHidden = false
    }
    @objc func clear() {
        Alert.present(in: self) { [weak self] in
            
            self?.childList.removeAll()
            self?.tableView.reloadData()
            self?.addChildBtn.isHidden = false
            self?.nameView.textField.text = nil
            self?.ageView.textField.text = nil
        }
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
        childList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childCell") as! CustomCell
        cell.delegate = self
        
        return cell
    }
    
    
}
// MARK: - Custom Cell Delegate
extension ViewController: CustomCellDelegate {
    func deleteRow(cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            print("delete child \(indexPath)")
            childList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            }
    }
    
    
}





