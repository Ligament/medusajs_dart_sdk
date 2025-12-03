// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) =>
    ProductVariant(
      id: json['id'] as String,
      title: json['title'] as String,
      sku: json['sku'] as String?,
      barcode: json['barcode'] as String?,
      ean: json['ean'] as String?,
      upc: json['upc'] as String?,
      allowBackorder: json['allow_backorder'] as bool? ?? false,
      manageInventory: json['manage_inventory'] as bool? ?? true,
      hsCode: (json['hs_code'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      length: (json['length'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      originCountry: json['origin_country'] as String?,
      material: json['material'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map(
            (e) =>
                ProductVariantOptionValue.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      productId: json['product_id'] as String,
      calculatedPrice: json['calculated_price'] == null
          ? null
          : ProductVariantPrice.fromJson(
              json['calculated_price'] as Map<String, dynamic>,
            ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$ProductVariantToJson(ProductVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sku': instance.sku,
      'barcode': instance.barcode,
      'ean': instance.ean,
      'upc': instance.upc,
      'allow_backorder': instance.allowBackorder,
      'manage_inventory': instance.manageInventory,
      'hs_code': instance.hsCode,
      'weight': instance.weight,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'origin_country': instance.originCountry,
      'material': instance.material,
      'options': instance.options,
      'metadata': instance.metadata,
      'product_id': instance.productId,
      'calculated_price': instance.calculatedPrice,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

PriceDetails _$PriceDetailsFromJson(Map<String, dynamic> json) => PriceDetails(
  id: json['id'] as String?,
  priceListId: json['price_list_id'] as String?,
  priceListType: json['price_list_type'] as String?,
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$PriceDetailsToJson(PriceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price_list_id': instance.priceListId,
      'price_list_type': instance.priceListType,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
    };

ProductVariantPrice _$ProductVariantPriceFromJson(
  Map<String, dynamic> json,
) => ProductVariantPrice(
  id: json['id'] as String,
  isCalculatedPricePriceList: json['is_calculated_price_price_list'] as bool?,
  isCalculatedPriceTaxInclusive:
      json['is_calculated_price_tax_inclusive'] as bool?,
  calculatedAmount: (json['calculated_amount'] as num?)?.toDouble(),
  calculatedAmountWithTax: (json['calculated_amount_with_tax'] as num?)
      ?.toDouble(),
  calculatedAmountWithoutTax: (json['calculated_amount_without_tax'] as num?)
      ?.toDouble(),
  isOriginalPricePriceList: json['is_original_price_price_list'] as bool?,
  isOriginalPriceTaxInclusive: json['is_original_price_tax_inclusive'] as bool?,
  originalAmount: (json['original_amount'] as num?)?.toDouble(),
  originalAmountWithTax: (json['original_amount_with_tax'] as num?)?.toDouble(),
  originalAmountWithoutTax: (json['original_amount_without_tax'] as num?)
      ?.toDouble(),
  currencyCode: json['currency_code'] as String?,
  calculatedPrice: json['calculated_price'] == null
      ? null
      : PriceDetails.fromJson(json['calculated_price'] as Map<String, dynamic>),
  originalPrice: json['original_price'] == null
      ? null
      : PriceDetails.fromJson(json['original_price'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductVariantPriceToJson(
  ProductVariantPrice instance,
) => <String, dynamic>{
  'id': instance.id,
  'is_calculated_price_price_list': instance.isCalculatedPricePriceList,
  'is_calculated_price_tax_inclusive': instance.isCalculatedPriceTaxInclusive,
  'calculated_amount': instance.calculatedAmount,
  'calculated_amount_with_tax': instance.calculatedAmountWithTax,
  'calculated_amount_without_tax': instance.calculatedAmountWithoutTax,
  'is_original_price_price_list': instance.isOriginalPricePriceList,
  'is_original_price_tax_inclusive': instance.isOriginalPriceTaxInclusive,
  'original_amount': instance.originalAmount,
  'original_amount_with_tax': instance.originalAmountWithTax,
  'original_amount_without_tax': instance.originalAmountWithoutTax,
  'currency_code': instance.currencyCode,
  'calculated_price': instance.calculatedPrice,
  'original_price': instance.originalPrice,
};

CreateProductVariantRequest _$CreateProductVariantRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductVariantRequest(
  title: json['title'] as String,
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  ean: json['ean'] as String?,
  upc: json['upc'] as String?,
  allowBackorder: json['allow_backorder'] as bool?,
  manageInventory: json['manage_inventory'] as bool?,
  hsCode: (json['hs_code'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  originCountry: json['origin_country'] as String?,
  material: json['material'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map(
        (e) => ProductVariantOptionRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  prices: (json['prices'] as List<dynamic>?)
      ?.map(
        (e) => CreateProductVariantPriceRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$CreateProductVariantRequestToJson(
  CreateProductVariantRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'ean': instance.ean,
  'upc': instance.upc,
  'allow_backorder': instance.allowBackorder,
  'manage_inventory': instance.manageInventory,
  'hs_code': instance.hsCode,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'origin_country': instance.originCountry,
  'material': instance.material,
  'options': instance.options,
  'metadata': instance.metadata,
  'prices': instance.prices,
};

CreateProductVariantPriceRequest _$CreateProductVariantPriceRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductVariantPriceRequest(
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toInt(),
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  priceListId: json['price_list_id'] as String?,
);

Map<String, dynamic> _$CreateProductVariantPriceRequestToJson(
  CreateProductVariantPriceRequest instance,
) => <String, dynamic>{
  'currency_code': instance.currencyCode,
  'amount': instance.amount,
  'min_quantity': instance.minQuantity,
  'max_quantity': instance.maxQuantity,
  'price_list_id': instance.priceListId,
};

UpdateProductVariantRequest _$UpdateProductVariantRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductVariantRequest(
  title: json['title'] as String?,
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  ean: json['ean'] as String?,
  upc: json['upc'] as String?,
  allowBackorder: json['allow_backorder'] as bool?,
  manageInventory: json['manage_inventory'] as bool?,
  hsCode: (json['hs_code'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  originCountry: json['origin_country'] as String?,
  material: json['material'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map(
        (e) => ProductVariantOptionRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateProductVariantRequestToJson(
  UpdateProductVariantRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'ean': instance.ean,
  'upc': instance.upc,
  'allow_backorder': instance.allowBackorder,
  'manage_inventory': instance.manageInventory,
  'hs_code': instance.hsCode,
  'weight': instance.weight,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'origin_country': instance.originCountry,
  'material': instance.material,
  'options': instance.options,
  'metadata': instance.metadata,
};
