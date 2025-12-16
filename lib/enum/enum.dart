enum FieldDataCompany {
  id_company,
  name_company,
  phone_company,
  footer,
  header,
  created_company,
}

enum FieldDataUser {
  id_user,
  status_user,
  name_user,
  email_user,
  phone_user,
  role_user,
  uid_owner,
  id_branch,
  permissions_user,
  created_user,
  note_user,
}

enum FieldDataItem {
  id_item,
  uid_owner,
  name_item,
  price_item,
  id_category,
  status_condiment,
  url_image,
  qty_item,
  id_branch,
  barcode,
  status_item,
  date,
}

enum FieldDataCategory { id_category, name_category, id_branch, uid_owner }

enum FieldDataPartner {
  id_partner,
  id_branch,
  uid_owner,
  name_partner,
  phone_partner,
  email_partner,
  balance_partner,
  type,
  date,
}

enum FieldDataFinancial {
  name_financial,
  id_branch,
  id_financial,
  type,
  uid_owner,
}

enum FieldDataTransaction {
  invoice,
  id_branch,
  uid_owner,
  bank_name,
  bill_paid,
  note,
  total_charge,
  total_discount,
  total_ppn,
  payment_method,
  date,
  name_partner,
  id_partner,
  name_operator,
  id_operator,
  discount,
  ppn,
  total_item,
  sub_total,
  charge,
  total,
  status_transaction,
}

enum FieldDataTransFinancial {
  status_transaction,
  id_financial,
  id_branch,
  name_financial,
  note,
  date,
  amount,
  uid_owner,
}

enum ListForDatabase { Item, Transaksi, Kontak, Kas, Operator }
