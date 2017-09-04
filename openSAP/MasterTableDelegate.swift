//
// MasterTableDelegate.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import Foundation
import SAPOData
import SAPFiori

protocol MasterTableDelegate: UITableViewDelegate, UITableViewDataSource {
    var entities: [EntityValue] { get set }

    func requestEntities(completionHandler: @escaping(Error?) -> Void)

    weak var notifier: Notifier? { get set }
}

extension MasterTableDelegate {

    func cellWithNonEditableContent(tableView: UITableView, indexPath: IndexPath, key: String, value: String) -> FUIObjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as! FUIObjectTableViewCell
        cell.headlineText = value
        cell.footnoteText = key
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MasterViewController {

    func generatedTableDelegate() -> MasterTableDelegate? {
        switch collectionType {
        case .myPrefixPurchaseOrderHeaders:
            return MyPrefixPurchaseOrderHeadersMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixPurchaseOrderItems:
            return MyPrefixPurchaseOrderItemsMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixProductTexts:
            return MyPrefixProductTextsMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixCustomers:
            return MyPrefixCustomersMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixProductCategories:
            return MyPrefixProductCategoriesMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixSuppliers:
            return MyPrefixSuppliersMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixSalesOrderItems:
            return MyPrefixSalesOrderItemsMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixSalesOrderHeaders:
            return MyPrefixSalesOrderHeadersMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixStock:
            return MyPrefixStockMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        case .myPrefixProducts:
            return MyPrefixProductsMasterTableDelegate(dataAccess: self.myPrefixMyServiceClass)
        default:
            return nil
        }
    }
}
