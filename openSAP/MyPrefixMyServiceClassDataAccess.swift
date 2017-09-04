//
// MyPrefixMyServiceClassDataAccess.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import Foundation
import SAPCommon
import SAPFoundation
import SAPOData

class MyPrefixMyServiceClassDataAccess {

    let service: MyPrefixMyServiceClass<OnlineODataProvider>
    private let logger = Logger.shared(named: "ServiceDataAccessLogger")

    init(urlSession: SAPURLSession) {
        let odataProvider = OnlineODataProvider(serviceName: "MyPrefixMyServiceClass", serviceRoot: Constants.appUrl, sapURLSession: urlSession)

        // Disables version validation of the backend OData service
        // TODO: Should only be used in demo and test applications
        odataProvider.serviceOptions.checkVersion = false

        self.service = MyPrefixMyServiceClass(provider: odataProvider)

        // To update entity force to use X-HTTP-Method header
        self.service.provider.networkOptions.tunneledMethods.append("MERGE")
    }

    func loadMyPrefixPurchaseOrderHeaders(completionHandler: @escaping([MyPrefixPurchaseOrderHeader]?, Error?) -> ()) {
        self.executeRequest(self.service.purchaseOrderHeaders, completionHandler)
    }

    func loadMyPrefixPurchaseOrderItems(completionHandler: @escaping([MyPrefixPurchaseOrderItem]?, Error?) -> ()) {
        self.executeRequest(self.service.purchaseOrderItems, completionHandler)
    }

    func loadMyPrefixProductTexts(completionHandler: @escaping([MyPrefixProductText]?, Error?) -> ()) {
        self.executeRequest(self.service.productTexts, completionHandler)
    }

    func loadMyPrefixCustomers(completionHandler: @escaping([MyPrefixCustomer]?, Error?) -> ()) {
        self.executeRequest(self.service.customers, completionHandler)
    }

    func loadMyPrefixProductCategories(completionHandler: @escaping([MyPrefixProductCategory]?, Error?) -> ()) {
        self.executeRequest(self.service.productCategories, completionHandler)
    }

    func loadMyPrefixSuppliers(completionHandler: @escaping([MyPrefixSupplier]?, Error?) -> ()) {
        self.executeRequest(self.service.suppliers, completionHandler)
    }

    func loadMyPrefixSalesOrderItems(completionHandler: @escaping([MyPrefixSalesOrderItem]?, Error?) -> ()) {
        self.executeRequest(self.service.salesOrderItems, completionHandler)
    }

    func loadMyPrefixSalesOrderHeaders(completionHandler: @escaping([MyPrefixSalesOrderHeader]?, Error?) -> ()) {
        self.executeRequest(self.service.salesOrderHeaders, completionHandler)
    }

    func loadMyPrefixStock(completionHandler: @escaping([MyPrefixStock]?, Error?) -> ()) {
        self.executeRequest(self.service.stock, completionHandler)
    }

    func loadMyPrefixProducts(completionHandler: @escaping([MyPrefixProduct]?, Error?) -> ()) {
        self.executeRequest(self.service.products, completionHandler)
    }

    // MARK: - Request execution
    private typealias DataAccessCompletionHandler<Entity> = ([Entity]?, Error?) -> ()
    private typealias DataAccessRequestWithQuery<Entity> = (DataQuery, @escaping DataAccessCompletionHandler<Entity>) -> ()

    /// Helper function to execute a given request.
    /// Provides error logging and extends the query so that it only requests the first 20 items.
    ///
    /// - Parameter request: the request to execute
    private func executeRequest<Entity: EntityValue>(_ request: DataAccessRequestWithQuery<Entity>, _ completionHandler: @escaping DataAccessCompletionHandler<Entity>) {

        // Only request the first 20 values
        let query = DataQuery().selectAll().top(20)

        request(query) { (result, error) in
            guard let result = result else {
                let error = error!
                self.logger.error("Error happened in the downloading process.", error: error)
                completionHandler(nil, error)
                return
            }
            completionHandler(result, nil)
        }
    }
}
