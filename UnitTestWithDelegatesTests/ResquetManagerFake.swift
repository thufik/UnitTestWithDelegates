//
//  ResquetManagerFake.swift
//  UnitTestWithDelegatesTests
//
//  Created by EquipeSuporteAplicacao on 5/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation
@testable import UnitTestWithDelegates

class ResquetManagerReturnError : RequestManagerProtocol {
    func makeRequest(params: [String : Any], success: () -> Void, error: (NSError) -> Void) {
        error(NSError())
    }
}

class ResquetManagerReturnSuccess: RequestManagerProtocol {
    func makeRequest(params: [String : Any], success: () -> Void, error: (NSError) -> Void) {
        success()
    }
}
