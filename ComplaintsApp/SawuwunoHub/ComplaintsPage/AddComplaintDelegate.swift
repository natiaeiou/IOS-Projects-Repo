//
//  AddComplaintDelegate.swift
//  SawuwunoHub
//
//  Created by Atinati on 15.10.25.
//


import UIKit

protocol AddComplaintDelegate: AnyObject {
    func didAddNewComplaint(_ complaint: Complaint)
}

enum IconOption: CaseIterable {
    case redDefault
    case purple
    case green
    case yellow
    
    var assetName: String {
        switch self {
        case .redDefault:
            return "redIcon"
        case .purple:
            return "purpleIcon"
        case .green: 
            return "greenIcon"
        case .yellow: 
            return "yellowIcon"
        }
    }
}

struct Complaint {
    let title: String
    let description: String
    let iconChoice: IconOption
    var assetName: String {
        return iconChoice.assetName
    }
}
