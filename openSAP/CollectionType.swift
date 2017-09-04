//
// CollectionType.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import Foundation

enum CollectionType: String {

    case myPrefixPurchaseOrderHeaders = "PurchaseOrderHeaders"
    case myPrefixPurchaseOrderItems = "PurchaseOrderItems"
    case myPrefixProductTexts = "ProductTexts"
    case myPrefixCustomers = "Customers"
    case myPrefixProductCategories = "ProductCategories"
    case myPrefixSuppliers = "Suppliers"
    case myPrefixSalesOrderItems = "SalesOrderItems"
    case myPrefixSalesOrderHeaders = "SalesOrderHeaders"
    case myPrefixStock = "Stock"
    case myPrefixProducts = "Products"
    case none = ""

    private static let all = [
        myPrefixPurchaseOrderHeaders, myPrefixPurchaseOrderItems, myPrefixProductTexts, myPrefixCustomers, myPrefixProductCategories, myPrefixSuppliers, myPrefixSalesOrderItems, myPrefixSalesOrderHeaders, myPrefixStock, myPrefixProducts]

    static let allValues = CollectionType.all.map { (type) -> String in
        return type.rawValue
    }
}
