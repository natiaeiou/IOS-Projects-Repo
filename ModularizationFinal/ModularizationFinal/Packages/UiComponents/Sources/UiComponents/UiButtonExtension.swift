//
//  UiButtonExtension.swift
//  CommonUiComponentsLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit

public class RoundButton: UIButton {
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}

public extension UIButton {
    static func make(imageName: String) -> UIButton {
        let button = RoundButton()
        var config = UIButton.Configuration.plain()
        config.background.imageContentMode = .scaleAspectFill
        config.image = UIImage(named: imageName)
        config.baseForegroundColor = .label
        config.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7)
        button.configuration = config
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        return button
    }
}
