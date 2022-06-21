resource "nsxt_policy_service" "this" {
  description  = var.description
  display_name = var.display_name

  l4_port_set_entry {
    display_name      = var.display_name
    description       = var.description
    protocol          = upper(var.protocol)
    destination_ports = var.destination_ports
  }

  tag {
    scope = "color"
    tag   = "pink"
  }
}

resource "nsxt_policy_group" "this" {
  display_name = var.display_name
  description  = var.description

  criteria {
    ipaddress_expression {
      ip_addresses = var.destinations
    }
  }
}

resource "nsxt_policy_gateway_policy" "this" {
	display_name = var.display_name
	description = var.description
	category = "LocalGatewayRules"
	locked = false
	sequence_number = 3
	stateful = true
	tcp_strict = false

	tag {
		scope = "color"
		tag = "orange"
	}

	rule {
		display_name = var.display_name
		destination_groups = [
			nsxt_policy_group.this.path
		]
		services = [
			nsxt_policy_service.this.path
		]
		disabled = false
		action = upper(var.action)
		logged = true
		scope = var.t1_paths
	}
}

