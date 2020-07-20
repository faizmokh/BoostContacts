//
//  Contact.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 19/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import Foundation

struct Contact: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String?
    let phone: String?

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(phone, forKey: .phone)
    }
}
