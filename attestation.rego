package attestation

# main 
valid_attestation = [result] {
    att := input.context.attestation
    
  
    att.status == "active"
    att.expiry_date > time.now_ns()
    att.user_id == input.context.user_id
    att.scenario == input.context.scenario
    att.customer_id == input.context.customer_id

    result := {
        "attestation_id": att.attestation_id,
        "is_valid": true
    }
}

default valid_attestation = []
