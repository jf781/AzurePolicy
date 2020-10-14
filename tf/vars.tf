variable "policyDefName" {
    type = string
    default = "Sample Policy Definition"
    description = "Name of the policy definition"
}

variable "policyDefDescription" {
    type = string
    default = "Sample Policy Definition Description2"
    description = "Description for the policy definition"
}

variable "policyAsgnName" {
    type = string
    default = "Sample Policy Assignment"
    description = "Name of the policy assignment"
}

variable "policyAsgnDescription" {
    type = string
    default = "Sample Policy Assignment Descriptions"
    description = "Description used for the policy assignment"
}

variable "rgName" {
    type = string
    default = "JF-AzPolicy-Demo"
    description = "Name of the resource group.  Used for scoping policy assignment"
}

variable "tagName" {
    type = string
    default = "Env"
    description = "Tag name which you are checking tag values for"
}

variable "tagValue1" {
    type = string
    default = "Prod"
    description = "A tag value you a searching for"
}

variable "tagValue2" {
    type = string
    default = "QA"
    description = "A tag value you a searching for"
}

variable "tagValue3" {
    type = string
    default = "Dev"
    description = "A tag value you a searching for"
}