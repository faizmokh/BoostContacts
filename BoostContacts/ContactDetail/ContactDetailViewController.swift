//
//  ContactDetailViewController.swift
//  BoostContacts
//
//  Created by Faiz Mokhtar on 18/07/2020.
//  Copyright © 2020 Faiz Mokhtar. All rights reserved.
//

import UIKit
import Combine

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

    private var bindings = Set<AnyCancellable>()

    // MARK: - Inits

    init(viewModel: ContactDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    // MARK: - Actions

    @objc func didTappedCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func didTappedSaveButton() {
        viewModel.save()
    }

    // MARK: - Privates

    private func setupUI() {
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self, selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        notificationCenter.addObserver(
            self, selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }

    private func setupBindings() {
        viewModel.$contact
            .receive(on: RunLoop.main)
            .sink { contact in
                self.tableView.reloadData()
            }
            .store(in: &bindings)
    }

    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            tableView.contentInset = .zero
        } else {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        tableView.scrollIndicatorInsets = tableView.contentInset
    }
}

// MARK: - ContactDetailViewController Data Sources

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
        case .mainInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactFormCell", for: indexPath) as! ContactFormCell
            if indexPath.row == 0 {
                cell.setup(title: "First Name", value: viewModel.firstName)
                cell.valueCompletion = { [weak self] text in
                    self?.viewModel.firstName = text
                }
            } else {
                cell.setup(title: "Last Name", value: viewModel.lastName)
                cell.valueCompletion = { [weak self] text in
                    self?.viewModel.lastName = text
                }
            }
            return cell
        case .subInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactFormCell", for: indexPath) as! ContactFormCell
            if indexPath.row == 0 {
                cell.setup(title: "Email", value: viewModel.email)
                cell.valueCompletion = { [weak self] text in
                    self?.viewModel.email = text
                }
            } else {
                cell.setup(title: "Phone", value: viewModel.phone)
                cell.valueCompletion = { [weak self] text in
                    self?.viewModel.phone = text
                }
            }
            return cell
        case .none:
            return UITableViewCell()
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

// MARK: - ContactDetailViewController Delegates

extension ContactDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch DetailSection(rawValue: indexPath.section) {
        case .header:
            return 200
        default:
            return 60
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNonzeroMagnitude
        default:
            return 20
        }
    }
}