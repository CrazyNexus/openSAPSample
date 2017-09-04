// # Proxy Compiler 17.5.7-b21522-20170719

import Foundation
import SAPOData

open class MyPrefixMyServiceClass<Provider: DataServiceProvider>: DataService<Provider> {

    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = MyPrefixMyServiceClassMetadata.document
    }

    open func customers(query: DataQuery = DataQuery()) throws -> Array<MyPrefixCustomer> {
        return try MyPrefixCustomer.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.customers)).entityList())
    }

    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixCustomer>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixCustomer> = try self.customers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.generateSamplePurcharOrders, ParameterList.empty)).result)
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery(), completionHandler: @escaping(Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Bool? = try self.generateSamplePurcharOrders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty)).result)
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery(), completionHandler: @escaping(Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Bool? = try self.generateSampleSalesOrders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productCategories(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductCategory> {
        return try MyPrefixProductCategory.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.productCategories)).entityList())
    }

    open func productCategories(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixProductCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixProductCategory> = try self.productCategories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productTexts(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductText> {
        return try MyPrefixProductText.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.productTexts)).entityList())
    }

    open func productTexts(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixProductText>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixProductText> = try self.productTexts(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func products(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProduct> {
        return try MyPrefixProduct.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.products)).entityList())
    }

    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixProduct>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixProduct> = try self.products(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func purchaseOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderHeader> {
        return try MyPrefixPurchaseOrderHeader.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderHeaders)).entityList())
    }

    open func purchaseOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixPurchaseOrderHeader>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixPurchaseOrderHeader> = try self.purchaseOrderHeaders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func purchaseOrderItems(query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderItem> {
        return try MyPrefixPurchaseOrderItem.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderItems)).entityList())
    }

    open func purchaseOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixPurchaseOrderItem>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixPurchaseOrderItem> = try self.purchaseOrderItems(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func resetSampleData(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.resetSampleData, ParameterList.empty)).result)
    }

    open func resetSampleData(query: DataQuery = DataQuery(), completionHandler: @escaping(Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Bool? = try self.resetSampleData(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderHeader> {
        return try MyPrefixSalesOrderHeader.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.salesOrderHeaders)).entityList())
    }

    open func salesOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixSalesOrderHeader>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixSalesOrderHeader> = try self.salesOrderHeaders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderItems(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderItem> {
        return try MyPrefixSalesOrderItem.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.salesOrderItems)).entityList())
    }

    open func salesOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixSalesOrderItem>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixSalesOrderItem> = try self.salesOrderItems(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func stock(query: DataQuery = DataQuery()) throws -> Array<MyPrefixStock> {
        return try MyPrefixStock.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.stock)).entityList())
    }

    open func stock(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixStock>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixStock> = try self.stock(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSupplier> {
        return try MyPrefixSupplier.array(from: self.executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.suppliers)).entityList())
    }

    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<MyPrefixSupplier>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<MyPrefixSupplier> = try self.suppliers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.updateSalesOrderStatus, ParameterList(capacity: (2 as Int)).with(name: "id", value: StringValue.of(id)).with(name: "newStatus", value: StringValue.of(newStatus)))).result)
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery = DataQuery(), completionHandler: @escaping(Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Bool? = try self.updateSalesOrderStatus(id: id, newStatus: newStatus, query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
