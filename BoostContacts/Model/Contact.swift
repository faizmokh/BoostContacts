//
//  Contact.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 19/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

struct Contact: Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String?
    let phone: String?
}
