package js.cordova.plugin;

import Reflect;
typedef PayPalEnvironments = {
?PayPalEnvironmentProduction:String,
?PayPalEnvironmentSandbox:String
}

@:enum abstract Environment (String) from String to String{
    var PayPalEnvironmentNoNetwork:String = 'PayPalEnvironmentNoNetwork';
    var PayPalEnvironmentProduction:String = 'PayPalEnvironmentProduction';
    var PayPalEnvironmentSandbox:String = 'PayPalEnvironmentSandbox';
}

@:enum abstract Scope (String) from String to String{
    var OPENID:String = 'openid';
    var PROFILE:String = 'profile';
    var ADDRESS:String = 'address';
    var EMAIL:String = 'email';
    var PHONE:String = 'phone';
    var FUTUREPAYMENTS:String = 'futurepayments';
    var PAYPALATTRIBUTES:String = 'paypalattributes';
}

@:native("PayPalMobile") extern class PayPalMobile {
    public static function version(completionCallback:Dynamic -> Void):Void;
    public static function init(clientIdsForEnvironments:PayPalEnvironments, completionCallback:Void -> Void):Void;
    public static function prepareToRender(environment:Environment, configuration:PayPalConfigurationOptions, completionCallback:Void -> Void):Void;
    public static function renderSinglePaymentUI(paymant:PayPalPayment, completionCallback:Dynamic -> Void, cancelCallback:Dynamic -> Void):Void;
    public static function applicationCorrelationIDForEnvironment(environment:Environment, completionCallback:Dynamic -> Void):Void;
    public static function clientMetadataID(completionCallback:Dynamic -> Void):Void;
    public static function renderFuturePaymentUI( completionCallback:Dynamic -> Void, cancelCallback:Dynamic -> Void):Void;
    public static function renderProfileSharingUI( scopes:Array<Scope>, completionCallback:Dynamic -> Void, cancelCallback:Dynamic -> Void):Void;
}

typedef PayPalConfigurationOptions = {
?defaultUserEmail:String,
?defaultUserPhoneCountryCode:String,
?defaultUserPhoneNumber:String,
?merchantName:String,
?merchantPrivacyPolicyURL:String,
?merchantUserAgreementURL:String,
?acceptCreditCards:Bool,
?payPalShippingAddressOption:PayPalShippingAddressOption,
?rememberUser:Bool,
?languageOrLocale:String,
?disableBlurWhenBackgrounding:Bool,
?presentingInPopover:Bool,
?forceDefaultsInSandbox:Bool,
?sandboxUserPassword:String,
?sandboxUserPin:String
}

@:enum abstract PayPalShippingAddressOption(Int) from Int to Int{
    var PayPalShippingAddressOptionNone = 0;
    var PayPalShippingAddressOptionProvided = 1;
    var PayPalShippingAddressOptionPayPal = 2;
    var PayPalShippingAddressOptionBoth = 3;
}
@:enum abstract Intent(String) from String to String{
    var Sale = "Sale";
    var Auth = "Auth";
    var Order = "Order";
}

@:enum abstract Currency(String) from String to String{
    var AUD = "AUD";
    var BRL = "BRL"; //Note: This currency is supported as a payment currency and a currency balance for in-country PayPal accounts only.
    var CAD = "CAD";
    var CZK = "CZK";
    var DKK = "DKK";
    var HKD = "HKD";
    var HUF = "HUF"; //Note: This currency does not support decimals. Decimal amounts will throw an error.
    var ILS = "ILS";
    var JPY = "JPY"; //Note: This currency does not support decimals. Decimal amounts will throw an error.
    var MYR = "MYR"; //Note: This currency is supported as a payment currency and a currency balance for in-country PayPal accounts only.
    var MXN = "MXN";
    var NOK = "NOK";
    var NZD = "NZD";
    var PHP = "PHP";
    var PLN = "PLN";
    var GBP = "GBP";
    var SGD = "SGD";
    var SEK = "SEK";
    var CHF = "CHF";
    var TWD = "TWD"; //Note: This currency does not support decimals. Decimal amounts will throw an error.
    var THB = "THB";
    var USD = "USD";
}


@:enum abstract PayPalPaymentState(String) from String to String{
    var SUCCESS = 'success';
    var CANCELLED = 'payment cancelled';
    var APPROVED = 'approved';
}


class PayPalConfiguration {
    public static function setup(?options:PayPalConfigurationOptions):PayPalConfigurationOptions {
        var defaults = {
            /// Will be overridden by email used in most recent PayPal login.
            defaultUserEmail: null,
            /// Will be overridden by phone country code used in most recent PayPal login
            defaultUserPhoneCountryCode: null,
            /// Will be overridden by phone number used in most recent PayPal login.
            /// @note If you set defaultUserPhoneNumber, be sure to also set defaultUserPhoneCountryCode.
            defaultUserPhoneNumber: null,
            /// Your company name, as it should be displayed to the user
            /// when requesting consent via a PayPalFuturePaymentViewController.
            merchantName: null,
            /// URL of your company's privacy policy, which will be offered to the user
            /// when requesting consent via a PayPalFuturePaymentViewController.
            merchantPrivacyPolicyURL: null,
            /// URL of your company's user agreement, which will be offered to the user
            /// when requesting consent via a PayPalFuturePaymentViewController.
            merchantUserAgreementURL: null,
            /// If set to NO, the SDK will only support paying with PayPal, not with credit cards.
            /// This applies only to single payments (via PayPalPaymentViewController).
            /// Future payments (via PayPalFuturePaymentViewController) always use PayPal.
            /// Defaults to YES
            acceptCreditCards: true,
            /// For single payments, options for the shipping address.
            /// - 0 - PayPalShippingAddressOptionNone: no shipping address applies.
            /// - 1 - PayPalShippingAddressOptionProvided: shipping address will be provided by your app,
            ///   in the shippingAddress property of PayPalPayment.
            /// - 2 - PayPalShippingAddressOptionPayPal: user will choose from shipping addresses on file
            ///   for their PayPal account.
            /// - 3 - PayPalShippingAddressOptionBoth: user will choose from the shipping address provided by your app,
            ///   in the shippingAddress property of PayPalPayment, plus the shipping addresses on file for the user's PayPal account.
            /// Defaults to 0 (PayPalShippingAddressOptionNone).
            payPalShippingAddressOption: PayPalShippingAddressOption.PayPalShippingAddressOptionNone,
            /// If set to YES, then if the user pays via their PayPal account,
            /// the SDK will remember the user's PayPal username or phone number;
            /// if the user pays via their credit card, then the SDK will remember
            /// the PayPal Vault token representing the user's credit card.
            ///
            /// If set to NO, then any previously-remembered username, phone number, or
            /// credit card token will be erased, and subsequent payment information will
            /// not be remembered.
            ///
            /// Defaults to YES.
            rememberUser: true,
            /// If not set, or if set to nil, defaults to the device's current language setting.
            ///
            /// Can be specified as a language code ("en", "fr", "zh-Hans", etc.) or as a locale ("en_AU", "fr_FR", "zh-Hant", etc.).
            /// If the library does not contain localized strings for a specified locale, then will fall back to the language. E.g., "es_CO" -> "es".
            /// If the library does not contain localized strings for a specified language, then will fall back to American English.
            ///
            /// If you specify only a language code, and that code matches the device's currently preferred language,
            /// then the library will attempt to use the device's current region as well.
            /// E.g., specifying "en" on a device set to "English" and "United Kingdom" will result in "en_GB".
            ///
            /// These localizations are currently included:
            /// da,de,en,en_AU,en_GB,es,es_MX,fr,he,it,ja,ko,nb,nl,pl,pt,pt_BR,ru,sv,tr,zh-Hans,zh-Hant,zh-Hant_TW.
            languageOrLocale: null,
            /// Normally, the SDK blurs the screen when the app is backgrounded,
            /// to obscure credit card or PayPal account details in the iOS-saved screenshot.
            /// If your app already does its own blurring upon backgrounding, you might choose to disable this.
            /// Defaults to NO.
            disableBlurWhenBackgrounding: false,
            /// If you will present the SDK's view controller within a popover, then set this property to YES.
            /// Defaults to NO. (iOS only)
            presentingInPopover: false,
            /// Sandbox credentials can be difficult to type on a mobile device. Setting this flag to YES will
            /// cause the sandboxUserPassword and sandboxUserPin to always be pre-populated into login fields.
            ///
            /// This setting will have no effect if the operation mode is production.
            forceDefaultsInSandbox: false,
            /// Password to use for sandbox if 'forceDefaultsInSandbox' is set.
            sandboxUserPassword: null,
            /// PIN to use for sandbox if 'forceDefaultsInSandbox' is set.
            sandboxUserPin: null

        };

        if (options == null)
            return defaults;

        for (field in Reflect.fields(options))
            if (Reflect.hasField(defaults, field))
                Reflect.setField(defaults, field, Reflect.field(options, field));

        return defaults;
    }
}

class PayPalItem {

    public var name:String;
    public var quantity:Float;
    public var price:String;
    public var currency:Currency;
    public var sku:String;

    public function new(name:String, quantity:Float, price:String, currency:Currency, ?sku:String) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.currency = currency;
        this.sku = sku;
    }

}

class PayPalPaymentDetails {
    public var subtotal:String;
    public var shipping:String;
    public var tax:String;

    public function new(subtotal:String, shipping:String, tax:String) {
        this.subtotal = subtotal;
        this.shipping = shipping;
        this.tax = tax;
    }
}

class PayPalPayment {

    public var amount:String;
    public var currency:Currency;
    public var shortDescription:String;
    public var intent:Intent;
    public var details:PayPalPaymentDetails;
    public var bnCode:String = "PhoneGap_SP";

    public var invoiceNumber:String;
    public var custom:String;
    public var softDescriptor:String;
    public var items:Array<PayPalItem>;
    public var payeeEmail:String;
    public var shippingAddress:PayPalShippingAddress;


    public function new(amount:String, currency:Currency, shortDescription:String, intent:Intent, ?details:PayPalPaymentDetails) {
        this.amount = amount;
        this.currency = currency;
        this.shortDescription = shortDescription;
        this.intent = Std.string(intent);
        this.details = details;
    }

}

class PayPalShippingAddress {
    public var recipientName:String;
    public var line1:String;
    public var line2:String;
    public var city:String;
    public var state:String;
    public var postalCode:String;
    public var countryCode:String;


    public function new(recipientName:String, line1:String, ?line2:String, city:String, state:String, postalCode:String, countryCode:String) {
        this.recipientName = recipientName;
        this.line1 = line1;
        this.line2 = line2;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
        this.countryCode = countryCode;
    }
}
