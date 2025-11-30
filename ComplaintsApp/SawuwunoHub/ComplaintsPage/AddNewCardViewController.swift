//
//  AddNewCardViewController.swift
//  SawuwunoHub
//
//  Created by Atinati on 15.10.25.
//
import UIKit
import SwiftUI

class AddNewCardViewController: UIViewController {
    
    weak var delegate: AddComplaintDelegate?
    private var selectedIconOption: IconOption?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLabelTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "For example: Panic"
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [.foregroundColor: UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)])
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.22, alpha: 1.0)
        textField.textColor = UIColor.white
        textField.layer.cornerRadius = 9
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "For example: I need help with git!"
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [.foregroundColor: UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)])
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.22, alpha: 1.0)
        textField.textColor = UIColor.white
        textField.layer.cornerRadius = 9
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, titleLabelTextField])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var descriptionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [descriptionTitleLabel, descriptionTextField])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var textFieldsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleStack, descriptionStack])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var iconStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var iconSelectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Icon"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0/255, green: 155/255.0, blue: 16/255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupUI()
    }
    
    private func setupUI() {
        setupBackground()
        setupTextFieldsStack()
        setupIconSelection()
        setupAddButton()
        addIconsToStack()
    }
        
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        setupAddButtonConstraints()
    }

    private func setupAddButtonConstraints() {
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 132),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -132),
            addButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func setupBackground() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(backgroundImageView)
    }
    
    private func setupTextFieldsStack() {
        view.addSubview(textFieldsStack)
        NSLayoutConstraint.activate([
            textFieldsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textFieldsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            titleLabelTextField.heightAnchor.constraint(equalToConstant: 45),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupIconSelection() {
        view.addSubview(iconSelectionLabel)
        view.addSubview(iconStackView)
        NSLayoutConstraint.activate([
            iconSelectionLabel.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 40),
            iconSelectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            iconStackView.topAnchor.constraint(equalTo: iconSelectionLabel.bottomAnchor, constant: 10),
            iconStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            iconStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            iconStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func addIconsToStack() {
        let iconOptions = IconOption.allCases
        
        for (index, option) in iconOptions.enumerated() {
            let iconButton = createIconButton(for: option, tag: index)
            iconStackView.addArrangedSubview(iconButton)
            
            if option == .redDefault {
                selectedIconOption = .redDefault
                selectIcon(iconButton)
            }
        }
    }

    private func createIconButton(for option: IconOption, tag: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: option.assetName), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.tag = tag
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(iconTapped(_:)), for: .touchUpInside)
        return button
    }

    private func selectIcon(_ button: UIButton) {
        for view in iconStackView.arrangedSubviews {
            view.layer.borderWidth = 0
            view.layer.borderColor = nil
        }
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.green.cgColor
    }

    
    @objc private func addButtonTapped() {
        guard let title = titleLabelTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty,
              let iconChoice = selectedIconOption else {
            return
        }
        
        let newComplaint = Complaint(title: title, description: description, iconChoice: iconChoice)
        delegate?.didAddNewComplaint(newComplaint)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func iconTapped(_ sender: UIButton) {
        let iconOptions = IconOption.allCases
        let iconIndex = sender.tag
        selectedIconOption = iconOptions[iconIndex]
        for view in iconStackView.arrangedSubviews {
            view.layer.borderWidth = 0
            view.layer.borderColor = nil
        }
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor.green.cgColor
    }
}

#Preview {
    AddNewCardViewController()
}
