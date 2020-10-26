//
//  MenuTextField.swift
//  Duno
//
//  Created by Davi Bispo on 26/10/20.
//

import UIKit

class MenuTextField: UIView {
    
    // MARK: UIOutlets
    public lazy var containerView: UIView = UIView()
    public lazy var mainTextField: UITextField = UITextField()
    
    // MARK: Variables
    private var placeholderText: String = ""
    
    // MARK: Initializers
    init(placeholder: String) {
        super.init(frame: CGRect.zero)
        placeholderText = placeholder
        buildViewHierarchy()
        buildViewConstraints()
        addStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Builders
    func buildViewHierarchy() {
        containerView.addSubview(mainTextField)
        self.addSubview(containerView)
    }
    
    func buildViewConstraints() {
        containerViewConstraints()
        mainTextFieldConstraints()
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func mainTextFieldConstraints() {
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            mainTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
        ])
    }
    
    // MARK: Styles
    func addStyles() {
        containerViewStyles()
        mainTextFieldStyle()
    }
    
    func containerViewStyles() {
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.darkGray.cgColor
        containerView.layer.cornerRadius = 5
    }
    
    func mainTextFieldStyle() {
        mainTextField.placeholder = placeholderText
        mainTextField.textAlignment = .center
    }
}
