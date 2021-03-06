//
//  ViewController.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: - Private Const & Var
    private let customTableViewCellIdentifier = "cell"
    private let customTableViewHeaderIdentifier = "header"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customTableViewCellIdentifier)
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: customTableViewHeaderIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
// MARK: - VС Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Music"
        configureView()
    }
    
}

// MARK: - TableView Delegate & DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !modelSelection[section].open ? 0 : modelSelection[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier, for: indexPath) as! CustomTableViewCell
        let modelCell = modelSelection[indexPath.section].data[indexPath.row]
        cell.configCell(model: modelCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: customTableViewHeaderIdentifier)
            as! CustomHeaderView
        let model = modelSelection[section]
        header.configureHeader(title: model.title,
                               buttonTag: section,
                               buttonTappedCallback: expandSection)
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelSelection.count
    }
}

// MARK: - Private Metods
extension ViewController {
    private func configureView(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func expandSection(_ tag: Int) {
        let section = tag
        
        var indexPaths = [IndexPath]()
        for row in modelSelection[section].data.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isOpen = modelSelection[section].open
        modelSelection[section].open = !isOpen
        
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
}

