//
//  ViewController.swift
//  SuperHeroApp
//
//  Created by Andrey on 20.06.2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let jsonUrl = "https://randomuser.me/api/?nat=us&results=1&inc=gender,name,email,phone,picture"
        
    var persons: [Person] = []
    
    @IBOutlet weak var imageFromScreen: UIImageView!
    @IBOutlet weak var labelFromScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataPerson()
        configure(with: persons)
    }
    
    func fetchDataPerson() {
        guard let url = URL(string: jsonUrl) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}

            let decoder = JSONDecoder()

            do{
                let json = try decoder.decode(Persons.self, from: data)
                self.persons = json.results ?? []
                print(self.persons)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func configure(with person: [Person]) {
        labelFromScreen.text = "Имя - \(person.first?.name?.first ?? "Иван")"
        print(person.first?.name?.first)

        DispatchQueue.global().async {
            guard let stringURL = person.first?.picture.medium else { return }
            print(stringURL)
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.imageFromScreen.image = UIImage(data: imageData)
            }
        }
    }
}

