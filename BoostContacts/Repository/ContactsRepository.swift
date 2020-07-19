//
//  ContactsRepository.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 19/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

protocol ContactsRepositorable {
    /// Get all contacts
    func getAllContacts() -> [Contact]
    /// Update a contact
    func update(contact: Contact) -> Contact
}

class ContactsRepository: ContactsRepositorable {

    init() {}

    func getAllContacts() -> [Contact] {
        return []
    }

    func update(contact: Contact) -> Contact {
        return contact
    }
}
