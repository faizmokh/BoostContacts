//
//  ContactListCell.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            profileImageView.backgroundColor = .systemOrange
        }
    }

    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .preferredFont(forTextStyle: .body)
        }
    }
}
