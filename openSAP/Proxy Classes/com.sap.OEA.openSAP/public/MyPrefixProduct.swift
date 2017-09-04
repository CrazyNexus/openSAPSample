// # Proxy Compiler 17.5.7-b21522-20170719

import Foundation
import SAPOData

open class MyPrefixProduct: EntityValue {
    public static let category: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Category")

    public static let categoryName: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "CategoryName")

    public static let currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    public static let dimensionDepth: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionDepth")

    public static let dimensionHeight: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionHeight")

    public static let dimensionUnit: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionUnit")

    public static let dimensionWidth: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionWidth")

    public static let longDescription: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "LongDescription")

    public static let name: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Name")

    public static let pictureUrl: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "PictureUrl")

    public static let price: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Price")

    public static let productID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "ProductId")

    public static let quantityUnit: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "QuantityUnit")

    public static let shortDescription: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "ShortDescription")

    public static let supplierID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierId")

    public static let updatedTimestamp: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "UpdatedTimestamp")

    public static let weight: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Weight")

    public static let weightUnit: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "WeightUnit")

    public static let stockDetails: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "StockDetails")

    public static let supplierDetails: Property = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierDetails")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixProduct> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixProduct>())
    }

    open var category: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.category))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.category, to: StringValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.categoryName))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixProduct {
        return CastRequired<MyPrefixProduct>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.currencyCode))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var dimensionDepth: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixProduct.dimensionDepth))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.dimensionDepth, to: DecimalValue.of(optional: value))
        }
    }

    open var dimensionHeight: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixProduct.dimensionHeight))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.dimensionHeight, to: DecimalValue.of(optional: value))
        }
    }

    open var dimensionUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.dimensionUnit))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.dimensionUnit, to: StringValue.of(optional: value))
        }
    }

    open var dimensionWidth: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixProduct.dimensionWidth))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.dimensionWidth, to: DecimalValue.of(optional: value))
        }
    }

    open class func key(productID: String) -> EntityKey {
        return EntityKey().with(name: "ProductId", value: StringValue.of(productID))
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.longDescription))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.longDescription, to: StringValue.of(optional: value))
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.name))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.name, to: StringValue.of(optional: value))
        }
    }

    open var old: MyPrefixProduct {
        get {
            return CastRequired<MyPrefixProduct>.from(self.oldEntity)
        }
    }

    open var pictureUrl: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.pictureUrl))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.pictureUrl, to: StringValue.of(optional: value))
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixProduct.price))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.price, to: DecimalValue.of(optional: value))
        }
    }

    open var productID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MyPrefixProduct.productID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.productID, to: StringValue.of(value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.quantityUnit))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.shortDescription))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.shortDescription, to: StringValue.of(optional: value))
        }
    }

    open var stockDetails: MyPrefixStock {
        get {
            return CastRequired<MyPrefixStock>.from(self.dataValue(for: MyPrefixProduct.stockDetails))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.stockDetails, to: value)
        }
    }

    open var supplierDetails: MyPrefixSupplier {
        get {
            return CastRequired<MyPrefixSupplier>.from(self.dataValue(for: MyPrefixProduct.supplierDetails))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.supplierDetails, to: value)
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.supplierID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.dataValue(for: MyPrefixProduct.updatedTimestamp))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.updatedTimestamp, to: value)
        }
    }

    open var weight: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixProduct.weight))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.weight, to: DecimalValue.of(optional: value))
        }
    }

    open var weightUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixProduct.weightUnit))
        }
        set(value) {
            self.setDataValue(for: MyPrefixProduct.weightUnit, to: StringValue.of(optional: value))
        }
    }
}
