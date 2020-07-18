//
//  ContactListViewController.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "ContactListCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "ContactListCell")
            tableView.rowHeight = 70
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTappedAddButton))
        button.tintColor = .systemOrange
        return button
    }()

    // MARK: - Properties

    let viewModel: ContactListViewModel

    // MARK: - Inits

    init(viewModel: ContactListViewModel = ContactListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        self.navigationItem.rightBarButtonItem = addButton
    }

    // MARK: - Actions

    @objc func didTappedAddButton() {
        // TODO: Navigate to add screen
    }
}

// MARK: - ContactListViewController Data Sources

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as! ContactListCell
        return cell
    }
}

// MARK: - ContactListViewController Delegates

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
