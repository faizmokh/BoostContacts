//
//  ContactDetailViewModel.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

class ContactDetailViewModel: ObservableObject {

    // MARK: - Properties

    @Published var contact: Contact

    var firstName: String
    var lastName: String
    var email: String?
    var phone: String?

    // MARK: - Init

    init(contact: Contact) {
        self.contact = contact
        self.firstName = contact.firstName
        self.lastName = contact.lastName
        self.email = contact.email
        self.phone = contact.phone
    }
}
