//
//  YearViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import UIKit

class YearViewController: UIViewController {
    var years: [Anos]?
    var brandId: String?
    var modelId: String?
    var viewModel = YearsViewModel()

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
        self.viewModel.modelId = modelId
        
        view.addSubview(tableView)
        setupConstraint()
        
        self.viewModel.getYearsForModel { anos in
            self.years = anos
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

extension YearViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return years?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let year = years?[indexPath.row] {
            cell.textLabel?.text = year.nome
        } else {
            cell.textLabel?.text = "Ano não disponível"
        }
        return cell
    }
}
