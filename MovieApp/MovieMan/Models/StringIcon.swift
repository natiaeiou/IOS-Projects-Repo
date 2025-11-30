//
//  StringIcon.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

extension String {
    func prefixedWithIcon(iconName: String, iconSize: CGFloat, verticalOffset: CGFloat = -2) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: iconName)
        attachment.bounds = CGRect(x: 0, y: verticalOffset, width: iconSize, height: iconSize)
        let iconString = NSAttributedString(attachment: attachment)
        let finalString = NSMutableAttributedString()
        finalString.append(iconString)
        finalString.append(NSAttributedString(string: " " + self))
        return finalString
    }
}
