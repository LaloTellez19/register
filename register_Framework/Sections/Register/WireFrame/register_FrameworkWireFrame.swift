//
//  register_FrameworkWireFrame.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation
import UIKit

public class register_FrameworkWireFrame: register_FrameworkWireFrameProtocol {

    public static func presentregister_FrameworkModule(fromView vc:AnyObject) {

        // Generating module components
        let storyboard = UIStoryboard(name: "register", bundle: Bundle(for: register_FrameworkViewController.self))
        let view: register_FrameworkViewProtocol = storyboard.instantiateViewController(withIdentifier: "register_FrameworkViewController") as! register_FrameworkViewProtocol
        let presenter: register_FrameworkPresenterProtocol & register_FrameworkInteractorOutputProtocol = register_FrameworkPresenter()
        let interactor: register_FrameworkInteractorInputProtocol = register_FrameworkInteractor()
        let wireFrame: register_FrameworkWireFrameProtocol = register_FrameworkWireFrame()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        if let vc = vc as? UIViewController{
            vc.navigationController?.pushViewController(view as! UIViewController, animated: true)
        }
        
    }
}
