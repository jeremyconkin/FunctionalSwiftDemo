//
//  AccountNumbersViewController.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/28/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation
import UIKit

class AccountNumbersViewController: UIViewController {

    @IBOutlet weak var accountNumberTextField: UITextField!

    @IBOutlet weak var paymentTypeImageView: UIImageView!

    @IBAction func didTapShowPaymentTypeButton() {

        let imageResult = accountNumberTextField.text.map(paymentTypeForNumber)?.flatMap(paymentImage)

        let imageUnwrapped:UIImage? = {
            switch imageResult {
            case .some(let result):
                return {switch result {
                        case .Success(let image):
                            return image
                        default:
                            return nil
                    }}()
            default:
                return nil
            }
        }()

        paymentTypeImageView.image = imageUnwrapped
    }
}
