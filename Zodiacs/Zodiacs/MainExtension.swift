import Foundation
import UIKit

extension MainViewController {
    
    func createMainStackView() {
        
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .leading
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 23).isActive = true
        
        
        let appNameLabel = createAppDescription()
        let mainPageDescr = customizeDescription()
        //let input = inputStackView()
        inputTextField = createInputField(placeholder: "მაგ. მერწყული")
        let mainPageInputStackView = inputStackView()
        mainPageInputStackView.addArrangedSubview(inputTextField)
        let nextButton = createButton()
        nextButton.addTarget(self, action: #selector(goToZodiacPAge), for: .touchUpInside)

        let emptyview = UIView()
        
        
        mainStackView.addArrangedSubview(appNameLabel)
        mainStackView.addArrangedSubview(mainPageDescr)
        mainStackView.addArrangedSubview(mainPageInputStackView)
        mainStackView.addArrangedSubview(nextButton)
        mainStackView.addArrangedSubview(emptyview)
        
        if let appnamelabel1 = mainStackView.arrangedSubviews.firstIndex(of: appNameLabel) {
                    mainStackView.setCustomSpacing(24, after: mainStackView.arrangedSubviews[appnamelabel1])
                }
        
        if let descr = mainStackView.arrangedSubviews.firstIndex(of: mainPageDescr) {
                    mainStackView.setCustomSpacing(91, after: mainStackView.arrangedSubviews[descr])
                }
        
        if let input1 = mainStackView.arrangedSubviews.firstIndex(of: mainPageInputStackView) {
                    mainStackView.setCustomSpacing(25, after: mainStackView.arrangedSubviews[input1])
                }
    
    }
    
    func createAppDescription() -> UILabel {
        
        let appNameLabel = UILabel()
        appNameLabel.text = "მიშა ცაგარელის აპი"
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .left
        appNameLabel.font = UIFont.systemFont(ofSize: 24)
        appNameLabel.widthAnchor.constraint(equalToConstant: 229).isActive = true
        appNameLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        return appNameLabel
    }
    
    func customizeDescription() -> UILabel {
        
        let mainPageDescription = UILabel()
        mainPageDescription.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        mainPageDescription.numberOfLines = 0
        mainPageDescription.textColor = .white
        mainPageDescription.textAlignment = .left
        mainPageDescription.heightAnchor.constraint(equalToConstant: 66).isActive = true
        mainPageDescription.font = UIFont(name: "Sylfaen", size: 16)
        
        return mainPageDescription
    }
    
    func inputStackView() -> UIStackView {
        
        let mainPageInputStackView = UIStackView()
        mainPageInputStackView.translatesAutoresizingMaskIntoConstraints = false
        mainPageInputStackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        mainPageInputStackView.axis = .vertical
        mainPageInputStackView.distribution = .equalSpacing
        mainPageInputStackView.alignment = .leading
        
        let labelForInput = UILabel()
        labelForInput.text = "ზოდიაქოს სახელი"
        labelForInput.textColor = .white
        labelForInput.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //let input = createInputField(placeholder: "მაგ.ქალწული")
        //input.addTarget(self, action: #selector(getInputText), for: .editingChanged)
        mainPageInputStackView.addArrangedSubview(labelForInput)
        //mainPageInputStackView.addArrangedSubview(input)
        
        return mainPageInputStackView
    }
    
    func createInputField(placeholder: String) -> UITextField {
        
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = placeholder
        input.textColor = .white
        input.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 5
        input.clipsToBounds = true
        input.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0).cgColor
        input.heightAnchor.constraint(equalToConstant: 44).isActive = true
        input.widthAnchor.constraint(equalToConstant: 335).isActive = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: input.frame.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        
        return input
        
        }
    
    func createButton() -> UIButton {
        
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.backgroundColor = .purple
        signInButton.layer.cornerRadius = 12
        signInButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        signInButton.setTitle("შემდეგ", for: .normal)
        
        return signInButton
        
    }
    
    @objc func inputTextChanged(_ textField: UITextField) {
        
        delegate?.inputTextDidChange(textField.text)
        
    }

    @objc func nextButtonPressed() {
        let descriptionVC = DescriptionViewController()
        descriptionVC.delegate = self
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    @objc func goToZodiacPAge() {
        let descriptionView = DescriptionViewController()
        descriptionView.delegate = self
        navigationController?.pushViewController(descriptionView, animated: true)

    }
    
}

#Preview {
    MainViewController()
}
