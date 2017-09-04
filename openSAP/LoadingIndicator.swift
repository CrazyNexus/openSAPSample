//
// LoadingIndicator.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import Foundation
import SAPFiori

protocol LoadingIndicator: class {
    var loadingIndicator: FUILoadingIndicatorView? { get set }
}

extension LoadingIndicator where Self: UIViewController {

    func showIndicator(_ message: String = "") {
        DispatchQueue.main.async {
            let indicator = FUILoadingIndicatorView(frame: self.view.frame)
            indicator.text = message
            self.view.addSubview(indicator)
            indicator.show()
            self.loadingIndicator = indicator
        }
    }

    func hideIndicator() {
        DispatchQueue.main.async {
            guard let loadingIndicator = self.loadingIndicator else {
                return
            }
            loadingIndicator.dismiss()
        }
    }
}
