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
    lazy var vertStackView  = makeVertStackView()
    lazy var horStackView = makeHorizStackView()
    lazy var persLabel = makePersLabel()
    lazy var childLabel = makeChildLabel()
    lazy var nameView = makeNameView()
    lazy var ageView = makeAgeView()
    lazy var addBtn = makeAddBtn()
    lazy var tableView = makeTableView()
    lazy var clearBtn = makeClearBtn()
    
    // Data
    private var childList: [String] = [] {
        didSet {
            switch childList.count {
            case 0:
                addBtn.isHidden = false
                clearBtn.isHidden = true
            case 1...4:
                addBtn.isHidden = false
                clearBtn.isHidden = false
            default:
                addBtn.isHidden = true
                clearBtn.isHidden = false
            }
        }
    }
    
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
        childList.append("child")
        tableView.insertRows(at: [[0, 0]], with: .right)
        tableView.isHidden = false
    }
    @objc func clear() {
        Alert.present(in: self) { [weak self] in
            
            self?.childList.removeAll()
            self?.tableView.reloadData()
            self?.nameView.textField.text = nil
            self?.ageView.textField.text = nil
        }
    }
    
    // MARK: - Add UI elements
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
        horStackView.addArrangedSubview(addBtn)
        
        addBtn.snp.makeConstraints { make in
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
            
            childList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}





