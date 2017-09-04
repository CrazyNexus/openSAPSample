// # Proxy Compiler 17.5.7-b21522-20170719

import Foundation
import SAPOData

open class MyPrefixCustomer: EntityValue {
    public static let city: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "City")

    public static let country: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "Country")

    public static let customerID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "CustomerId")

    public static let dateOfBirth: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "DateOfBirth")

    public static let emailAddress: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "EmailAddress")

    public static let firstName: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "FirstName")

    public static let houseNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "HouseNumber")

    public static let lastName: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "LastName")

    public static let phoneNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "PhoneNumber")

    public static let postalCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "PostalCode")

    public static let street: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "Street")

    public static let updatedTimestamp: Property = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "UpdatedTimestamp")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.customer)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixCustomer> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixCustomer>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.city))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixCustomer {
        return CastRequired<MyPrefixCustomer>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.country))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MyPrefixCustomer.customerID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.customerID, to: StringValue.of(value))
        }
    }

    open var dateOfBirth: LocalDateTime {
        get {
            return LocalDateTime.castRequired(self.dataValue(for: MyPrefixCustomer.dateOfBirth))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.dateOfBirth, to: value)
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.emailAddress))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.firstName))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.firstName, to: StringValue.of(optional: value))
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.houseNumber))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.houseNumber, to: StringValue.of(optional: value))
        }
    }

    open class func key(customerID: String) -> EntityKey {
        return EntityKey().with(name: "CustomerId", value: StringValue.of(customerID))
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.lastName))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.lastName, to: StringValue.of(optional: value))
        }
    }

    open var old: MyPrefixCustomer {
        get {
            return CastRequired<MyPrefixCustomer>.from(self.oldEntity)
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.phoneNumber))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.postalCode))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixCustomer.street))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.street, to: StringValue.of(optional: value))
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.dataValue(for: MyPrefixCustomer.updatedTimestamp))
        }
        set(value) {
            self.setDataValue(for: MyPrefixCustomer.updatedTimestamp, to: value)
        }
    }
}
