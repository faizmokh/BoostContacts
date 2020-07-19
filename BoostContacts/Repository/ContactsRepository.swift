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

    private let path: URL
    private let decoder: JSONDecoder

    private var contacts: [Contact]

    init(
        contacts: [Contact] = [],
        path: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0],
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.contacts = contacts
        self.path = path
        self.decoder = decoder
    }

    func getAllContacts() -> [Contact] {
        let filepath = path.appendingPathComponent("data.json")
        do {
            let data = try Data(contentsOf: filepath)
            let contacts = try decoder.decode([Contact].self, from: data)
            return contacts
        } catch {
            return []
        }
    }

    func update(contact: Contact) -> Contact {
        return contact
    }
}
