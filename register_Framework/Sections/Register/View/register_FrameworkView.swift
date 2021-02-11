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
    @IBOutlet weak var firstLastNameTextField: UITextField!
    @IBOutlet weak var secondLastNameTextField: UITextField!
    @IBOutlet weak var activitiesColletionView: UICollectionView!
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
        initView()
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
    
    private func initView()
    {
        activitiesColletionView.register(ActivitiesCardCollectionViewCell.nib, forCellWithReuseIdentifier: ActivitiesCardCollectionViewCell.reuseIdentifier)
        activitiesColletionView.dataSource = self
        activitiesColletionView.delegate = self
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
        var userId: Int
        userId = 1
        let activitiesArray = [1,2,3,4,5]
        
        if let name = nameTextField.text, !name.isEmpty,
           let firstLastName = firstLastNameTextField.text, !firstLastName.isEmpty,
           let secondLastName = secondLastNameTextField.text, !secondLastName.isEmpty,
           let description = descriptionTextField.text, !description.isEmpty,
           let birthDate = birthdayPicker.text, !birthDate.isEmpty,
           let ordinationDate = orditionPicker.text, !ordinationDate.isEmpty,
           let email = emailTextField.text, !email.isEmpty,
           let office = officePicker.text, !office.isEmpty,
           let activities = activitesPicker.text, !activities.isEmpty,
           let url = urlTextField.text, !url.isEmpty
        {
            var birthDate: Date!
            var birthDateFormat: String!
            if birthdayPicker.selectedDate != Date(){
                birthDate = birthdayPicker.selectedDate
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let dateString = dateFormatter.string(from: birthDate)
                birthDateFormat = dateString
            }
            
            var ordinationDate: Date!
            var ordinationDateFormat: String!
            if orditionPicker.selectedDate != Date(){
                ordinationDate = orditionPicker.selectedDate
                let ordinationFormatter = DateFormatter()
                ordinationFormatter.dateFormat = "dd/MM/yyyy"
                let ordinationString = ordinationFormatter.string(from: ordinationDate)
                ordinationDateFormat = ordinationString
            }
            let responseRegister: RegisterPriestRequest = RegisterPriestRequest(userId: userId, name: nameTextField.text ?? "", fatherSurname: firstLastNameTextField.text ?? "", motherSurname: secondLastNameTextField.text ?? "", description: descriptionTextField.text ?? "", birthDate: birthDateFormat, ordinationDate: ordinationDateFormat, email: emailTextField.text ?? "", clergy: officePicker.text ?? "" , activity: activitiesArray, channelStream: urlTextField.text ?? "")
            
            presenter?.postRegisterPriest(request: responseRegister)
        }else{
            let alert = UIAlertController(title: "Campos vacios", message: "Uno o varios campos vacios", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Intenta de nuevo", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
        
        
    }
    
    func showRegisterResponse(response: RegisterPriestResponse) {
        let responseStatus =  response.status
        if responseStatus == "ok"{
            let alert = UIAlertController(title: "App Encuentro", message: "Se guardaron sus datos correctamente", preferredStyle: .alert)
            let accept = UIAlertAction(title: "Aceptar", style: .default, handler: {
                [weak self]
                _ in
                self?.navigationController?.popViewController(animated: true)
            })
            alert.addAction(accept)
            present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "App Encuentro", message: "No se pudieron guardar sus datos, intente mas tarde", preferredStyle: .alert)
            let accept = UIAlertAction(title: "Aceptar", style: .default)
            alert.addAction(accept)
            present(alert, animated: true)
        }
    }
}



extension register_FrameworkViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivitiesCardCollectionViewCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    
}


