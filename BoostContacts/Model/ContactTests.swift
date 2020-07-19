//
//  ContactTests.swift
//  BoostContactsTests
//
//  Created by Faiz Mokhtar on 19/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import XCTest
@testable import BoostContacts

class ContactTests: XCTestCase {

    var decoder: JSONDecoder!

    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
    }

    override func tearDown() {
        decoder = nil
        super.tearDown()
    }

    func test_givenAllFields_itShouldBeAbleToDecode() throws {
        let input = """
            {
                "id": "5c8a80f52dfee238898d64cf",
                "firstName": "Phoebe",
                "lastName": "Monroe",
                "email": "phoebemonroe@furnafix.com",
                "phone": "(903) 553-3410"
            }
        """.data(using: .utf8)!

        let result = try decoder.decode(Contact.self, from: input)

        XCTAssertNotNil(result)
    }

    func test_givenMandatoryFields_itShouldBeAbleToDecode() throws {
        let input = """
            {
                "id": "5c8a80f52dfee238898d64cf",
                "firstName": "Phoebe",
                "lastName": "Monroe",
            }
        """.data(using: .utf8)!

        let result = try decoder.decode(Contact.self, from: input)

        XCTAssertNotNil(result)
    }
}
