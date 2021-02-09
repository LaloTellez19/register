//
//  register_FrameworkView.swift
//  register
//
//  Created by Miguel Valdez on 02/08/2021.
//  Copyright © 2021 Linko. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class register_FrameworkViewController: UIViewController, register_FrameworkViewProtocol {
    func showClergy(clergy: Array<ClergyResponse>) {
        activitesPicker.pickOptions = clergy.map({$0.tag})
        activitesPicker.initialize()
    }
    
    func showOffice(offices: Array<AppointmentsResponse>) {
        officePicker.pickOptions = offices.map({$0.tag})
        officePicker.initialize()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var officePicker: PickerViewTextField!
    @IBOutlet weak var birthdayPicker: DatePickerTextField!
    @IBOutlet weak var orditionPicker: DatePickerTextField!
    @IBOutlet weak var activitesPicker: PickerViewTextField!
    
    //MARK: - IBActions
    @IBAction func saveButton(_ sender: Any) {
        
    }
    @IBAction func officehPickerAction(_ sender: Any) {
        officePicker.becomeFirstResponder()
    }
    @IBAction func activitesPickerAction(_ sender: Any) {
        activitesPicker.becomeFirstResponder()
    }
    
    //MARK:- Local variables
    var presenter: register_FrameworkPresenterProtocol?
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContent()
    }
    
    
    //MARK: - View controls
    private func initContent()
    {
        IQKeyboardManager.shared.enable = true
        presenter?.getOffice()
        presenter?.getClergy()
        birthdayPicker.initialize()
        orditionPicker.initialize()
    }
}



