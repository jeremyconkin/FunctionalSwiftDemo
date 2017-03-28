//
//  PaymentType.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

/// Credit card numbers that pass the regular expression for each type
let testVisa =              "4111111111111111"
let testMasterCard =        "5555555555554444"
let testAmericanExpress =   "378282246310005"
let testDiscover =          "6011111111111117"
let testBadCardNumber =     "0000000000000000"

/// Types of credit cards supported by this application
///
/// - Discover: Discover card
/// - Amex: American Express
/// - Mastercard: Mastercard
/// - Visa: Visa
public enum CreditCardType {
    case Discover
    case Amex
    case Mastercard
    case Visa
}

// MARK: OOP
/// Model that holds payment information in an OOP paradigm
public class OOP_PaymentMethod {

    /// Type of card used for payment
    let creditCardType: CreditCardType

    init(_ creditCardType: CreditCardType) {
        self.creditCardType = creditCardType
    }

    /// Get the credit card description and image
    ///
    /// - Returns: Description/Image tuple
    public func getCardInformation() -> (String, UIImage?) {

        var cardDescription = ""
        var cardImageName = ""

        switch creditCardType {
        case .Discover:
            cardDescription = "Discover"
            cardImageName = "cc_discover"
        case .Amex:
            cardDescription = "Amex"
            cardImageName = "cc_amex"
        case .Mastercard:
            cardDescription = "Mastercard"
            cardImageName = "cc_mastercard"
        case .Visa:
            cardDescription = "Visa"
            cardImageName = "cc_visa"
        }

        return (cardDescription, UIImage(named: cardImageName))
    }
}

// MARK: Functional

/// Get the description of a credit card type
///
/// - Parameter cardType: Card type to describe
/// - Returns: Description pretty print string
public func prettyPrintName(cardType: CreditCardType) -> String {

    switch cardType {
    case .Discover:
        return "Discover"
    case .Amex:
        return "Amex"
    case .Mastercard:
        return "Mastercard"
    case .Visa:
        return "Visa"
    }
}

/// Get the image corresponding to a card type
///
/// - Parameter cardType: Card type
/// - Returns: Image for the given card type
public func cardImage(cardType: CreditCardType) -> UIImage {

    switch cardType {
    case .Discover:
        return #imageLiteral(resourceName: "cc_discover")
    case .Amex:
        return #imageLiteral(resourceName: "cc_amex")
    case .Mastercard:
        return #imageLiteral(resourceName: "cc_mastercard")
    case .Visa:
        return #imageLiteral(resourceName: "cc_visa")
    }
}

/// Serves as a view model for credit card types
public typealias CreditCardDisplayInformation = (description: String, image: UIImage)

extension CreditCardType {

    /// Pretty print name of the card type
    public var name: String {
        return prettyPrintName(cardType: self)
    }

    /// Icon image for the card type
    public var icon: UIImage {
        return cardImage(cardType:self)
    }

    /// Card type name and image
    public var displayInformation: CreditCardDisplayInformation {
        return CreditCardDisplayInformation(name, icon)
    }
}

