//
//  UiImageExtension.swift
//  UiComponents
//
//  Created by Atinati on 08.11.25.
//

import UIKit

public extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
