import Foundation
import UIKit

protocol OppositeViewControllerDelegate: AnyObject {
    func getLabelText() -> String?
}

class OppositeSignViewController: UIViewController {
    
    
    
    var mainStackView = UIStackView()
    weak var delegate: OppositeViewControllerDelegate?
    
    var signLabel = UILabel()
    let imageView = UIImageView()
    var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        createMainStackView()
        updateDescriptionLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
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
        guard let labelText = delegate?.getLabelText() else {
            signLabel.text = "."
            return
        }

        switch labelText {
        case "მერწყული":
            signLabel.text = aquarius.polarSign
            image.image = UIImage(named: "lomi")
        case "ვერძი":
            signLabel.text = aries.polarSign
            image.image = UIImage(named: "saswori")
        case "სასწორი":
            signLabel.text = libra.polarSign
            image.image = UIImage(named: "verdzi")
        case "კურო":
            signLabel.text = taurus.polarSign
            image.image = UIImage(named: "nino")
        case "მორიელი":
            signLabel.text = scorpio.polarSign
            image.image = UIImage(named: "kuro")
        case "ტყუპები":
            signLabel.text = pisces.polarSign
            image.image = UIImage(named: "mshvildosani")
        case "მშვილდოსანი":
            signLabel.text = sagittarius.polarSign
            image.image = UIImage(named: "tyupebi")
        case "კირჩხიბი":
            signLabel.text = cancer.polarSign
            image.image = UIImage(named: "txa")
        case "თხის რქა":
            signLabel.text = capricorn.polarSign
            image.image = UIImage(named: "kiborchxalaaaa")
        case "ლომი":
            signLabel.text = leo.polarSign
            image.image = UIImage(named: "me")
        case "ქალწული":
            signLabel.text = virgo.polarSign
            image.image = UIImage(named: "tevzebi")
        case "თევზები":
            signLabel.text = pisces.polarSign
            image.image = UIImage(named: "qalwuli")
        default:
            signLabel.text = "აღწერა"
        }
    }
    
}



#Preview {
    OppositeSignViewController()
}
    


