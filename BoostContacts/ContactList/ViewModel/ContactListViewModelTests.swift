//
//  ContactListViewModelTests.swift
//  BoostContactsTests
//
//  Created by Faiz Mokhtar on 22/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import XCTest
import Combine
@testable import BoostContacts

class ContactListViewModelTests: XCTestCase {

    var repositorySpy: ContactRepositorySpy!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        repositorySpy = ContactRepositorySpy()
        cancellables = []
    }

    override func tearDown() {
        repositorySpy = nil
        super.tearDown()
    }

    func testContactListViewModel_getAllContacts_willCallGetAllContactsFromRepository() {
        let sut = ContactListViewModel(repository: repositorySpy)

        sut.getAllContacts()

        XCTAssertTrue(repositorySpy.isGetAllContactsCalled, "get all contacts repository is being called")
    }

    func testContactListViewModel_givenRepositoryIsReturningContacts_PublishedContactsShouldBeTheSame() {
        let contacts = [
            Helpers.makeContact(firstName: "tom", lastName: "riddle"),
            Helpers.makeContact(firstName: "harry", lastName: "potter")
        ]
        let repository = ContactRepositorySpy(getAllContactsResponse: contacts)
        let sut = ContactListViewModel(repository: repository)
        sut.getAllContacts()

        let exp = expectation(description: "expected values")
        sut.$contacts.sink { contacts in
            XCTAssertEqual(contacts.count, 2, "it should publish two contacts")
            exp.fulfill()
        }.store(in: &cancellables)

        wait(for: [exp], timeout: 1)
    }

    // MARK: - Test Doubles

    class ContactRepositorySpy: ContactsRepositorable {

        var isGetAllContactsCalled = false
        var isUpdateCalled = false

        var getAllContactsResponse: [Contact]

        init(getAllContactsResponse: [Contact] = []) {
            self.getAllContactsResponse = getAllContactsResponse
        }

        func getAllContacts() -> [Contact] {
            isGetAllContactsCalled = true
            return getAllContactsResponse
        }

        func update(contact: Contact) {
            isUpdateCalled = true
        }
    }
}
