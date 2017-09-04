//
// MyPrefixProductTextsMasterTableDelegate.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//
import Foundation
import SAPFoundation
import SAPOData
import SAPCommon

class MyPrefixProductTextsMasterTableDelegate: NSObject, MasterTableDelegate {
    private let dataAccess: MyPrefixMyServiceClassDataAccess
    weak var notifier: Notifier?
    private let logger = Logger.shared(named: "MasterTableDelegateLogger")

    private var _entities: [MyPrefixProductText] = [MyPrefixProductText]()
    var entities: [EntityValue] {
        get {
            return _entities
        }
        set {
            self._entities = newValue as! [MyPrefixProductText]
        }
    }

    init(dataAccess: MyPrefixMyServiceClassDataAccess) {
        self.dataAccess = dataAccess
    }

    func requestEntities(completionHandler: @escaping(Error?) -> ()) {
        self.dataAccess.loadMyPrefixProductTexts() { (myprefixproducttexts, error) in
            guard let myprefixproducttexts = myprefixproducttexts else {
                completionHandler(error!)
                return
            }
            self.entities = myprefixproducttexts
            completionHandler(nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._entities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myprefixproducttext = self.entities[indexPath.row] as! MyPrefixProductText
        let cell = cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "Id", value: "\(myprefixproducttext.id)")
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = self._entities[indexPath.row]
        self.dataAccess.service.deleteEntity(currentEntity) { error in
            if let error = error {
                self.logger.error("Delete entry failed.", error: error)
                self.notifier?.displayAlert(title: NSLocalizedString("keyErrorDeletingEntryTitle",
                    value: "Delete entry failed",
                    comment: "XTIT: Title of deleting entry error pop up."),
                message: error.localizedDescription)
                return
            }
            self._entities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
