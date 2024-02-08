//
//  ModelsViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import UIKit

class ModelsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel = ModelsViewModel()
    var tableViewModel: UITableView!
    var brandId: String?
    var models = [CarDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        viewModel.brandId = brandId
        loadModelData()
    }
    
    func setupView() {
        tableViewModel = UITableView()
        tableViewModel.translatesAutoresizingMaskIntoConstraints = false
        tableViewModel.dataSource = self
        tableViewModel.delegate = self
        view.addSubview(tableViewModel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableViewModel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewModel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewModel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableViewModel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    func loadModelData() {
        viewModel.getModelsForBrand { [weak self] (models) in
            if let models = models {
                self?.models = models
                DispatchQueue.main.async {
                    self?.tableViewModel.reloadData()
                }
            } else {
                print("deu ruuuim!")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = models[indexPath.row]
        cell.textLabel?.text = model.modelo
        return cell
    }
}
