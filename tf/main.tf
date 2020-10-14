terraform {
  required_version = ">=0.13"
}

data "azurerm_subscription" "sub" { 
}


# data "azurerm_resource_group" "rg" {
#     name = var.rgName
# }


resource "azurerm_policy_definition" "samplePolicy" {
    name            = var.policyDefName
    policy_type     = "Custom"
    mode            = "Indexed"
    display_name    = var.policyDefName
    description     = var.policyDefDescription

    metadata = <<METADATA
    {
        "CATEGORY": "DemoCategory"
    }
    METADATA

    policy_rule = <<POLICY_RULE
    {
        "if": {
            "not": {
                "anyOf":[
                {
                    "field": "[concat('tags[', parameters('tagName'), ']')]",
                    "equals": "[parameters('tagValue1')]"
                },
                {
                    "field": "[concat('tags[', parameters('tagName'), ']')]",
                    "equals": "[parameters('tagValue2')]"
                },
                {
                    "field": "[concat('tags[', parameters('tagName'), ']')]",
                    "equals": "[parameters('tagValue3')]"
                }
                ]
            }
        },
        "then": {
            "effect": "audit"
        }
    }
    POLICY_RULE

    parameters = <<PARAMETERS
    {
        "tagName": {
            "type": "String",
            "metadata": {
                "displayName": "Tag Name",
                "description": "Name of the tag such as APPS"
            }
        },
        "tagValue1": {
            "type": "String",
            "metadata": {
                "displayName": "Tag Value 1",
                "description": "Name of the tag such as APIM"
            }
        },
        "tagValue2": {
            "type": "String",
            "metadata": {
                "displayName": "Tag Value 2",
                "description": "Name of the tag such as APIM"
            }
        },
        "tagValue3": {
            "type": "String",
            "metadata": {
                "displayName": "Tag Value 3",
                "description": "Name of the tag such as APIM"
            }
        }
    }
    PARAMETERS
}

resource "azurerm_policy_assignment" "sampleAssignment" {
    name                    = var.policyAsgnName
    scope                   = data.azurerm_subscription.sub.id
    policy_definition_id    = azurerm_policy_definition.samplePolicy.id
    description             = var.policyAsgnDescription
    display_name            = var.policyAsgnName
    depends_on              = [azurerm_policy_definition.samplePolicy]

    parameters = <<PARAMETERS
    {
        "tagName":{
            "value": "${var.tagName}"
        },
        "tagValue1":{
            "value": "${var.tagValue1}"
        },
        "tagValue2":{
            "value": "${var.tagValue2}"
        },
        "tagValue3":{
            "value": "${var.tagValue3}"
        }
    }
    PARAMETERS
}


