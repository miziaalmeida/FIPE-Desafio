//
//  DetailViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 19/02/24.
//

import UIKit

class DetailViewController: UIViewController {

    var details: [CarDetail]?
    var brandId: String?
    var modelId: String?
    var yearId: String?
    var viewModel = DetailViewModel()
    
    lazy var brandLabel: UILabel = {
        let brandLabel = UILabel()
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        return brandLabel
    }()
    
    lazy var modelLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
       return modelLabel
    }()
    
    lazy var yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        return yearLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    lazy var viewCentral: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.brandId = brandId
        viewModel.modelId = modelId
        viewModel.yearId = yearId
        self.viewModel.getDetailForYears { details in
            self.details = details
            DispatchQueue.main.async {
                self.setupLabels()
            }
        }
    }
    
    func setupLabels() {
        guard let details = details?.first else {
            return
        }

        brandLabel.text = "Marca: \(details.marca)"
        modelLabel.text = "Modelo: \(details.modelo)"
        yearLabel.text = "Ano: \(details.anoModelo)"
        priceLabel.text = "Valor: \(details.valor)"
        
        view.addSubview(viewCentral)
        view.addSubview(brandLabel)
        view.addSubview(modelLabel)
        view.addSubview(yearLabel)
        view.addSubview(priceLabel)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            viewCentral.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCentral.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }

}
