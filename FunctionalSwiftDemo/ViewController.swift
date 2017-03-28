//
//  ViewController.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// Shows info about a payment method
    @IBOutlet weak var paymentInfoView1: PaymentInfoView!

    /// Shows info about a payment method
    @IBOutlet weak var paymentInfoView2: PaymentInfoView!

    override func viewDidLoad() {

        super.viewDidLoad()
        showPaymentMethod1()
        showPaymentMethod2()
    }

    private func showPaymentMethod1() {

        let paymentmethod = OOP_PaymentMethod(.Mastercard)
        paymentInfoView1.showPaymentInformation(paymentMethod: paymentmethod)
    }


    private func showPaymentMethod2() {

        paymentInfoView2.showPaymentInformation(paymentDisplayData: CreditCardType.Discover.displayInformation)
    }
}

