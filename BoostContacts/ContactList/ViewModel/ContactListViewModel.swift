//
//  ContactListViewModel.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation
import Combine

class ContactListViewModel: ObservableObject {

    @Published var contacts: [Contact]

    let repository: ContactsRepositorable

    init(repository: ContactsRepositorable = ContactsRepository(),
         contacts: [Contact] = []) {
        self.repository = repository
        self.contacts = contacts
    }

    func getAllContacts() {
        self.contacts = repository.getAllContacts()
    }
}
