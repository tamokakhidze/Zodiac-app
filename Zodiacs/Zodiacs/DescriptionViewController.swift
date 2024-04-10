import Foundation
import UIKit

protocol DescriptionViewControllerDelegate: AnyObject {
    func getInputText() -> String?
    func labelTextDidChange(_ newText: String?)
}

protocol DescriptionControllerDelegate: AnyObject {
    func labelTextDidChange(_ newText: String?)
}

class DescriptionViewController: UIViewController {
    
    var mainStackView = UIStackView()
    
    weak var delegate: DescriptionViewControllerDelegate?
    var signLabel = UILabel()
    let imageView = UIImageView()
    var descriptionLabel = UILabel()
    var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setImage()
        createMainStackView()
        updateDescriptionLabel()
    }

    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            signLabel.text = delegate?.getInputText()
    }
    
    func setImage() {
        imageView.image = UIImage(named: "Group 5")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func updateDescriptionLabel() {
        guard let inputText = delegate?.getInputText() else {
            descriptionLabel.text = "."
            return
        }

        switch inputText {
        case "მერწყული":
            descriptionLabel.text = aquarius.description
            image.image = UIImage(named: "me")
        case "ვერძი":
            descriptionLabel.text = aries.description
            image.image = UIImage(named: "verdzi")
        case "სასწორი":
            descriptionLabel.text = libra.description
            image.image = UIImage(named: "saswori")
        case "კურო":
            descriptionLabel.text = taurus.description
            image.image = UIImage(named: "kuro")
        case "მორიელი":
            descriptionLabel.text = scorpio.description
            image.image = UIImage(named: "nino")
        case "ტყუპები":
            descriptionLabel.text = gemini.description
            image.image = UIImage(named: "tyupebi")
        case "მშვილდოსანი":
            descriptionLabel.text = sagittarius.description
            image.image = UIImage(named: "mshvildosani")
        case "კირჩხიბი":
            descriptionLabel.text = cancer.description
            image.image = UIImage(named: "kiborchxalaaaa")
        case "თხის რქა":
            descriptionLabel.text = capricorn.description
            image.image = UIImage(named: "txa")
        case "ლომი":
            descriptionLabel.text = leo.description
            image.image = UIImage(named: "lomi")
        case "ქალწული":
            descriptionLabel.text = virgo.description
            image.image = UIImage(named: "qalwuli")
        case "თევზები":
            descriptionLabel.text = pisces.description
            image.image = UIImage(named: "tevzebi")
        default:
            descriptionLabel.text = "აღწერა"
        }
    }
    
    @objc func labelTextChanged(_ textField: UITextField) {
        delegate?.labelTextDidChange(textField.text)
    }
    
    @objc func nextButtonPressed() {
        let descriptionVC = OppositeSignViewController()
        descriptionVC.delegate = self
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
}

extension DescriptionViewController: OppositeViewControllerDelegate {
    func getLabelText() -> String? {
        return signLabel.text
    }
}


#Preview {
    DescriptionViewController()
}
