//
//  BrandView.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 05/02/24.
//

import UIKit

final class BrandsView: UIView {
    lazy var brandTableView: UITableView = {
        let brandTableView = UITableView()
        brandTableView.translatesAutoresizingMaskIntoConstraints = false
        return brandTableView
    }()
    lazy var brandLabel: UILabel = {
        let brandLabel = UILabel()
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        return brandLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(brandTableView)
        addSubview(brandLabel)
    }
}
