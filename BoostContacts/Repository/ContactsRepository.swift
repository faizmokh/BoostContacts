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
    func update(contact: Contact)
}

class ContactsRepository: ContactsRepositorable {

    private let filepath: URL
    private let decoder: JSONDecoder

    private var contacts: [Contact]

    init(
        contacts: [Contact] = [],
        filepath: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json"),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.contacts = contacts
        self.filepath = filepath
        self.decoder = decoder
        self.loadContacts()
    }

    func getAllContacts() -> [Contact] {
        return contacts
    }

    func update(contact: Contact) {
        if let row = self.contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[row] = contact
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: contacts, options: .prettyPrinted)
            try data.write(to: filepath, options: [])
        } catch {
            print(error)
        }
    }

    func loadContacts() {
        let from = Bundle.main.url(forResource: "data", withExtension: "json")!
        do {
            if !FileManager.default.fileExists(atPath: filepath.path) {
                try FileManager.default.copyItem(at: from, to: filepath)
            }
            let data = try Data(contentsOf: filepath)
            let contacts = try decoder.decode([Contact].self, from: data)
            self.contacts = contacts
        } catch {
            print(error)
        }
    }
}
