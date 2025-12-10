package attestation

att := input.context.attestation

# main
valid_attestation = [attestation |
    app_id := input.context.app_id
    scenario := input.context.scenario
    is_valid(att)

    # create obligation with original names
    attestation := {
        "attestation_id": att.attestation_id,
        "is_valid": true
    }
]

# validate attestation
is_valid(attestation) if {
    attestation.status == "active"
    attestation.expiry_date > time.now_ns()
    attestation.user_id == input.context.user_id
    attestation.scenario == input.context.scenario
    attestation.customer_id == input.context.customer_id
}

default valid_attestation = {}
