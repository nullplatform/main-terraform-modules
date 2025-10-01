resource "nullplatform_user" "nullplatform_user" {
  for_each = var.nullplatform_users

  email               = each.value.email
  first_name = each.value.first_name
  last_name = each.value.last_name
}