CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  phone TEXT UNIQUE NOT NULL,
  role TEXT NOT NULL DEFAULT 'passenger',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE companies (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE locations (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE routes (
  id BIGSERIAL PRIMARY KEY,
  from_location_id BIGINT REFERENCES locations(id),
  to_location_id BIGINT REFERENCES locations(id),
  fare_rwf INTEGER NOT NULL DEFAULT 0,
  active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE vehicles (
  id BIGSERIAL PRIMARY KEY,
  company_id BIGINT REFERENCES companies(id),
  vehicle_number TEXT NOT NULL,
  seat_count INTEGER NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE trips (
  id BIGSERIAL PRIMARY KEY,
  route_id BIGINT REFERENCES routes(id),
  vehicle_id BIGINT REFERENCES vehicles(id),
  departure_at TIMESTAMPTZ NOT NULL,
  arrival_at TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'scheduled'
);

CREATE TABLE bookings (
  id BIGSERIAL PRIMARY KEY,
  booking_number TEXT NOT NULL UNIQUE,
  user_id BIGINT REFERENCES users(id),
  trip_id BIGINT REFERENCES trips(id),
  passenger_name TEXT NOT NULL,
  passenger_phone TEXT NOT NULL,
  seat_number TEXT,
  amount_rwf INTEGER NOT NULL,
  payment_method TEXT,
  payment_reference TEXT,
  status TEXT NOT NULL DEFAULT 'pending',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE feedback (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id),
  booking_id BIGINT REFERENCES bookings(id),
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  message TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
