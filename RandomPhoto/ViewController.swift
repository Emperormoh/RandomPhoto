//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Wema Bank on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private let button: UIButton =  {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Color", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemPink,
        .systemPurple,
        .systemYellow
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
                
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(DidTapButton), for: .touchUpInside)
    }
    @objc func DidTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(button)
        button.frame = CGRect(x: 30, y: button.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)

        
    }
    
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

