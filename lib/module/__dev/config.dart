import 'package:hyper_supabase/module/__dev/module.dart';

/*
user_profile
product_category
product
customer
supplier
payment_method
purchase_transaction
purchase_transaction_item
order_transaction
order_transaction_item
account_category
account_journal
lesson_category
lesson
lesson_leaderboard
*/

class ModuleConfig {
  static Module? getModule(String moduleName) {
    var index = configs.indexWhere((element) => element.name == moduleName);
    if (index == -1) {
      print("Module config not found $moduleName");
      return null;
    }
    return configs[index];
  }

  static List<Module> configs = [
    Module(
      name: 'user_profile',
      icon: 'user_profile',
      tableColumnPriority: [
        'id',
        'image_url',
        'user_profile_name',
        'gender',
        'email',
        'password',
        'role',
        'is_active',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'product_category',
      icon: 'product_category',
      tableColumnPriority: [
        'id',
        'image_url',
        'product_category_name',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'product',
      icon: 'product',
      tableColumnPriority: [
        'id',
        'image_url',
        'product_name',
        'product_category_id',
        'description',
        'sku',
        'qrcode',
        'purchase_price',
        'selling_price',
        'stock',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'customer',
      icon: 'customer',
      tableColumnPriority: [
        'id',
        'image_url',
        'customer_name',
        'email',
        'phone',
        'address',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'supplier',
      icon: 'supplier',
      tableColumnPriority: [
        'id',
        'image_url',
        'supplier_name',
        'email',
        'phone',
        'address',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'payment_method',
      icon: 'payment_method',
      tableColumnPriority: [
        'id',
        'payment_method_name',
        'account_number',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'purchase_transaction',
      icon: 'purchase_transaction',
      tableColumnPriority: [
        'id',
        'user_profile_id',
        'supplier_id',
        'payment_method_id',
        'order_status',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
      subEditMode: true,
      subEditTable: 'transaction_item',
      subEditFormHiddenFields: [],
      subEditTableHiddenFields: [],
      subEditTableHiddenFooters: [],
    ),
    Module(
      name: 'purchase_transaction_item',
      icon: 'purchase_transaction_item',
      tableColumnPriority: [
        'id',
        'purchase_transaction_id',
        'product_id',
        'qty',
        'purchase_price',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "created_at",
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'order_transaction',
      icon: 'order_transaction',
      tableColumnPriority: [
        'id',
        'user_profile_id',
        'customer_id',
        'payment_method_id',
        'order_status',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
      subEditMode: true,
      subEditTable: 'transaction_item',
      subEditFormHiddenFields: [],
      subEditTableHiddenFields: [],
      subEditTableHiddenFooters: [],
    ),
    Module(
      name: 'order_transaction_item',
      icon: 'order_transaction_item',
      tableColumnPriority: [
        'id',
        'order_transaction_id',
        'product_id',
        'qty',
        'purchase_price',
        'selling_price',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "created_at",
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'account_category',
      icon: 'account_category',
      tableColumnPriority: [
        'id',
        'account_category_name',
        'account_type',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'account_journal',
      icon: 'account_journal',
      tableColumnPriority: [
        'id',
        'account_category_id',
        'amount',
        'description',
        'user_profile_id',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'lesson_category',
      icon: 'lesson_category',
      tableColumnPriority: [
        'id',
        'lesson_category_name',
        'sort_index',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'lesson',
      icon: 'lesson',
      tableColumnPriority: [
        'id',
        'image_url',
        'lesson_category_id',
        'lesson_name',
        'description',
        'lesson_type',
        'url',
        'user_profile_id',
        'sort_index',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'lesson_leaderboard',
      icon: 'lesson_leaderboard',
      tableColumnPriority: [
        'id',
        'user_profile_id',
        'current_streak',
        'longest_streak',
        'total_minutes',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
  ];
}
