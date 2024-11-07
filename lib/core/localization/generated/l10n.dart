// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(_current != null,
        'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(instance != null,
        'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?');
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get generalOk {
    return Intl.message(
      'Ok',
      name: 'generalOk',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get generalCancel {
    return Intl.message(
      'Cancel',
      name: 'generalCancel',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get dialogLoading {
    return Intl.message(
      'Loading...',
      name: 'dialogLoading',
      desc: '',
      args: [],
    );
  }

  /// `Connection Problem`
  String get dialogConnectionProblemTitle {
    return Intl.message(
      'Connection Problem',
      name: 'dialogConnectionProblemTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are not connected to the Internet. Please check your connection and try again.`
  String get dialogConnectionProblemMessage {
    return Intl.message(
      'You are not connected to the Internet. Please check your connection and try again.',
      name: 'dialogConnectionProblemMessage',
      desc: '',
      args: [],
    );
  }

  /// `ORDER HISTORY`
  String get orderHistory {
    return Intl.message(
      'ORDER HISTORY',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting payment`
  String get awaitingPayment {
    return Intl.message(
      'Awaiting payment',
      name: 'awaitingPayment',
      desc: '',
      args: [],
    );
  }

  /// `Ordered`
  String get ordered {
    return Intl.message(
      'Ordered',
      name: 'ordered',
      desc: '',
      args: [],
    );
  }

  /// `SUGGEST FOR YOU!`
  String get suggestForYou {
    return Intl.message(
      'SUGGEST FOR YOU!',
      name: 'suggestForYou',
      desc: '',
      args: [],
    );
  }

  /// `CLOTHING`
  String get clothing {
    return Intl.message(
      'CLOTHING',
      name: 'clothing',
      desc: '',
      args: [],
    );
  }

  /// `bought`
  String get bought {
    return Intl.message(
      'bought',
      name: 'bought',
      desc: '',
      args: [],
    );
  }

  /// `FEATURED ITEMS`
  String get featuredItems {
    return Intl.message(
      'FEATURED ITEMS',
      name: 'featuredItems',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Search in Major Craft`
  String get searchInMajorCraft {
    return Intl.message(
      'Search in Major Craft',
      name: 'searchInMajorCraft',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recentSearches {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find a match`
  String get weCouldntFindAMatch {
    return Intl.message(
      'We couldn\'t find a match',
      name: 'weCouldntFindAMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter another keyword or return home to explore more`
  String get enterAnotherKeyword {
    return Intl.message(
      'Please enter another keyword or return home to explore more',
      name: 'enterAnotherKeyword',
      desc: '',
      args: [],
    );
  }

  /// `Back Home`
  String get backHome {
    return Intl.message(
      'Back Home',
      name: 'backHome',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Up to`
  String get upTo {
    return Intl.message(
      'Up to',
      name: 'upTo',
      desc: '',
      args: [],
    );
  }

  /// `Above`
  String get above {
    return Intl.message(
      'Above',
      name: 'above',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min {
    return Intl.message(
      'Min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get max {
    return Intl.message(
      'Max',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `You may like`
  String get youMayLike {
    return Intl.message(
      'You may like',
      name: 'youMayLike',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `minutes left`
  String get minutesLeft {
    return Intl.message(
      'minutes left',
      name: 'minutesLeft',
      desc: '',
      args: [],
    );
  }

  /// `Get Discount`
  String get getDiscount {
    return Intl.message(
      'Get Discount',
      name: 'getDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Checkout Now`
  String get checkoutNow {
    return Intl.message(
      'Checkout Now',
      name: 'checkoutNow',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `My point`
  String get myPoint {
    return Intl.message(
      'My point',
      name: 'myPoint',
      desc: '',
      args: [],
    );
  }

  /// `Point you want to change`
  String get pointYouWantToChange {
    return Intl.message(
      'Point you want to change',
      name: 'pointYouWantToChange',
      desc: '',
      args: [],
    );
  }

  /// `Point Discount`
  String get pointDiscount {
    return Intl.message(
      'Point Discount',
      name: 'pointDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Guide`
  String get exchangeGuide {
    return Intl.message(
      'Exchange Guide',
      name: 'exchangeGuide',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Discount points applied`
  String get discountPointsApplied {
    return Intl.message(
      'Discount points applied',
      name: 'discountPointsApplied',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Full name (First and Last name)*`
  String get fullName {
    return Intl.message(
      'Full name (First and Last name)*',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number*`
  String get phoneNumber {
    return Intl.message(
      'Phone number*',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Street address or P.O Box*`
  String get streetOrPOBox {
    return Intl.message(
      'Street address or P.O Box*',
      name: 'streetOrPOBox',
      desc: '',
      args: [],
    );
  }

  /// `Apt, suite, building, floor, etc`
  String get aptSuiteBuildingFloor {
    return Intl.message(
      'Apt, suite, building, floor, etc',
      name: 'aptSuiteBuildingFloor',
      desc: '',
      args: [],
    );
  }

  /// `Country*`
  String get country {
    return Intl.message(
      'Country*',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `State/Province/Region*`
  String get stateProvinceRegion {
    return Intl.message(
      'State/Province/Region*',
      name: 'stateProvinceRegion',
      desc: '',
      args: [],
    );
  }

  /// `Zip code*`
  String get zipCode {
    return Intl.message(
      'Zip code*',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `Delivery note`
  String get deliveryNote {
    return Intl.message(
      'Delivery note',
      name: 'deliveryNote',
      desc: '',
      args: [],
    );
  }

  /// `Set as my default address`
  String get setDefaultAddress {
    return Intl.message(
      'Set as my default address',
      name: 'setDefaultAddress',
      desc: '',
      args: [],
    );
  }

  /// `Shipping & handling`
  String get shippingAndHandling {
    return Intl.message(
      'Shipping & handling',
      name: 'shippingAndHandling',
      desc: '',
      args: [],
    );
  }

  /// `Free shipping`
  String get freeship {
    return Intl.message(
      'Free shipping',
      name: 'freeship',
      desc: '',
      args: [],
    );
  }

  /// `Order total`
  String get orderTotal {
    return Intl.message(
      'Order total',
      name: 'orderTotal',
      desc: '',
      args: [],
    );
  }

  /// `Shipping unit`
  String get shippingUnit {
    return Intl.message(
      'Shipping unit',
      name: 'shippingUnit',
      desc: '',
      args: [],
    );
  }

  /// `Confirm and Pay`
  String get confirmAndPay {
    return Intl.message(
      'Confirm and Pay',
      name: 'confirmAndPay',
      desc: '',
      args: [],
    );
  }

  /// `Fill your card information`
  String get fillYourCardInformation {
    return Intl.message(
      'Fill your card information',
      name: 'fillYourCardInformation',
      desc: '',
      args: [],
    );
  }

  /// `Card number*`
  String get cardNumber {
    return Intl.message(
      'Card number*',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Name on card*`
  String get nameOnCard {
    return Intl.message(
      'Name on card*',
      name: 'nameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date (MM/YY)*`
  String get expirationDate {
    return Intl.message(
      'Expiration date (MM/YY)*',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Security code (CVV)*`
  String get securityCode {
    return Intl.message(
      'Security code (CVV)*',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `You have`
  String get youHave {
    return Intl.message(
      'You have',
      name: 'youHave',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `History Transaction`
  String get historyTransaction {
    return Intl.message(
      'History Transaction',
      name: 'historyTransaction',
      desc: '',
      args: [],
    );
  }

  /// `My Address`
  String get myAddress {
    return Intl.message(
      'My Address',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Save Change`
  String get saveChange {
    return Intl.message(
      'Save Change',
      name: 'saveChange',
      desc: '',
      args: [],
    );
  }

  /// `All history`
  String get allHistory {
    return Intl.message(
      'All history',
      name: 'allHistory',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Used`
  String get used {
    return Intl.message(
      'Used',
      name: 'used',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change avatar`
  String get changeAvatar {
    return Intl.message(
      'Change avatar',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `order`
  String get order {
    return Intl.message(
      'order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `claim`
  String get claim {
    return Intl.message(
      'claim',
      name: 'claim',
      desc: '',
      args: [],
    );
  }

  /// `Waiting payment`
  String get waitingPayment {
    return Intl.message(
      'Waiting payment',
      name: 'waitingPayment',
      desc: '',
      args: [],
    );
  }

  /// `Waiting shipping`
  String get waitingShipping {
    return Intl.message(
      'Waiting shipping',
      name: 'waitingShipping',
      desc: '',
      args: [],
    );
  }

  /// `On delivery`
  String get onDelivery {
    return Intl.message(
      'On delivery',
      name: 'onDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get returnOrder {
    return Intl.message(
      'Return',
      name: 'returnOrder',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Order is being packed in`
  String get orderIsBeingPacked {
    return Intl.message(
      'Order is being packed in',
      name: 'orderIsBeingPacked',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Packing`
  String get packing {
    return Intl.message(
      'Packing',
      name: 'packing',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Delivered successfully`
  String get deliveredSuccessfully {
    return Intl.message(
      'Delivered successfully',
      name: 'deliveredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You can return the order within 05 days, after 5 days if you do not confirm or return, the order will automatically be completed`
  String get youCanReturnTheOrderWithin {
    return Intl.message(
      'You can return the order within 05 days, after 5 days if you do not confirm or return, the order will automatically be completed',
      name: 'youCanReturnTheOrderWithin',
      desc: '',
      args: [],
    );
  }

  /// `Please tell us the reason (attached proof files/images/bills):`
  String get pleaseTellUsTheReason {
    return Intl.message(
      'Please tell us the reason (attached proof files/images/bills):',
      name: 'pleaseTellUsTheReason',
      desc: '',
      args: [],
    );
  }

  /// `Building description, nearby landmark, etc,..`
  String get buildingDescription {
    return Intl.message(
      'Building description, nearby landmark, etc,..',
      name: 'buildingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `You cancelled this order.`
  String get youCancelledThisOrder {
    return Intl.message(
      'You cancelled this order.',
      name: 'youCancelledThisOrder',
      desc: '',
      args: [],
    );
  }

  /// `We have received your cancellation request.`
  String get weHaveReceivedYourCancel {
    return Intl.message(
      'We have received your cancellation request.',
      name: 'weHaveReceivedYourCancel',
      desc: '',
      args: [],
    );
  }

  /// `If the information is valid, the refund (if any) will be returned to your payment account within 15-21 business days (depending on the bank).`
  String get ifTheInformationIsValid {
    return Intl.message(
      'If the information is valid, the refund (if any) will be returned to your payment account within 15-21 business days (depending on the bank).',
      name: 'ifTheInformationIsValid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4-digit code that was sent to`
  String get pleaseEnterthe4DigitCode {
    return Intl.message(
      'Please enter the 4-digit code that was sent to',
      name: 'pleaseEnterthe4DigitCode',
      desc: '',
      args: [],
    );
  }

  /// `Did not get it?`
  String get ditNotGetIt {
    return Intl.message(
      'Did not get it?',
      name: 'ditNotGetIt',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message(
      'Resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `This code is not correct, please re-enter`
  String get thisCodeIsNotCorrect {
    return Intl.message(
      'This code is not correct, please re-enter',
      name: 'thisCodeIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Email changed`
  String get emailChanged {
    return Intl.message(
      'Email changed',
      name: 'emailChanged',
      desc: '',
      args: [],
    );
  }

  /// `Current Password*`
  String get currentPassword {
    return Intl.message(
      'Current Password*',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password*`
  String get newPassword {
    return Intl.message(
      'New Password*',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new Password*`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new Password*',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `This is not match your current password`
  String get thisIsNotMatchYourCurrentPassword {
    return Intl.message(
      'This is not match your current password',
      name: 'thisIsNotMatchYourCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this account?`
  String get areYouSureToDeleteThisAccount {
    return Intl.message(
      'Are you sure to delete this account?',
      name: 'areYouSureToDeleteThisAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `All Blog Posts`
  String get allBlogPosts {
    return Intl.message(
      'All Blog Posts',
      name: 'allBlogPosts',
      desc: '',
      args: [],
    );
  }

  /// `Copy Link`
  String get copyLink {
    return Intl.message(
      'Copy Link',
      name: 'copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Recommended articles`
  String get recommendedArticles {
    return Intl.message(
      'Recommended articles',
      name: 'recommendedArticles',
      desc: '',
      args: [],
    );
  }

  /// `Related Products`
  String get relatedProducts {
    return Intl.message(
      'Related Products',
      name: 'relatedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get payNow {
    return Intl.message(
      'Pay Now',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `types of item`
  String get typesOfItem {
    return Intl.message(
      'types of item',
      name: 'typesOfItem',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `See Less`
  String get seeLess {
    return Intl.message(
      'See Less',
      name: 'seeLess',
      desc: '',
      args: [],
    );
  }

  /// `min read`
  String get minRead {
    return Intl.message(
      'min read',
      name: 'minRead',
      desc: '',
      args: [],
    );
  }

  /// `Published`
  String get published {
    return Intl.message(
      'Published',
      name: 'published',
      desc: '',
      args: [],
    );
  }

  /// `Share this post`
  String get shareThisPost {
    return Intl.message(
      'Share this post',
      name: 'shareThisPost',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
