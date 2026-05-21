

CREATE DATABASE IF NOT EXISTS medanalyzer
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE medanalyzer;

CREATE TABLE IF NOT EXISTS users (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  password   VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  INDEX idx_email (email)
);

CREATE TABLE IF NOT EXISTS reports (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  user_id       INT NOT NULL,
  type          VARCHAR(50) DEFAULT 'General',
  summary       TEXT,
  full_response LONGTEXT,
  original_text TEXT,
  created_at    DATETIME DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user_reports (user_id, created_at)
);

CREATE TABLE IF NOT EXISTS appointments (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  user_id      INT NOT NULL,
  doctor       VARCHAR(100),
  specialty    VARCHAR(100),
  patient_name VARCHAR(100),
  date         VARCHAR(20),
  time         VARCHAR(20),
  reason       TEXT,
  created_at   DATETIME DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user_appts (user_id)
);


