//
//  ContactListViewControllerTests.swift
//  BoostContactsTests
//
//  Created by Faiz Mokhtar on 22/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import XCTest
@testable import BoostContacts
class ContactListViewControllerTests: XCTestCase {

    var repositorySpy: ContactRepositorySpy!

    override func setUp() {
        super.setUp()
        repositorySpy = ContactRepositorySpy()
    }

    override func tearDown() {
        repositorySpy = nil
        super.tearDown()
    }

    func testContactListViewController_givenOnLoad_itShouldImmediatelyCalledGetAllContacts() {
        let viewModel = ContactListViewModel(repository: repositorySpy)
        let sut = ContactListViewController(viewModel: viewModel)

        sut.loadViewIfNeeded()

        XCTAssertTrue(repositorySpy.isGetAllContactsCalled, "it should called get all contacts on load")
    }

    func testContactListViewController_givenOnPullToRefresh_itShouldCalledGetAllContacts() {
        let viewModel = ContactListViewModel(repository: repositorySpy)
        let sut = ContactListViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        repositorySpy.isGetAllContactsCalled = false

        sut.didPullToRefresh()

        XCTAssertTrue(repositorySpy.isGetAllContactsCalled, "it should called get all contacts on pull to refresh")
    }

    func testContactListViewController_givenRepositoryReturns2Contacts_tableViewShouldHave2Rows() {
        let contacts = [
            Helpers.makeContact(firstName: "tom", lastName: "riddle"),
            Helpers.makeContact(firstName: "harry", lastName: "potter")
        ]
        let repository = ContactRepositorySpy(getAllContactsResponse: contacts)
        let viewModel = ContactListViewModel(repository: repository)
        let sut = ContactListViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2, "it should have 2 rows of contacts")
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
