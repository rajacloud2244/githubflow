terraform {
  required_version = ">= 1.0"
}

# Variable definitions
variable "fruit_list" {
  description = "A list of fruits"
  default     = ["apple", "banana", "cherry", "apple"]
}

variable "fruit_prices" {
  description = "A map of fruit prices"
  type        = map(number)
  default     = {
    apple  = 1.5
    banana = 0.75
    cherry = 2.0
  }
}

variable "conditions" {
  description = "A list of conditions"
  default     = [true, true, false]
}

variable "additional_conditions" {
  description = "Additional conditions to check"
  default     = [true, true]
}

variable "negative_number" {
  description = "A negative number"
  default     = -42
}

variable "number_list" {
  description = "A list of numbers"
  type        = list(number)
  default     = [10, 20, 5, 30]
}

variable "additional_fruits" {
  description = "Additional fruits to add to the list"
  default     = ["date", "elderberry"]
}

variable "nested_fruit_lists" {
  description = "A list of lists of fruits"
  default     = [["fig", "grape"], ["honeydew", "kiwi"]]
}

# Local values
locals {
  unique_fruit_set         = toset(var.fruit_list)
  are_all_conditions_true   = alltrue(concat(var.conditions, var.additional_conditions))
  absolute_value            = abs(var.negative_number)
  upper_case_fruit          = upper(join(", ", var.fruit_list))
  lower_case_fruit          = lower(join(", ", var.fruit_list))
  combined_fruits           = concat(var.fruit_list, var.additional_fruits)
  current_timestamp         = timestamp()
  flattened_fruit_list      = flatten(var.nested_fruit_lists)
  joined_fruits             = join(", ", local.combined_fruits)
  split_fruits              = split(", ", local.joined_fruits)
  merged_fruit_lists        = merge({ a = ["mango"] }, { b = ["nectarine", "orange"] })
  sliced_fruit_list         = slice(var.fruit_list, 1, 3)
  unique_combined_fruit_set = toset(local.combined_fruits)
  fruit_count               = length(var.fruit_list)            # Count of fruits in the list
  fruit_prices_lookup       = [for fruit in var.fruit_list : lookup(var.fruit_prices, fruit, "Price not found")]  # Lookup prices
}

# Output results
output "unique_fruit_set" {
  value = local.unique_fruit_set
}

output "are_all_conditions_true" {
  value = local.are_all_conditions_true
}

output "absolute_value" {
  value = local.absolute_value
}

output "upper_case_fruit" {
  value = local.upper_case_fruit
}

output "lower_case_fruit" {
  value = local.lower_case_fruit
}

output "combined_fruits" {
  value = local.combined_fruits
}

output "current_timestamp" {
  value = local.current_timestamp
}

output "flattened_fruit_list" {
  value = local.flattened_fruit_list
}

output "joined_fruits" {
  value = local.joined_fruits
}

output "split_fruits" {
  value = local.split_fruits
}

output "merged_fruit_lists" {
  value = local.merged_fruit_lists
}

output "sliced_fruit_list" {
  value = local.sliced_fruit_list
}

output "unique_combined_fruit_set" {
  value = local.unique_combined_fruit_set
}

# New outputs
output "fruit_count" {
  value = local.fruit_count
}

output "fruit_prices_lookup" {
  value = local.fruit_prices_lookup
}
