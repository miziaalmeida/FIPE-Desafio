//
//  BrandsViewController.swift
//  Fipe_Challenge
//
//  Created by Jeiel Lima on 05/02/24.
//

import UIKit

class BrandsViewController: UIViewController {
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


// MARK: - Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<BrandsViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: BrandsViewController

    init(_ builder: @escaping () -> BrandsViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> BrandsViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: BrandsViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<BrandsViewController>>) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 11 Pro Max"
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
        BrandsViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
