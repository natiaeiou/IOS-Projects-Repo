//
//  MainFlowCoordinator.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//

import Foundation
import UIKit

protocol AppFlowCoordinator: AnyObject {
    func showDetail(for movie: Movie)
    func showPoster(for movie: Movie)
}

protocol DetailNavigation: AnyObject {
    func showPoster(for movie: Movie)
}
