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

    }
    
    func setupView() {
        tableViewModel = UITableView()
        tableViewModel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewModel)

//        brandLabel = UILabel()
//        brandLabel.translatesAutoresizingMaskIntoConstraints = false
//        brandLabel.text = "car"
//        view.addSubview(brandLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
//    func loadCarsData() {
//        viewModel.getCarModel { [weak self] (cars) in
//            if let cars = cars {
//                self?.cars = cars
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            } else {
//                print("deu ruim po")
//            }
//        }
//    }

}
