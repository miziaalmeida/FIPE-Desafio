//
//  ModelsViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import UIKit

class ModelsViewController: UIViewController {
    var cars: CarModel?
    var brandId: String?
    var viewModel = ModelsViewModel()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.brandId = brandId
        
        view.addSubview(tableView)
        setupConstraint()
        
        self.viewModel.getModelsForBrand { model in
            self.cars = model
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ModelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cars = cars else { return 0 }
        return cars.modelos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let cars = cars else { return UITableViewCell() }
        let modelos = cars.modelos[indexPath.row]
        let nome = modelos.nome
        
        cell.textLabel?.text = "\(String(describing: nome))"
        cell.backgroundColor = .clear
        return cell
    }
}
