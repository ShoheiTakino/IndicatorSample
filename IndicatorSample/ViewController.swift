//
//  ViewController.swift
//  IndicatorSample
//
//  Created by 滝野翔平 on 2023/06/10.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBAction
    
    @IBAction private func tappedTurnOnTypeAIndicatorButton() {
        turnOnIndicator(type: .hello)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [self] in
            turnOffIndicator()
        }
    }
    
    @IBAction private func tappedTurnOnTypeBIndicatorButton() {
        turnOnIndicator(type: .goodbye)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [self] in
            turnOffIndicator()
        }
    }
}

