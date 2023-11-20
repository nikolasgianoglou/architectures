//
//  ViewController.swift
//  Arquiteturas
//
//  Created by Nikolas Gianoglou Coelho on 18/09/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = UserManager(business: UserBusiness())
        manager.register(email: "teste@gmail.com", password: "12345678") { model in
            print(model.email)
        } failureHandler: { error in
            print(error.localizedDescription)
        }
    }


}

