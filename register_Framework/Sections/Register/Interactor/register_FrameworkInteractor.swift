//
//  register_FrameworkInteractor.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation

class register_FrameworkInteractor: register_FrameworkInteractorInputProtocol {
    func requestClergy() {
        RequestManager.shared.perform(route: RegisterRouter.clergy) { [weak self] (result: Result<Array<ClergyResponse>, ErrorEncuentro>, header: Dictionary<String, Any>?) in
            self?.presenter?.respondeClergy(result: result)
        }
    }
    
    func requestOffice() {
        RequestManager.shared.perform(route: RegisterRouter.appointments) { [weak self] (result: Result<Array<AppointmentsResponse>, ErrorEncuentro>, header: Dictionary<String, Any>?) in
            self?.presenter?.responseOffice(result: result)
        }
    }
    

    weak var presenter: register_FrameworkInteractorOutputProtocol?

    init() {}
}
