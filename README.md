# GET your Ticket

Production-ready starter repository for the Rwanda passenger ticket-booking platform.

## Repository structure

- `app/` — Flutter mobile application
- `backend/` — Node.js/Express API starter
- `docs/` — product and production integration notes

## Core features planned

- Passenger registration/login
- Search routes and transport companies
- Seat selection and booking
- MTN MoMo / Airtel Money / bank payment adapters
- PDF ticket + QR verification
- My Tickets
- Nearby/live vehicle status
- Passenger feedback
- Owner master dashboard and permissions
- Transport-company accounts
- Driver trip/location workflow

## Important

This repository is a real application **starter**, not a claim that payment providers, GPS, or production cloud infrastructure are already connected. Add your approved production credentials and provider configurations before going live.

## Run the Flutter app

1. Install Flutter and Android Studio.
2. From `app/`, run:

```bash
flutter pub get
flutter run
```

## Run the API

From `backend/`:

```bash
npm install
npm run dev
```

Copy `.env.example` to `.env` and configure your database/JWT settings.
