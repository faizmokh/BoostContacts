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

    let repository: ContactsRepositorable

    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?

    // MARK: - Init

    init(contact: Contact,
         repository: ContactsRepositorable = ContactsRepository()) {
        self.contact = contact
        self.repository = repository
        self.firstName = contact.firstName
        self.lastName = contact.lastName
        self.email = contact.email
        self.phone = contact.phone
    }

    func save() {
        guard let firstName = firstName, let lastName = lastName else { return }
        let newContact = Contact(id: contact.id, firstName: firstName, lastName: lastName, email: email, phone: phone)
        repository.update(contact: newContact)
    }
}
