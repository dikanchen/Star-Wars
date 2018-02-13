//
//  Extension.swift
//  LoginExample
//
//  Created by User on 2/9/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import Foundation

extension String{
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z,_%+-]+@[A-Za-z0-9,-]+\\.[A-Za-z]{2,}"
        let emailText = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailText.evaluate(with:self)
    }
}
