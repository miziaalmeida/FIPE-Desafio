//
//  BrandsViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 05/02/24.
//

import UIKit

class BrandsViewController: UIViewController, UITableViewDataSource {
    
    let viewModel = BrandsViewModel()
    var cars = [Car]()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        loadCarsData()
    }

    func setupView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func loadCarsData() {
         viewModel.getBrands { [weak self] (cars) in
             if let cars = cars {
                 self?.cars = cars
                 DispatchQueue.main.async {
                     self?.tableView.reloadData()
                 }
             } else {
                 print("deu ruim po")
             }
         }
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cars = cars[indexPath.row]
        cell.textLabel?.text = "\(cars.nome)"
        return cell
    }
}

extension BrandsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = ModelsViewController()
        let selectBrand = cars[indexPath.row]
        nextViewController.brandId = selectBrand.codigo
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
