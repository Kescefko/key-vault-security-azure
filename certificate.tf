resource "azurerm_key_vault_certificate" "self_signed_cert" {
  name         = "self-signed-cert"
  key_vault_id = azurerm_key_vault.vault

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_type   = "RSA"
      key_size   = 2048
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }
      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      subject            = "CN=example.com"
      validity_in_months = 12

      key_usage = [
        "digitalSignature",
        "keyEncipherment"
      ]
    }
  }
}