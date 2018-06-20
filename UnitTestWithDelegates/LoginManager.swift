//
//  LoginManager.swift
//  UnitTestWithDelegates
//
//  Created by EquipeSuporteAplicacao on 5/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation

protocol RequestManagerProtocol{
    func makeRequest(params : [String : Any], success : () -> Void, error : (_ error : NSError) -> Void)
}

class LoginManager: NSObject {
    
    var delegate : LoginViewProtocol
    
    init(loginViewDelegate : LoginViewProtocol) {
        self.delegate = loginViewDelegate
    }
    
    func login(email : String, pass : String, requestManager : RequestManagerProtocol){
        
        delegate.showIndicatorView()
        
        if (email == "") || (pass == ""){
            delegate.hideIndicatorView()
            delegate.showAlertMessage(message: "Campos vazios")
        }else{
            requestManager.makeRequest(params: [:], success: {
                delegate.hideIndicatorView()
                delegate.showWelcomeScreen()
            }, error: { error in
                delegate.hideIndicatorView()
                delegate.showAlertMessage(message: "Deu ruim")
            })
        }
    }
}

class RequestManager: RequestManagerProtocol {
    func makeRequest(params: [String : Any], success: () -> Void, error: (_ error : NSError) -> Void) {
        
//            Alamofire.request("\(baseUrl!)/login/2121", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
//    
//                switch response{
//                case .succes(let value) :
//                    success()
//                case .failure(let error):
//                    error(error)
//                }
//    
//            })
    }
    
}
