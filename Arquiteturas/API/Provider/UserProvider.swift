//
//  UserProvider.swift
//  Arquiteturas
//
//  Created by Nikolas Gianoglou Coelho on 18/09/2023.
//

import Foundation
import FirebaseAuth
//FAZ A CHAMADA DA API, ELE INTERAGE COM ELA
protocol UserProviderProtocol {
    func login(paramaters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(paramaters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    
}


class UserProvider: UserProviderProtocol {
    
    lazy var auth = Auth.auth()
    
    func login(paramaters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = paramaters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    func register(paramaters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = paramaters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
}
