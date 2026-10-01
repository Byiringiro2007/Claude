# Architecture

```text
Passenger Flutter App ──HTTPS──> API ──> PostgreSQL
                                      ├─> Payment adapters (MTN/Airtel/Bank)
                                      ├─> Ticket + QR/PDF service
                                      ├─> Notification service
                                      └─> GPS/vehicle service

Owner Web Dashboard ─────HTTPS──────> API
Operator Web Portal ─────HTTPS──────> API
Driver App ──────────────HTTPS──────> API
```

The owner account should have the highest role and full management permissions. Operators should be isolated to their own company data.
