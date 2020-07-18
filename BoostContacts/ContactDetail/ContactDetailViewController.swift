//
//  ContactDetailViewController.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

enum DetailSection: Int {
    case header = 0
    case mainInfo
    case subInfo
}

class ContactDetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.allowsSelection = false
            tableView.register(UINib(nibName: "ContactPhotoCell", bundle: nil), forCellReuseIdentifier: "ContactPhotoCell")
            tableView.register(UINib(nibName: "ContactFormCell", bundle: nil), forCellReuseIdentifier: "ContactFormCell")
        }
    }
    lazy var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(didTappedCancelButton))
        button.tintColor = .systemOrange
        return button
    }()

    lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(didTappedSaveButton))
        button.tintColor = .systemOrange
        return button
    }()

    // MARK: - Properties

    let viewModel: ContactDetailViewModel

    // MARK: - Inits

    init(viewModel: ContactDetailViewModel = ContactDetailViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
    }

    // MARK: - Actions

    @objc func didTappedCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func didTappedSaveButton() {
        // TODO: Save contact
    }
}

extension ContactDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch DetailSection(rawValue: section) {
        case .header:
            return 1
        default:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch DetailSection(rawValue: indexPath.section) {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactPhotoCell", for: indexPath) as! ContactPhotoCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactFormCell", for: indexPath) as! ContactFormCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch DetailSection(rawValue: section) {
        case .mainInfo:
            return "Main Information"
        case .subInfo:
            return "Sub Information"
        default:
            return nil
        }
    }
}

extension ContactDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch DetailSection(rawValue: indexPath.section) {
        case .header:
            return 100
        default:
            return 50
        }
    }
}
