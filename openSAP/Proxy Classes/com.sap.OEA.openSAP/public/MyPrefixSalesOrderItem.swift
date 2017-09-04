// # Proxy Compiler 17.5.7-b21522-20170719

import Foundation
import SAPOData

open class MyPrefixSalesOrderItem: EntityValue {
    public static let currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")

    public static let deliveryDate: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")

    public static let grossAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")

    public static let itemNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")

    public static let salesOrderID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderId")

    public static let netAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")

    public static let productID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductId")

    public static let quantity: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")

    public static let quantityUnit: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")

    public static let taxAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")

    public static let productDetails: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductDetails")

    public static let header: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Header")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixSalesOrderItem> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixSalesOrderItem>())
    }

    open func copy() -> MyPrefixSalesOrderItem {
        return CastRequired<MyPrefixSalesOrderItem>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.currencyCode))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var deliveryDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.dataValue(for: MyPrefixSalesOrderItem.deliveryDate))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.deliveryDate, to: value)
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.grossAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var header: MyPrefixSalesOrderHeader {
        get {
            return CastRequired<MyPrefixSalesOrderHeader>.from(self.dataValue(for: MyPrefixSalesOrderItem.header))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.header, to: value)
        }
    }

    open var itemNumber: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: MyPrefixSalesOrderItem.itemNumber))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.itemNumber, to: IntValue.of(value))
        }
    }

    open class func key(itemNumber: Int, salesOrderID: String) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(itemNumber)).with(name: "SalesOrderId", value: StringValue.of(salesOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.netAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixSalesOrderItem {
        get {
            return CastRequired<MyPrefixSalesOrderItem>.from(self.oldEntity)
        }
    }

    open var productDetails: MyPrefixProduct {
        get {
            return CastRequired<MyPrefixProduct>.from(self.dataValue(for: MyPrefixSalesOrderItem.productDetails))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.productDetails, to: value)
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.productID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.productID, to: StringValue.of(optional: value))
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.quantity))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.quantityUnit))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var salesOrderID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MyPrefixSalesOrderItem.salesOrderID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.salesOrderID, to: StringValue.of(value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixSalesOrderItem.taxAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSalesOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
