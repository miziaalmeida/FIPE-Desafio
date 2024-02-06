//
//  YearViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 06/02/24.
//

import UIKit

class YearViewController: UIViewController {
    var tableView: UITableView!
    var brandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
    }
    
    func setupView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        brandLabel = UILabel()
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.text = "car"
        view.addSubview(brandLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        
        ])
    }
}
