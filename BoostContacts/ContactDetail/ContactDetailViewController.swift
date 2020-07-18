//
//  ContactDetailViewController.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    // MARK: - Outlets

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
