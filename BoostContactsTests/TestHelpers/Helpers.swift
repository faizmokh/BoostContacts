//
//  Helpers.swift
//  BoostContactsTests
//
//  Created by Faiz Mokhtar on 22/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation
@testable import BoostContacts

class Helpers {
    static func makeContact(firstName: String, lastName: String, id: String? = nil,
                             email: String? = nil, phone: String? = nil) -> Contact {
        return Contact(id: id, firstName: firstName, lastName: lastName, email: email, phone: phone)
    }
}
