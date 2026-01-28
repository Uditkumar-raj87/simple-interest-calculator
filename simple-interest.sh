#!/bin/bash
# Simple Interest Calculator
# This script calculates simple interest based on user input
# Formula: SI = (P * R * T) / 100
# Where P = Principal, R = Rate of Interest, T = Time Period

echo "======================================"
echo "   Simple Interest Calculator"
echo "======================================"
echo ""

# Get Principal Amount
echo -n "Enter the principal amount: "
read principal

# Validate principal
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Principal must be a positive number"
    exit 1
fi

# Get Rate of Interest
echo -n "Enter the rate of interest (% per annum): "
read rate

# Validate rate
if ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Rate must be a positive number"
    exit 1
fi

# Get Time Period
echo -n "Enter the time period (in years): "
read time

# Validate time
if ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Time must be a positive number"
    exit 1
fi

# Calculate Simple Interest
# SI = (P * R * T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
# A = P + SI
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display Results
echo ""
echo "======================================"
echo "         Calculation Results"
echo "======================================"
echo "Principal Amount: $principal"
echo "Rate of Interest: $rate% per annum"
echo "Time Period: $time years"
echo "--------------------------------------"
echo "Simple Interest: $simple_interest"
echo "Total Amount: $total_amount"
echo "======================================"
