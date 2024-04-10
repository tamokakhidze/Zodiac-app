import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func inputTextDidChange(_ newText: String?)
}

class MainViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    var inputTextField = UITextField()
    var imageView = UIImageView()
    var mainStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setImage()
        createMainStackView()
        
        
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
}

extension MainViewController: DescriptionViewControllerDelegate {
    func labelTextDidChange(_ newText: String?) {
        //
    }
    
    func getInputText() -> String? {
        return inputTextField.text
    }
}

struct ZodiacSign {
    let name: String
    let description: String
    let polarSign: String
    
    init(name: String, description: String, polarSign: String) {
        self.name = name
        self.description = description
        self.polarSign = polarSign
    }
}

let aries = ZodiacSign(name: "ვერძი", description: "ვერძი — ზოდიაქოს ნიშანი. იგი არის რიგით პირველი ასტროლოგიური ნიშნების სისტემაში. დასავლური ასტროლოგიის მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 20 მარტიდან 20 აპრილამდე. ვერძის ზოდიაქო განსხვავდება ვერძის თანავარსკვლავედისგან, სადაც მზე 19 აპრილიდან 13 მაისამდე მოძრაობს.", polarSign: "სასწორი")
let libra = ZodiacSign(name: "სასწორი", description: "სასწორი — ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს.", polarSign: "ვერძი")
let taurus = ZodiacSign(name: "კურო", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "მორიელი")
let scorpio = ZodiacSign(name: "მორიელი", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: taurus.name)
let gemini = ZodiacSign(name: "ტყუპები", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "მშვილდოსანი")
let cancer = ZodiacSign(name: "კირჩხიბი", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "თხის რქა")
let leo = ZodiacSign(name: "ლომი", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "მერწყული")
let aquarius = ZodiacSign(name: "მერწყული", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "ლომი")
let virgo = ZodiacSign(name: "ქალწული", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "თევზები")
let pisces = ZodiacSign(name: "თევზები", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "ქალწული")
let sagittarius = ZodiacSign(name: "მშვილდოსანი", description: "ზოდიაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრაობს", polarSign: "ტყუპები")
let capricorn = ZodiacSign(name: "თხის რქა", description: "ზოდაქოს ნიშანი. იგი არის რიგით მეშვიდე ასტროლოგიური ნიშნების სისტემაში. ზოდიაქოს პრინციპების მიხედვით, მზე ამ ნიშანში იმყოფება დაახლოებით 22 სექტემბრიდან 22 ოქტომბრამდე. სასწორის ზოდიაქო განსხვავდება სასწორის თანავარსკვლავედისგან, სადაც მზე 31 ოქტომბრიდან 22 ნოემბრამდე მოძრა", polarSign: "კირჩხიბი")
