import UIKit

class DetailViewController: UIViewController {

    var details: CarDetail?
    var brandId: String?
    var modelId: String?
    var yearId: String?
    var viewModel = DetailViewModel()
    
    lazy var viewCentral: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewCentral)
        viewCentral.addSubview(brandLabel)
        viewCentral.addSubview(modelLabel)
        viewCentral.addSubview(yearLabel)
        viewCentral.addSubview(priceLabel)

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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewCentral.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewCentral.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewCentral.widthAnchor.constraint(equalToConstant: 390),
            viewCentral.heightAnchor.constraint(equalToConstant: 450),
            
            brandLabel.topAnchor.constraint(equalTo: viewCentral.topAnchor, constant: 10),
            brandLabel.leadingAnchor.constraint(equalTo: viewCentral.leadingAnchor, constant: 10),
            
            
        ])
    }
}
