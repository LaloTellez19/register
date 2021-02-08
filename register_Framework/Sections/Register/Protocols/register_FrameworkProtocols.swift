//
//  register_FrameworkProtocols.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation

protocol register_FrameworkViewProtocol: class {
    var presenter: register_FrameworkPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol register_FrameworkWireFrameProtocol: class {
    static func presentregister_FrameworkModule(fromView vc: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol register_FrameworkPresenterProtocol: class {
    var view: register_FrameworkViewProtocol? { get set }
    var interactor: register_FrameworkInteractorInputProtocol? { get set }
    var wireFrame: register_FrameworkWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol register_FrameworkInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol register_FrameworkInteractorInputProtocol: class
{
    var presenter: register_FrameworkInteractorOutputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}
