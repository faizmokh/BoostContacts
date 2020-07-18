//
//  ContactListCell.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.bounds.size.height / 2
            profileImageView.backgroundColor = .systemOrange
        }
    }

    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .preferredFont(forTextStyle: .body)
        }
    }

    // MARK: - Methods

    func setup(contact: Contact) {
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
    }
}
