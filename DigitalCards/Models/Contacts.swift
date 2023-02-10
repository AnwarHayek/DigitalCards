//
//  Contacts.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 06/02/2023.
//

import Foundation
import UIKit

struct Contacts {
    var alphabet: String?
    var contacts: [Contact] = []

    static func > (next: Contacts, previous: Contacts) -> Bool {
        if let alphabetPrevious = previous.alphabet, let alphabetNext = next.alphabet {
            return alphabetPrevious > alphabetNext
        }
        return false
    }

}

struct Contact {
    var name: String?
    let image: UIImage? = demo
    var isHiddenCard: Bool = true
}
