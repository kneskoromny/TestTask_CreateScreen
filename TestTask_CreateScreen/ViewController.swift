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
    // FIXME: убрать настройку в extension
    private let vertStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .equalSpacing
        sv.backgroundColor = .systemGreen
        return sv
    }()
    private let horStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.backgroundColor = .systemBlue
        return sv
    }()
    private let persLabel: UILabel = {
        let l = UILabel()
        l.text = "Персональные данные"
        return l
    }()
    private let childLabel: UILabel = {
        let l = UILabel()
        l.text = "Дети (макс. 5)"
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
    // TODO: кастомный класс для кнопки
    private let addChildBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .magenta
        return b
    }()
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemPink
        return tv
    }()
    
    // TODO: добавить кнопку ОЧИСТИТЬ
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVertSV()
        addViewsToHorizSV()
        addViewsToVertSV()
        
        addTableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "childCell")
    }
    
    // MARK: - Private methods
    private func addVertSV() {
        view.addSubview(vertStackView)
        
        vertStackView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(view.snp_height).multipliedBy(0.3)
        }
    }
    private func addViewsToVertSV() {
        vertStackView.addArrangedSubview(persLabel)
        vertStackView.addArrangedSubview(nameView)
        vertStackView.addArrangedSubview(ageView)
        vertStackView.addArrangedSubview(horStackView)
        
        horStackView.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(nameView.snp_height)
        }
    }
    private func addViewsToHorizSV() {
        horStackView.addArrangedSubview(childLabel)
        horStackView.addArrangedSubview(addChildBtn)
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




