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

    private var contacts: [Contact]

    init(
        contacts: [Contact] = [],
        filepath: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json")
    ) {
        self.contacts = contacts
        self.filepath = filepath
        do {
            self.contacts = try loadContacts()
        } catch { error
            print(error.localizedDescription)
        }
    }

    func getAllContacts() -> [Contact] {
        do {
            contacts = try loadContacts()
        } catch {
            print(error)
        }
        return contacts
    }

    func update(contact: Contact) {
        if let row = self.contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[row] = contact
        }

        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(contacts)
            try data.write(to: filepath, options: [])
        } catch {
            print(error)
        }
    }

    func loadContacts() throws -> [Contact] {
        let from = Bundle.main.url(forResource: "data", withExtension: "json")!
        if !FileManager.default.fileExists(atPath: filepath.path) {
            try FileManager.default.copyItem(at: from, to: filepath)
        }
        let data = try Data(contentsOf: filepath)
        let contacts = try JSONDecoder().decode([Contact].self, from: data)
        return contacts
    }
}
