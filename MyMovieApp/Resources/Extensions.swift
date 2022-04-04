//
//  Extensions.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 4/04/22.
//

import UIKit

extension UIButton {
    func cornerButton() {
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.blue
    }
}

