// # Proxy Compiler 17.5.7-b21522-20170719

import Foundation
import SAPOData

open class MyPrefixSupplier: EntityValue {
    public static let city: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "City")

    public static let country: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Country")

    public static let emailAddress: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "EmailAddress")

    public static let houseNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "HouseNumber")

    public static let phoneNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "PhoneNumber")

    public static let postalCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "PostalCode")

    public static let street: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Street")

    public static let supplierID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierId")

    public static let supplierName: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierName")

    public static let updatedTimestamp: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "UpdatedTimestamp")

    public static let products: Property = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Products")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.supplier)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixSupplier> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixSupplier>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.city))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixSupplier {
        return CastRequired<MyPrefixSupplier>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.country))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.country, to: StringValue.of(optional: value))
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.emailAddress))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.houseNumber))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.houseNumber, to: StringValue.of(optional: value))
        }
    }

    open class func key(supplierID: String) -> EntityKey {
        return EntityKey().with(name: "SupplierId", value: StringValue.of(supplierID))
    }

    open var old: MyPrefixSupplier {
        get {
            return CastRequired<MyPrefixSupplier>.from(self.oldEntity)
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.phoneNumber))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.postalCode))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var products: Array<MyPrefixProduct> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: MyPrefixSupplier.products)).toArray(), Array<MyPrefixProduct>())
        }
        set(value) {
            MyPrefixSupplier.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.street))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.street, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MyPrefixSupplier.supplierID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.supplierID, to: StringValue.of(value))
        }
    }

    open var supplierName: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixSupplier.supplierName))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.supplierName, to: StringValue.of(optional: value))
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.dataValue(for: MyPrefixSupplier.updatedTimestamp))
        }
        set(value) {
            self.setDataValue(for: MyPrefixSupplier.updatedTimestamp, to: value)
        }
    }
}
