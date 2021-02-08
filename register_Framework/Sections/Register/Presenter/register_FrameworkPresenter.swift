//
//  register_FrameworkPresenter.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation

class register_FrameworkPresenter: register_FrameworkPresenterProtocol, register_FrameworkInteractorOutputProtocol {
    weak var view: register_FrameworkViewProtocol?
    var interactor: register_FrameworkInteractorInputProtocol?
    var wireFrame: register_FrameworkWireFrameProtocol?

    init() {}
}
