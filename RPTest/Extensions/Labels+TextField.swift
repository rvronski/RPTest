//
//  Labels+TextField.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class InfoLabels: UILabel {
    init(inform: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        super.init(frame: .zero)
        text = inform
        textColor = color
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: size, weight: weight)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class searchTextField: UITextField {
    init(placeholderText: String) {
        super.init(frame: .zero)
        placeholder = placeholderText
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        layer.cornerRadius = 15
        autocapitalizationType = .none
        backgroundColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        leftView = paddingView
        leftViewMode = .always
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
