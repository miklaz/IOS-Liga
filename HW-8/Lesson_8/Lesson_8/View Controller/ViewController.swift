//
//  ViewController.swift
//  Lesson_8
//
//  Created by Михаил Зайцев on 30.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
// MARK: - Private Const & Var
    private let cellReuseIdentifier = "cell"
    private let headerFooterViewReuseIdentifier = "header"
    
    private lazy var data = [
        CategoryModel(nameItem: "Devices", itemToList: [
            ItemModel(nameItem: "iPhone with Mini-LED Display"),
            ItemModel(nameItem: "Macbook Pro with M2 SoC"),
            ItemModel(nameItem: "PlayStation 6"),]),
        CategoryModel(nameItem: "Furniture", itemToList: [
            ItemModel(nameItem: "Table"),
            ItemModel(nameItem: "Armchair"),
            ItemModel(nameItem: "Wardrobe"),
            ItemModel(nameItem: "Rack"),]),
        CategoryModel(nameItem: "Candies", itemToList: [
            ItemModel(nameItem: "Jelly Bean"),
            ItemModel(nameItem: "KitKat"),
            ItemModel(nameItem: "Lollipop"),
            ItemModel(nameItem: "Marshmallow"),
            ItemModel(nameItem: "Nougat"),
            ItemModel(nameItem: "Oreo"),
            ItemModel(nameItem: "Pie"),]),
        CategoryModel(nameItem: "Medications", itemToList: [
            ItemModel(nameItem: "Aspirin"),
            ItemModel(nameItem: "Sputnik V"),
            ItemModel(nameItem: "Paracetamol"),
            ItemModel(nameItem: "Activated carbon"),])
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerFooterViewReuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var editBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Edit"
        button.style = .plain
        button.target = self
        button.action = #selector(editBarButtonItemAction)
        
        return button
    }()

// MARK: - VС Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = editBarButtonItem
        title = "Wishlist"
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

}

// MARK: - TableView Delegate & DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].itemToList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let text = data[indexPath.section].itemToList[indexPath.row].nameItem
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let modelToMove = data[sourceIndexPath.section].itemToList[sourceIndexPath.row]
        data[sourceIndexPath.section].itemToList.remove(at: sourceIndexPath.row)
        data[destinationIndexPath.section].itemToList.insert(modelToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            data[indexPath.section].itemToList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerFooterViewReuseIdentifier) as? TableViewHeader
        header?.labelForSection.text = data[section].nameItem
        header?.buttonAddItem.tag = section
        header?.buttonAddItem.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        
        return header
    }
    
    @objc func editBarButtonItemAction() {
        if tableView.isEditing {
            tableView.isEditing = false
            editBarButtonItem.style = .plain
            editBarButtonItem.title = "Edit"
        } else {
            tableView.isEditing = true
            editBarButtonItem.style = .done
            editBarButtonItem.title = "Done"
        }
    }
    
}

// MARK: - Alert
extension ViewController {
    private func showAlert(section: Int) {
        let alert = UIAlertController(title: "Add your item in Wishlist", message: "", preferredStyle: .alert)
        
        alert.addTextField { UITextField in }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [weak self] UIAlertAction in
            let foodItem = (alert.textFields![0] as UITextField).text
            guard let self = self, let foodItem = foodItem else { return }
            let food = ItemModel(nameItem: foodItem)
            self.data[section].itemToList.append(food)
            self.tableView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func didTapAdd(button: UIButton) {
        showAlert(section: button.tag)
    }
    
}
