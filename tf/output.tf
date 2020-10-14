output "policyId" {
  value = azurerm_policy_definition.samplePolicy.id
}

output "assignmentId" {
  value = azurerm_policy_assignment.sampleAssignment.id
}