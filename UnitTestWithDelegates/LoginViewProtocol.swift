//
//  LoginViewProtocol.swift
//  UnitTestWithDelegates
//
//  Created by EquipeSuporteAplicacao on 6/20/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation

protocol LoginViewProtocol {
    func showIndicatorView()
    func hideIndicatorView()
    func showAlertMessage(message : String)
    func showWelcomeScreen()
}
