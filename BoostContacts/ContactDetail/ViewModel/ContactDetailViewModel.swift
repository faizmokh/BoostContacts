//
//  ContactDetailViewModel.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

class ContactDetailViewModel {

    private var contact: Contact

    // MARK: - Init

    init(contact: Contact) {
        self.contact = contact
    }

    enum FormField {
        case firstName
        case lastName
        case email
        case phone

        var title: String {
            switch self {
            case .firstName:
                return "First Name"
            case .lastName:
                return "Last Name"
            case .email:
                return "Email"
            case .phone:
                return "Phone"
            }
        }
    }
}
