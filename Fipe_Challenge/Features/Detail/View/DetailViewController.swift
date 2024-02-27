import UIKit

class DetailViewController: UIViewController {

    var details: CarDetail?
    var brandId: String?
    var modelId: String?
    var yearId: String?
    var viewModel = DetailViewModel()
    
    lazy var viewCentral: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    lazy var modelLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.font = .systemFont(ofSize: 24)
        modelLabel.numberOfLines = 0
       return modelLabel
    }()
    
    lazy var yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = .systemFont(ofSize: 24)
        return yearLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = .boldSystemFont(ofSize: 30)
        return priceLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func updateUI() {
        guard let details = details else {
            print("Erro: Dados inválidos")
            return
        }
        brandLabel.text = "Marca: \(details.marca)"
        modelLabel.text = "Modelo: \(details.modelo)"
        yearLabel.text = "Ano: \(details.anoModelo)"
        priceLabel.text = "Valor: \(details.valor)"
    }
    
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        
        viewModel.brandId = brandId
        viewModel.modelId = modelId
        viewModel.yearId = yearId
        
        viewModel.getDetailForYears { [weak self] details in
            self?.details = details
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    private func setupViewHierarchy() {
        view.addSubview(viewCentral)
        viewCentral.addSubview(brandLabel)
        viewCentral.addSubview(modelLabel)
        viewCentral.addSubview(yearLabel)
        viewCentral.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewCentral.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCentral.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewCentral.widthAnchor.constraint(equalToConstant: 390),
            viewCentral.heightAnchor.constraint(equalToConstant: 230),
            
            brandLabel.topAnchor.constraint(equalTo: viewCentral.topAnchor, constant: 25),
            brandLabel.leadingAnchor.constraint(equalTo: viewCentral.leadingAnchor, constant: 10),
            brandLabel.trailingAnchor.constraint(equalTo: viewCentral.trailingAnchor, constant: 10),
            
            modelLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 10),
            modelLabel.leadingAnchor.constraint(equalTo: viewCentral.leadingAnchor, constant: 10),
            modelLabel.trailingAnchor.constraint(equalTo: viewCentral.trailingAnchor, constant: 10),
            
            yearLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: viewCentral.leadingAnchor, constant: 10),
            yearLabel.trailingAnchor.constraint(equalTo: viewCentral.trailingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 25),
            priceLabel.centerXAnchor.constraint(equalTo: viewCentral.centerXAnchor)
            
        ])
    }
}
