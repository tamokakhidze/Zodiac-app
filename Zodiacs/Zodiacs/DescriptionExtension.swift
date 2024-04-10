import Foundation
import UIKit

extension DescriptionViewController {
     
    
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
        descriptionLabel = customizeDescription()
        signLabel = createSignDescription()
        
        let polarSignButton = createButton()
        polarSignButton.addTarget(self, action: #selector(goToPolarZodiacPAge), for: .touchUpInside)
        let emptyview = UIView()
        
        mainStackView.addArrangedSubview(image)
        mainStackView.addArrangedSubview(signLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(polarSignButton)
        mainStackView.addArrangedSubview(emptyview)
        
        if let signnamelabel1 = mainStackView.arrangedSubviews.firstIndex(of: signLabel) {
            mainStackView.setCustomSpacing(30, after: mainStackView.arrangedSubviews[signnamelabel1])
        }
        
        if let photo = mainStackView.arrangedSubviews.firstIndex(of: image) {
            mainStackView.setCustomSpacing(10, after: mainStackView.arrangedSubviews[photo])
        }
        
        if let descr = mainStackView.arrangedSubviews.firstIndex(of: descriptionLabel) {
            mainStackView.setCustomSpacing(46, after: mainStackView.arrangedSubviews[descr])
        }
    
    }
    
    func createSignPhotoView() -> UIImageView {
        let photoView = UIImageView()
        photoView.heightAnchor.constraint(equalToConstant: 156).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 156).isActive = true
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
        signPageDescription.text = "პლანეტა მერკურის გავლენის ქვეშ დაბადებული ქალწულები, მოწესრიგებულობით, უზადო პასუხისმგებლობის გრძნობით და წვრილმანების მიმართ გასაოცარი ყურადღებიანობით გამოირჩევიან. ზოდიაქოს სხვა ნიშნის წარმომადგენლებს შორის, ქალწულის ცნობა მისი უნაკლო ჩაცმულობით, დავარცხნილ-გაწკრიალებული გარეგნობით და ზრდილობიანი მანერებით შეიძლება. ქალწულებს შორის როგორც წესი, ტანმორჩილი ხალხი სჭარბობს.მათ შორის გიგანტს ან შესამჩნევად დიდი გაბარიტების მქონე ხალხს იშვიათად შეხვდებით.გამომდინარე იქედან, რომ ქალწულის ზოდიაქო, კუჭნაწლავის და ზოგადად საჭმლის მომნელებელ სისტემაზეა პასუხისმგებელი, ზოდიაქოს ამ ნიშნით დაბადებულ ადამიანებს, საკვების და ზოგადად ჯანსაღი კვების სფერო განსაკუთრებულად აღელვებთ და აინტერესებთ.იშვიათი არ არის არც ის ფაქტი, რომ ქალწულის ზოდიაქოს ნიშნით დაბადებულთა შორის, ბევრი ექიმი- დიეტოლოგი და ფარმაცევტი გვხვდება."
        
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
            button.setTitle("პოლარული ნიშანი", for: .normal)
        
            return button
        }
    
    @objc func goToPolarZodiacPAge() {
        let oppositeSignView = OppositeSignViewController()
        oppositeSignView.delegate = self
        navigationController?.pushViewController(oppositeSignView, animated: true)
    }
    
}

#Preview {
    DescriptionViewController()
}

