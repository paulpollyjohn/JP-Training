terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = "XKLo5Vxz5SA8OGfwAsMH4FvS8O8lBy1eacVGrcFt"
}

variable.zone_id {
  default = "a6ffd438b97c04648c6b547bcf1b4d88"
}

# Create a DNS record
resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  name = "www"
  type = "A"
  value = "192.168.1.1"
  ttl = 3600
  proxied = false
  comment = "TEST DNS"
}

resource "cloudflare_dns_record" "www-stg" {
  zone_id = var.zone_id
  name = "www-stg"
  type = "A"
  value = "192.168.1.2"
  ttl = 3600
  proxied = false
  comment = "TEST DNS"
}