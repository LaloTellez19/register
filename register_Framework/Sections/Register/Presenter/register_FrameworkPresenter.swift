//
//  register_FrameworkPresenter.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation

class register_FrameworkPresenter: register_FrameworkPresenterProtocol, register_FrameworkInteractorOutputProtocol {
    func respondeClergy(result: Result<Array<ClergyResponse>, ErrorEncuentro>) {
        switch result {
        case .success(let response):
            view?.showClergy(clergy: response)
        case .failure(let error):
        view?.showError(error: error.errorDescription)
        }
    }
    
    func getClergy() {
        interactor?.requestClergy()
    }
    
    func getOffice() {
        interactor?.requestOffice()
    }
    
    func responseOffice(result: Result<Array<AppointmentsResponse>, ErrorEncuentro>) {
        switch result {
        case .success(let response):
            view?.showOffice(offices: response)
        case .failure(let error):
        view?.showError(error: error.errorDescription)
        }
    }
    
    weak var view: register_FrameworkViewProtocol?
    var interactor: register_FrameworkInteractorInputProtocol?
    var wireFrame: register_FrameworkWireFrameProtocol?

    init() {}
}
