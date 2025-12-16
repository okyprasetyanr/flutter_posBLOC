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

enum ListForDatabase { Item, Transaksi, Kontak, Kas, Operator }
