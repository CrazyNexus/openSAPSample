//
// Constants.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import Foundation
import SAPFoundation

struct Constants {

    static let appId = "com.sap.OEA.openSAP"
    private static let sapcpmsUrlString = "https://hcpms-d041630trial.hanatrial.ondemand.com/"
    static let sapcpmsUrl = URL(string: sapcpmsUrlString)!
    static let appUrl = Constants.sapcpmsUrl.appendingPathComponent(appId)
    static let configurationParameters = SAPcpmsSettingsParameters(backendURL: Constants.sapcpmsUrl, applicationID: Constants.appId)
}
