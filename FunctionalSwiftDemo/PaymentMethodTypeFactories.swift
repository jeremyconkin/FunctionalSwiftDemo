//
//  PaymentMethodTypeFactories.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation

/// Card type and a corresponding regex matching string
private typealias CardTypeWithRegExString = (cardType:CreditCardType, regExString: String)

/// Array of all card types and matching regExes
private let cardTypeToRegExString: [CardTypeWithRegExString] = [
    CardTypeWithRegExString(.Discover,   "^6(?:011|5[0-9]{2})[0-9]{3,}$"),
    CardTypeWithRegExString(.Amex,       "^3[47][0-9]{5,}$"),
    CardTypeWithRegExString(.Visa,       "^4[0-9]{6,}([0-9]{3})?$"),
    CardTypeWithRegExString(.Mastercard, "^(5[1-5][0-9]{4}|677189)[0-9]{5,}$")
    ]

/// Error or credit card type for the given card number and cardType/regEx pair
///
/// - Parameters:
///   - cardNumber: String of a sample credit card number
///   - cardRegExPair: Card type and matching regEx
/// - Returns: Result with the card type if successful. Error otherwise.
private func cardResultMatchingNumber(cardNumber: String, cardRegExPair: CardTypeWithRegExString) -> Result<CreditCardType> {

    let regEx = try! NSRegularExpression(pattern: cardRegExPair.regExString, options: [.caseInsensitive])
    let match = regEx.firstMatch(in: cardNumber,
                                 options: [],
                                 range: NSMakeRange(0, cardNumber.characters.count))
    switch match {
    case .some(_):
        return .Success(cardRegExPair.cardType)
    case .none:
        return Result<CreditCardType>.Failure(NSError(domain: "Credit card type \(cardRegExPair.cardType.name) for \(cardNumber) doesn't match", code: 19))
    }
}

/// Card type for the corresponding credit card number
///
/// - Parameter cardNumber: Credit card number as string
/// - Returns: Result with the card type if successful. Error otherwise.
public func cardTypeForNumber(cardNumber: String) -> Result<CreditCardType> {

    // NORMALLY WE WOULD CURRY HERE!
    let matchingCardTypes = cardTypeToRegExString.map {
        cardResultMatchingNumber(cardNumber: cardNumber, cardRegExPair: $0)
        }.filter() {
            isSuccessful($0)
        }

    // Return
    switch matchingCardTypes.first {
    case .some(let value):
        return value
    default:
        return Result<CreditCardType>.Failure(NSError(domain: "Credit card type not found for \(cardNumber)", code: 21))
    }
}

/// Payment method that corresponds to the given account or credit card number
///
/// - Parameter number: Number for a credit card or financial institution
/// - Returns: Payment method type or error
public func paymentTypeForNumber(number: String) -> Result<PaymentMethodType> {

    let creditCardResult = cardTypeForNumber(cardNumber: number)
    switch creditCardResult {
    case .Success(let value):
        return .Success(PaymentMethodType.CreditCard(value))
    case .Failure(let error):
        return Result<PaymentMethodType>.Failure(error)
    }
}
