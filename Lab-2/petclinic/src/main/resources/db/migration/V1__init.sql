CREATE TABLE vets (
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name  VARCHAR(30)
);

CREATE TABLE specialties (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(80)
);

CREATE TABLE vet_specialties (
    vet_id       INTEGER NOT NULL REFERENCES vets (id),
    specialty_id INTEGER NOT NULL REFERENCES specialties (id),
    PRIMARY KEY (vet_id, specialty_id)
);

CREATE TABLE types (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(80)
);

CREATE TABLE owners (
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name  VARCHAR(30),
    address    VARCHAR(255),
    city       VARCHAR(80),
    telephone  VARCHAR(20)
);

CREATE TABLE pets (
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(30),
    birth_date DATE,
    type_id    INTEGER NOT NULL REFERENCES types (id),
    owner_id   INTEGER NOT NULL REFERENCES owners (id)
);

CREATE TABLE visits (
    id          SERIAL PRIMARY KEY,
    pet_id      INTEGER NOT NULL REFERENCES pets (id),
    visit_date  DATE,
    description VARCHAR(255)
);
