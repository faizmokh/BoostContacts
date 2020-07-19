//
//  ContactFormCell.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ContactFormCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var formTextField: UITextField!

    var valueCompletion: ((String?) -> Void)?

    func setup(title: String, value: String) {
        self.titleLabel.text = title
        self.formTextField.text = value
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.formTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChanged(_ textField: UITextField) {
        self.valueCompletion?(textField.text)
    }
}
