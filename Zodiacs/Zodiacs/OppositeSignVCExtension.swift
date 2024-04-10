import Foundation
import UIKit

extension OppositeSignViewController {
     
    func createMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30 ).isActive = true
        
        image = createSignPhotoView()
        signLabel = createSignDescription()
        
        let redButton = createButton()
        redButton.backgroundColor = .red
        redButton.addTarget(self, action: #selector(goToPolarZodiacPAge), for: .touchUpInside)
        let blueButton = createButton()
        blueButton.backgroundColor = .blue
        let emptyview = UIView()
        
        mainStackView.addArrangedSubview(image)
        mainStackView.addArrangedSubview(signLabel)
        mainStackView.addArrangedSubview(redButton)
        mainStackView.addArrangedSubview(emptyview)
        mainStackView.addArrangedSubview(blueButton)
        image.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 100).isActive = true

        
        if let signnamelabel1 = mainStackView.arrangedSubviews.firstIndex(of: signLabel) {
            mainStackView.setCustomSpacing(200, after: mainStackView.arrangedSubviews[signnamelabel1])
        }
        
    }
    
    func createSignPhotoView() -> UIImageView {
        let photoView = UIImageView()
        photoView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        photoView.addSubview(image)
        
        return photoView
    }
    
    func createSignDescription() -> UILabel {
        let signNameLabel = UILabel()
        signNameLabel.textColor = .white
        signNameLabel.textAlignment = .center
        signNameLabel.font = UIFont.systemFont(ofSize: 24)
        signNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        signNameLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        return signNameLabel
    }
    
    func customizeDescription() -> UILabel {
        let signPageDescription = UILabel()
        signPageDescription.numberOfLines = 0
        signPageDescription.textColor = .white
        signPageDescription.textAlignment = .left
        signPageDescription.heightAnchor.constraint(equalToConstant: 420).isActive = true
        signPageDescription.font = UIFont(name: "Sylfaen", size: 14)
        
        return signPageDescription
    }
    
    func createButton() -> UIButton {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .purple
            button.layer.cornerRadius = 12
            button.heightAnchor.constraint(equalToConstant: 46).isActive = true
            button.widthAnchor.constraint(equalToConstant: 335).isActive = true
            button.setTitle("წითელი", for: .normal)
        
            return button
    }
    
    @objc func goToPolarZodiacPAge() {
        let oppositeSignView = OppositeSignViewController()
        navigationController?.pushViewController(oppositeSignView, animated: true)
    }
    
}

#Preview {
    OppositeSignViewController()
}

