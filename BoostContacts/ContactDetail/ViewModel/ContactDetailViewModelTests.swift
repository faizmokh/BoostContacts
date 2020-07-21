//
//  ContactDetailViewModelTests.swift
//  BoostContactsTests
//
//  Created by Faiz Mokhtar on 22/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import XCTest
@testable import BoostContacts

class ContactDetailViewModelTests: XCTestCase {

    var repositorySpy: ContactRepositorySpy!

    override func setUp() {
        super.setUp()
        repositorySpy = ContactRepositorySpy()
    }

    override func tearDown() {
        repositorySpy = nil
        super.tearDown()
    }

    func testContactDetailViewModel_givenAllFieldsAreMissing_OnSave_ItShouldNotBeAbleToUpdateContact() {
        let contact = Contact(id: nil, firstName: "", lastName: "", email: nil, phone: nil)
        let sut = ContactDetailViewModel(contact: contact, repository: repositorySpy)

        sut.save()

        XCTAssertFalse(repositorySpy.isUpdateCalled, "it should not be able to update contact")
    }

    func testContactDetailViewModel_givenFirstNameLastNameEmpty_OnSave_ItShouldBeAbleToUpdate() {
        let contact = Contact(id: nil, firstName: "tom", lastName: "riddle", email: nil, phone: nil)
        let sut = ContactDetailViewModel(contact: contact, repository: repositorySpy)

        sut.save()

        XCTAssertTrue(repositorySpy.isUpdateCalled, "it should be able to update contact")
    }

    func testContactDetailViewModel_givenFirstNameLastNameEmpty_OnSave_ItShouldNotBeAbleToUpdate() {
        let contact = Contact(id: nil, firstName: "tom", lastName: "", email: "tom@hogwarts.com", phone: nil)
        let sut = ContactDetailViewModel(contact: contact, repository: repositorySpy)

        sut.save()

        XCTAssertFalse(repositorySpy.isUpdateCalled, "it should not be able to update contact")
    }

    func testContactDetailViewModel_givenAllFields_OnSave_ItShouldBeAbleToUpdate() {
        let contact = Contact(id: "voldemort1", firstName: "tom", lastName: "riddle", email: "tom@hogwarts.com", phone: "1234")
        let sut = ContactDetailViewModel(contact: contact, repository: repositorySpy)

        sut.save()

        XCTAssertTrue(repositorySpy.isUpdateCalled, "it should not be able to update contact")
    }


    // MARK: - Test Doubles

    class ContactRepositorySpy: ContactsRepositorable {

        var isGetAllContactsCalled = false
        var isUpdateCalled = false

        func getAllContacts() -> [Contact] {
            isUpdateCalled = true
            return []
        }

        func update(contact: Contact) {
            isUpdateCalled = true
        }
    }
}
