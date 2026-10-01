# Production checklist

## Accounts and security
- Create owner account with MFA.
- Add role-based permissions for operators, drivers and support staff.
- Use managed PostgreSQL in production.
- Store secrets only in environment/secret management.
- Add audit logs for owner actions.

## Payments
- Obtain merchant/API access from MTN Rwanda, Airtel Rwanda and participating banks.
- Implement payment initiation, callback/webhook validation, status checks, refunds and reconciliation.
- Never trust a client-side "payment successful" flag.

## Tickets
- Generate a unique ticket/booking ID server-side.
- Generate a real QR code containing a signed ticket identifier.
- Verify QR codes server-side and prevent duplicate boarding.
- Generate the final PDF server-side and store it securely.

## GPS
- Drivers/operators must explicitly authorize location sharing.
- Send location only during an active trip where appropriate.
- Add location privacy, retention and permission controls.

## Deployment
- Deploy API behind HTTPS.
- Deploy PostgreSQL with backups.
- Configure Android signing keys.
- Set production API URL in the Flutter app.
- Add monitoring, crash reporting and automated backups.
