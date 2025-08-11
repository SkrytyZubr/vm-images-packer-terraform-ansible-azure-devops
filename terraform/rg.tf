resource "azurerm_resource_group" "rg" {
  name = "book-lab"
  location = var.location

  tags = {
    role = "webserver"
  }
}