//
//  DataCollectionCollectionViewCell.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit

protocol DataCollectionDelegate {
    func showResults()
}

class DataCollectionCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    var delegate: DataCollectionDelegate?
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 5
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        birthDateTextField.delegate = self
        birthDateTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        // Initialization code
    }
    
    @objc func textDidChange(textField: UITextField) {

        guard let birthday = birthDateTextField.text, let name = nameTextField.text else {
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"

    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case birthDateTextField:

            let picker : UIDatePicker = UIDatePicker()
            picker.datePickerMode = UIDatePicker.Mode.date
            picker.addTarget(self, action: #selector(birthdayDateChanged(sender:)), for: UIControl.Event.valueChanged)
            let pickerSize : CGSize = picker.sizeThatFits(CGSize.zero)
            picker.frame = CGRect(x:0.0, y:picker.frame.height + 20, width:self.frame.width, height:picker.frame.height + 20)
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.bordered, target: self, action: Selector(("setBirthdate")))
            toolbar.setItems([spaceButton,doneButton], animated: false)
            
            birthDateTextField.inputAccessoryView = toolbar
            birthDateTextField.inputView = picker
        default:
            break
        }
    }

    @objc func birthdayDateChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, d, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        self.birthDateTextField.text = (dateFormatter.string(from: sender.date))

        print("sender date: <\(sender.date)>")
        guard let birthday = birthDateTextField.text else {
            return
        }
    }
    
    @objc func setBirthdate() {
        if (!(self.birthDateTextField.text)!.isEmpty) {
            DataManager.shared.user.birthdate = self.birthDateTextField.text
            DataManager.shared.user.name = self.nameTextField.text
            self.endEditing(true)
            self.scrollToResults(Any.self)
        }
    }

    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            DataManager.shared.user.name = self.nameTextField.text
            self.birthDateTextField.becomeFirstResponder()
        } else if textField == self.birthDateTextField {
            self.birthDateTextField.resignFirstResponder()
            print("run transition command here")
        }
        return true
    }

}

extension DataCollectionCollectionViewCell {
    @IBAction func scrollToResults(_ sender: Any) {
        delegate?.showResults()
    }
}
