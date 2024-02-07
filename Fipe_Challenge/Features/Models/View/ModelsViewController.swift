//
//  ModelsViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import UIKit

class ModelsViewController: UIViewController {
    
    var viewModel = ModelsViewModel()
    var tableViewModel: UITableView!
    var brandId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        viewModel.id = brandId
        loadModelData()

    }
    
    func setupView() {
        tableViewModel = UITableView()
        tableViewModel.translatesAutoresizingMaskIntoConstraints = false
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
        DispatchQueue.main.async {
        self.tableViewModel.reloadData()
        }
    }

}
