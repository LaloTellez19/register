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
        
        initView()
    }
    
    
    //MARK: - View controls
    private func initView()
    {
        IQKeyboardManager.shared.enable = true
        officePicker.pickOptions = ["A","B"]
        officePicker.closure = {
            index in
        }
        activitesPicker.pickOptions = ["A","B"]
        activitesPicker.closure = {
            index in
        }


        officePicker.initialize()
        activitesPicker.initialize()
        birthdayPicker.initialize()
        orditionPicker.initialize()
    }
}



