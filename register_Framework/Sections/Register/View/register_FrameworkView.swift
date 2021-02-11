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
    func showRegisterResponse(response: RegisterPriestResponse) {
        
    }
    

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstLastNameTextField: UITextField!
    @IBOutlet weak var secondLastNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var officePicker: PickerViewTextField!
    @IBOutlet weak var birthdayPicker: DatePickerTextField!
    @IBOutlet weak var orditionPicker: DatePickerTextField!
    @IBOutlet weak var activitesPicker: PickerViewTextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var activitesTextField: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    
    //MARK: - IBActions
    @IBAction func saveButton(_ sender: Any) {
        let alert = UIAlertController(title: "App Encuentro", message: "Se modificaran tus datos", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        
        let accept = UIAlertAction(title: "Aceptar", style: .default, handler: {
            [weak self]
            _ in
            self?.updateData()
        })

        alert.addAction(accept)
        alert.addAction(cancel)
        
        present(alert, animated: true)
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
    
    func showClergy(clergy: Array<ClergyResponse>) {
        officePicker.pickOptions = clergy.map({$0.name})
        officePicker.initialize()
    }
    
    func showOffice(offices: Array<ActivitiesResponse>) {
        activitesPicker.pickOptions = offices.map({$0.name})
        activitesPicker.initialize()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    private func updateData()
    {
        var name: String
        if let nameText = nameTextField.text, !nameText.isEmpty
        {
            name = nameText
            print(name)
        }
        
        var firstLastName: String
        if let firstLastNameText = firstLastNameTextField.text, !firstLastNameText.isEmpty
        {
            firstLastName = firstLastNameText
            print(firstLastName)
        }
        
        var secondLastName: String
        if let secondLastNameText = secondLastNameTextField.text, !secondLastNameText.isEmpty
        {
            secondLastName = secondLastNameText
            print(secondLastName)
        }
        
        var description: String
        if let descriptionText = descriptionTextField.text, !descriptionText.isEmpty
        {
            description = descriptionText
            print(description)
        }
        
        var email: String
        if let emailText = emailTextField.text, !emailText.isEmpty {
            email = emailText
            print(email)
        }
        
        var birthDate: Date
        if birthdayPicker.selectedDate != Date(){
            birthDate = birthdayPicker.selectedDate
            print(birthDate)
        }
        
        var ordinationDate: Date
        if orditionPicker.selectedDate != Date(){
            ordinationDate = orditionPicker.selectedDate
            print(ordinationDate)
        }
        
        var office: String
        if let officeText = officePicker.text, !officeText.isEmpty{
            office = officeText
            print(office)
        }
        
        var activities: String
        if let activitiesText = activitesPicker.text, !activitiesText.isEmpty{
            activities = activitiesText
            print(activities)
        }
        
        var url: String
        if let urlText = urlTextField.text, !urlText.isEmpty{
            url = urlText
            print(url)
        }
    }
    
}



