ui = true

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/path/to/fullchain.pem"
  tls_key_file  = "/path/to/privkey.pem"
}

seal "pkcs11" {
  lib            = "/usr/vault/lib/libCryptoki2_64.so"
  slot           = "0"
  pin            = "AAAA-BBBB-CCCC-DDDD"
  key_label      = "vault-hsm-key"
  hmac_key_label = "vault-hsm-hmac-key"
}

storage "consul" {
  token = "{{ consul_token }}"
  address = "127.0.0.1:8500"
  path    = "vault"
  tls_ca_file   = "/etc/pem/vault.ca"
  tls_cert_file = "/path/to/fullchain.pem"
  tls_key_file  = "/path/to/privkey.pem"
}

api_addr = "http://10.1.42.201:8200"
cluster_addr = "https://10.1.42.201:8201"
