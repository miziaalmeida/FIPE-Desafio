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
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func loadCarsData() {
        BrandsViewModel.getCarBrand { [weak self] (cars) in
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


// MARK: - Preview

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct UIViewControllerPreview<BrandsViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewController: BrandsViewController
//
//    init(_ builder: @escaping () -> BrandsViewController) {
//        viewController = builder()
//    }
//
//    func makeUIViewController(context: Context) -> BrandsViewController {
//        viewController
//    }
//
//    func updateUIViewController(_ uiViewController: BrandsViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<BrandsViewController>>) {
//        return
//    }
//}
//#endif
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//let deviceNames: [String] = [
//    "iPhone 11 Pro Max"
//]
//
//@available(iOS 13.0, *)
//struct ViewController_Preview: PreviewProvider {
//  static var previews: some View {
//    ForEach(deviceNames, id: \.self) { deviceName in
//      UIViewControllerPreview {
//        BrandsViewController()
//      }.previewDevice(PreviewDevice(rawValue: deviceName))
//        .previewDisplayName(deviceName)
//    }
//  }
//}
//#endif
