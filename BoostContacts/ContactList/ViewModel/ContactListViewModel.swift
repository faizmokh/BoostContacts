//
//  ContactListViewModel.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

class ContactListViewModel {

    let repository: ContactsRepositorable

    init(repository: ContactsRepositorable = ContactsRepository()) {
        self.repository = repository
    }
}
