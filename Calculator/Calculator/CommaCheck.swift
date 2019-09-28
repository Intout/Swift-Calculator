//
//  CommaCheck.swift
//  Calculator
//
//  Created by Mert Tecimen on 20.09.2019.
//  Copyright © 2019 Mert Tecimen. All rights reserved.
//

import UIKit

extension String {
    var containsComma: Bool {
        let Comma = ","
        let CommaCheck = NSPredicate(format:"SELF MATCHES %@", Comma)
        return CommaCheck.evaluate(with: self)
    }
}
