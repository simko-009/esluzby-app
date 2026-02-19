-- =============================================
-- eSlužby - Seed Data (Mock Data)
-- Spusti tento SQL v Supabase SQL Editor PO schéme
-- Heslo = časť emailu pred "@"
-- =============================================

-- Dočasne vypnúť trigger na vytváranie profilu (budeme ich vkladať ručne)
ALTER TABLE profiles DISABLE ROW LEVEL SECURITY;

-- =============================================
-- 1. AUTH USERS + PROFILES
-- =============================================
-- Poznámka: Vkladáme priamo do auth.users a profiles.
-- Trigger handle_new_user sa automaticky postará o profil,
-- ale pre istotu ho deaktivujeme a profily vložíme ručne.

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

-- =============================================
-- Regionálni redaktori (reporter)
-- =============================================

-- 1. Michal Bujna
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'Michal.Bujna@markizatv.sk', crypt('Michal.Bujna', gen_salt('bf')), NOW(),
  '{"meno": "Michal", "priezvisko": "Bujna", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001',
  '{"sub": "a0000000-0000-0000-0000-000000000001", "email": "Michal.Bujna@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 2. Nikola Čapeková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'nikola.capekova@markizatv.sk', crypt('nikola.capekova', gen_salt('bf')), NOW(),
  '{"meno": "Nikola", "priezvisko": "Čapeková", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000002',
  '{"sub": "a0000000-0000-0000-0000-000000000002", "email": "nikola.capekova@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- 3. Jana Čerovská
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated',
  'jana.cerovska@markizatv.sk', crypt('jana.cerovska', gen_salt('bf')), NOW(),
  '{"meno": "Jana", "priezvisko": "Čerovská", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000003',
  '{"sub": "a0000000-0000-0000-0000-000000000003", "email": "jana.cerovska@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000003', NOW(), NOW(), NOW());

-- 4. Jozef Demeter
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000004', 'authenticated', 'authenticated',
  'Jozef.Demeter@markizatv.sk', crypt('Jozef.Demeter', gen_salt('bf')), NOW(),
  '{"meno": "Jozef", "priezvisko": "Demeter", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000004',
  '{"sub": "a0000000-0000-0000-0000-000000000004", "email": "Jozef.Demeter@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000004', NOW(), NOW(), NOW());

-- 5. Juraj Fazekaš
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000005', 'authenticated', 'authenticated',
  'Juraj.Fazekas@markizatv.sk', crypt('Juraj.Fazekas', gen_salt('bf')), NOW(),
  '{"meno": "Juraj", "priezvisko": "Fazekaš", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000005',
  '{"sub": "a0000000-0000-0000-0000-000000000005", "email": "Juraj.Fazekas@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000005', NOW(), NOW(), NOW());

-- 6. Ľubomír Fronko
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000006', 'authenticated', 'authenticated',
  'Lubomir.Fronko@markizatv.sk', crypt('Lubomir.Fronko', gen_salt('bf')), NOW(),
  '{"meno": "Ľubomír", "priezvisko": "Fronko", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000006',
  '{"sub": "a0000000-0000-0000-0000-000000000006", "email": "Lubomir.Fronko@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000006', NOW(), NOW(), NOW());

-- 7. Michal Hrenovčík
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000007', 'authenticated', 'authenticated',
  'Michal.Hrenovcik@markizatv.sk', crypt('Michal.Hrenovcik', gen_salt('bf')), NOW(),
  '{"meno": "Michal", "priezvisko": "Hrenovčík", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000007', 'a0000000-0000-0000-0000-000000000007',
  '{"sub": "a0000000-0000-0000-0000-000000000007", "email": "Michal.Hrenovcik@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000007', NOW(), NOW(), NOW());

-- 8. Martin Jedinák
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000008', 'authenticated', 'authenticated',
  'Martin.Jedinak@markizatv.sk', crypt('Martin.Jedinak', gen_salt('bf')), NOW(),
  '{"meno": "Martin", "priezvisko": "Jedinák", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0000-000000000008',
  '{"sub": "a0000000-0000-0000-0000-000000000008", "email": "Martin.Jedinak@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000008', NOW(), NOW(), NOW());

-- 9. Veronika Kandráčová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000009', 'authenticated', 'authenticated',
  'Veronika.Kandracova@markizatv.sk', crypt('Veronika.Kandracova', gen_salt('bf')), NOW(),
  '{"meno": "Veronika", "priezvisko": "Kandráčová", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0000-000000000009',
  '{"sub": "a0000000-0000-0000-0000-000000000009", "email": "Veronika.Kandracova@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000009', NOW(), NOW(), NOW());

-- 10. Martina Kašiarová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000010', 'authenticated', 'authenticated',
  'Martina.Kasiarova@markizatv.sk', crypt('Martina.Kasiarova', gen_salt('bf')), NOW(),
  '{"meno": "Martina", "priezvisko": "Kašiarová", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000010', 'a0000000-0000-0000-0000-000000000010',
  '{"sub": "a0000000-0000-0000-0000-000000000010", "email": "Martina.Kasiarova@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000010', NOW(), NOW(), NOW());

-- 11. Mario Kermiet
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000011', 'authenticated', 'authenticated',
  'Mario.Kermiet@markizatv.sk', crypt('Mario.Kermiet', gen_salt('bf')), NOW(),
  '{"meno": "Mario", "priezvisko": "Kermiet", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0000-000000000011',
  '{"sub": "a0000000-0000-0000-0000-000000000011", "email": "Mario.Kermiet@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000011', NOW(), NOW(), NOW());

-- 12. Monika Koleková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000012', 'authenticated', 'authenticated',
  'Monika.Kolekova@markizatv.sk', crypt('Monika.Kolekova', gen_salt('bf')), NOW(),
  '{"meno": "Monika", "priezvisko": "Koleková", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0000-000000000012',
  '{"sub": "a0000000-0000-0000-0000-000000000012", "email": "Monika.Kolekova@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000012', NOW(), NOW(), NOW());

-- 13. Karol Mindák
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000013', 'authenticated', 'authenticated',
  'Karol.Mindak@markizatv.sk', crypt('Karol.Mindak', gen_salt('bf')), NOW(),
  '{"meno": "Karol", "priezvisko": "Mindák", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0000-000000000013',
  '{"sub": "a0000000-0000-0000-0000-000000000013", "email": "Karol.Mindak@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000013', NOW(), NOW(), NOW());

-- 14. Roman Ruttkay
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000014', 'authenticated', 'authenticated',
  'Roman.Ruttkay@markizatv.sk', crypt('Roman.Ruttkay', gen_salt('bf')), NOW(),
  '{"meno": "Roman", "priezvisko": "Ruttkay", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0000-000000000014',
  '{"sub": "a0000000-0000-0000-0000-000000000014", "email": "Roman.Ruttkay@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000014', NOW(), NOW(), NOW());

-- 15. Marek Šilhavík
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000015', 'authenticated', 'authenticated',
  'Marek.Silhavik@markizatv.sk', crypt('Marek.Silhavik', gen_salt('bf')), NOW(),
  '{"meno": "Marek", "priezvisko": "Šilhavík", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000015', 'a0000000-0000-0000-0000-000000000015',
  '{"sub": "a0000000-0000-0000-0000-000000000015", "email": "Marek.Silhavik@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000015', NOW(), NOW(), NOW());

-- 16. Pavol Sivák
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000016', 'authenticated', 'authenticated',
  'Pavol.Sivak@markizatv.sk', crypt('Pavol.Sivak', gen_salt('bf')), NOW(),
  '{"meno": "Pavol", "priezvisko": "Sivák", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000016', 'a0000000-0000-0000-0000-000000000016',
  '{"sub": "a0000000-0000-0000-0000-000000000016", "email": "Pavol.Sivak@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000016', NOW(), NOW(), NOW());

-- 17. Veronika Tešáková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000017', 'authenticated', 'authenticated',
  'Veronika.Tesakova@markizatv.sk', crypt('Veronika.Tesakova', gen_salt('bf')), NOW(),
  '{"meno": "Veronika", "priezvisko": "Tešáková", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000017', 'a0000000-0000-0000-0000-000000000017',
  '{"sub": "a0000000-0000-0000-0000-000000000017", "email": "Veronika.Tesakova@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000017', NOW(), NOW(), NOW());

-- 18. Ján Tribula
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000018', 'authenticated', 'authenticated',
  'Jan.Tribula@markiza.sk', crypt('Jan.Tribula', gen_salt('bf')), NOW(),
  '{"meno": "Ján", "priezvisko": "Tribula", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000018', 'a0000000-0000-0000-0000-000000000018',
  '{"sub": "a0000000-0000-0000-0000-000000000018", "email": "Jan.Tribula@markiza.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000018', NOW(), NOW(), NOW());

-- 19. Marek Vnenčák
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000019', 'authenticated', 'authenticated',
  'Marek.Vnencak@markizatv.sk', crypt('Marek.Vnencak', gen_salt('bf')), NOW(),
  '{"meno": "Marek", "priezvisko": "Vnenčák", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000019', 'a0000000-0000-0000-0000-000000000019',
  '{"sub": "a0000000-0000-0000-0000-000000000019", "email": "Marek.Vnencak@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000019', NOW(), NOW(), NOW());

-- 20. Peter Ziman
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0000000-0000-0000-0000-000000000020', 'authenticated', 'authenticated',
  'Peter.Ziman@markizatv.sk', crypt('Peter.Ziman', gen_salt('bf')), NOW(),
  '{"meno": "Peter", "priezvisko": "Ziman", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('a0000000-0000-0000-0000-000000000020', 'a0000000-0000-0000-0000-000000000020',
  '{"sub": "a0000000-0000-0000-0000-000000000020", "email": "Peter.Ziman@markizatv.sk"}'::jsonb,
  'email', 'a0000000-0000-0000-0000-000000000020', NOW(), NOW(), NOW());

-- =============================================
-- Vedúci vydania (veduci) — prvý je admin
-- =============================================

-- 21. Alexander Kopunec (ADMIN)
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'Alexander.Kopunec@markiza.sk', crypt('Alexander.Kopunec', gen_salt('bf')), NOW(),
  '{"meno": "Alexander", "priezvisko": "Kopunec", "rola": "admin"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001',
  '{"sub": "b0000000-0000-0000-0000-000000000001", "email": "Alexander.Kopunec@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 22. Ľubica Janíková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'Lubica.Janikova@markiza.sk', crypt('Lubica.Janikova', gen_salt('bf')), NOW(),
  '{"meno": "Ľubica", "priezvisko": "Janíková", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000002',
  '{"sub": "b0000000-0000-0000-0000-000000000002", "email": "Lubica.Janikova@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- 23. Silvia Kajanková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated',
  'Silvia.Kajankova@markiza.sk', crypt('Silvia.Kajankova', gen_salt('bf')), NOW(),
  '{"meno": "Silvia", "priezvisko": "Kajanková", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000003',
  '{"sub": "b0000000-0000-0000-0000-000000000003", "email": "Silvia.Kajankova@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000003', NOW(), NOW(), NOW());

-- 24. Zuzana Ferencáková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000004', 'authenticated', 'authenticated',
  'Zuzana.Ferencakova@markiza.sk', crypt('Zuzana.Ferencakova', gen_salt('bf')), NOW(),
  '{"meno": "Zuzana", "priezvisko": "Ferencáková", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000004',
  '{"sub": "b0000000-0000-0000-0000-000000000004", "email": "Zuzana.Ferencakova@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000004', NOW(), NOW(), NOW());

-- 25. Danica Nejedlá
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000005', 'authenticated', 'authenticated',
  'Danica.Nejedla@markiza.sk', crypt('Danica.Nejedla', gen_salt('bf')), NOW(),
  '{"meno": "Danica", "priezvisko": "Nejedlá", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000005',
  '{"sub": "b0000000-0000-0000-0000-000000000005", "email": "Danica.Nejedla@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000005', NOW(), NOW(), NOW());

-- 26. Viera Poliaková
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000006', 'authenticated', 'authenticated',
  'Viera.Poliakova@markiza.sk', crypt('Viera.Poliakova', gen_salt('bf')), NOW(),
  '{"meno": "Viera", "priezvisko": "Poliaková", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000006',
  '{"sub": "b0000000-0000-0000-0000-000000000006", "email": "Viera.Poliakova@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000006', NOW(), NOW(), NOW());

-- 27. Andrea Šprochová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0000000-0000-0000-0000-000000000007', 'authenticated', 'authenticated',
  'Andrea.Sprochova@markiza.sk', crypt('Andrea.Sprochova', gen_salt('bf')), NOW(),
  '{"meno": "Andrea", "priezvisko": "Šprochová", "rola": "veduci"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('b0000000-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000007',
  '{"sub": "b0000000-0000-0000-0000-000000000007", "email": "Andrea.Sprochova@markiza.sk"}'::jsonb,
  'email', 'b0000000-0000-0000-0000-000000000007', NOW(), NOW(), NOW());

-- =============================================
-- Pomocný editor (reporter)
-- =============================================

-- 28. Peter Hošek
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'Peter.Hosek@markizatv.sk', crypt('Peter.Hosek', gen_salt('bf')), NOW(),
  '{"meno": "Peter", "priezvisko": "Hošek", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('c0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001',
  '{"sub": "c0000000-0000-0000-0000-000000000001", "email": "Peter.Hosek@markizatv.sk"}'::jsonb,
  'email', 'c0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 29. Petra Ragulová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'Petra.Ragulova@markiza.sk', crypt('Petra.Ragulova', gen_salt('bf')), NOW(),
  '{"meno": "Petra", "priezvisko": "Ragulová", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('c0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002',
  '{"sub": "c0000000-0000-0000-0000-000000000002", "email": "Petra.Ragulova@markiza.sk"}'::jsonb,
  'email', 'c0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- =============================================
-- Produkcia (reporter)
-- =============================================

-- 30. Lucia Srnová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'Lucia.Srnova@markiza.sk', crypt('Lucia.Srnova', gen_salt('bf')), NOW(),
  '{"meno": "Lucia", "priezvisko": "Srnová", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('d0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000001',
  '{"sub": "d0000000-0000-0000-0000-000000000001", "email": "Lucia.Srnova@markiza.sk"}'::jsonb,
  'email', 'd0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 31. Dávid Širúček
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'David.Sirucek@markiza.sk', crypt('David.Sirucek', gen_salt('bf')), NOW(),
  '{"meno": "Dávid", "priezvisko": "Širúček", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('d0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000002',
  '{"sub": "d0000000-0000-0000-0000-000000000002", "email": "David.Sirucek@markiza.sk"}'::jsonb,
  'email', 'd0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- 32. Sindy Molokáč
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd0000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated',
  'Sindy.Molokac@markiza.sk', crypt('Sindy.Molokac', gen_salt('bf')), NOW(),
  '{"meno": "Sindy", "priezvisko": "Molokáč", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('d0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000003',
  '{"sub": "d0000000-0000-0000-0000-000000000003", "email": "Sindy.Molokac@markiza.sk"}'::jsonb,
  'email', 'd0000000-0000-0000-0000-000000000003', NOW(), NOW(), NOW());

-- 33. Karol Molnár
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd0000000-0000-0000-0000-000000000004', 'authenticated', 'authenticated',
  'Karol.Molnar@markiza.sk', crypt('Karol.Molnar', gen_salt('bf')), NOW(),
  '{"meno": "Karol", "priezvisko": "Molnár", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('d0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000004',
  '{"sub": "d0000000-0000-0000-0000-000000000004", "email": "Karol.Molnar@markiza.sk"}'::jsonb,
  'email', 'd0000000-0000-0000-0000-000000000004', NOW(), NOW(), NOW());

-- =============================================
-- WEB editor (reporter)
-- =============================================

-- 34. Martin Čeliga
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'martin.celiga@markiza.sk', crypt('martin.celiga', gen_salt('bf')), NOW(),
  '{"meno": "Martin", "priezvisko": "Čeliga", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('e0000000-0000-0000-0000-000000000001', 'e0000000-0000-0000-0000-000000000001',
  '{"sub": "e0000000-0000-0000-0000-000000000001", "email": "martin.celiga@markiza.sk"}'::jsonb,
  'email', 'e0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 35. Ivan Černanský
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'Ivan.Cernansky@markiza.sk', crypt('Ivan.Cernansky', gen_salt('bf')), NOW(),
  '{"meno": "Ivan", "priezvisko": "Černanský", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('e0000000-0000-0000-0000-000000000002', 'e0000000-0000-0000-0000-000000000002',
  '{"sub": "e0000000-0000-0000-0000-000000000002", "email": "Ivan.Cernansky@markiza.sk"}'::jsonb,
  'email', 'e0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- 36. Alexandra Murajdová
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e0000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated',
  'Alexandra.Murajdova@markiza.sk', crypt('Alexandra.Murajdova', gen_salt('bf')), NOW(),
  '{"meno": "Alexandra", "priezvisko": "Murajdová", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('e0000000-0000-0000-0000-000000000003', 'e0000000-0000-0000-0000-000000000003',
  '{"sub": "e0000000-0000-0000-0000-000000000003", "email": "Alexandra.Murajdova@markiza.sk"}'::jsonb,
  'email', 'e0000000-0000-0000-0000-000000000003', NOW(), NOW(), NOW());

-- 37. Katarína Ács
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e0000000-0000-0000-0000-000000000004', 'authenticated', 'authenticated',
  'Katarina.Acs@markiza.sk', crypt('Katarina.Acs', gen_salt('bf')), NOW(),
  '{"meno": "Katarína", "priezvisko": "Ács", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('e0000000-0000-0000-0000-000000000004', 'e0000000-0000-0000-0000-000000000004',
  '{"sub": "e0000000-0000-0000-0000-000000000004", "email": "Katarina.Acs@markiza.sk"}'::jsonb,
  'email', 'e0000000-0000-0000-0000-000000000004', NOW(), NOW(), NOW());

-- =============================================
-- TN Live (reporter)
-- =============================================

-- 38. Lukáš Zúželka
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f0000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated',
  'Lukas.Zuzelka@markiza.sk', crypt('Lukas.Zuzelka', gen_salt('bf')), NOW(),
  '{"meno": "Lukáš", "priezvisko": "Zúželka", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000001',
  '{"sub": "f0000000-0000-0000-0000-000000000001", "email": "Lukas.Zuzelka@markiza.sk"}'::jsonb,
  'email', 'f0000000-0000-0000-0000-000000000001', NOW(), NOW(), NOW());

-- 39. Marcel Marcišiak
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f0000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated',
  'Marcel.Marcisiak@markiza.sk', crypt('Marcel.Marcisiak', gen_salt('bf')), NOW(),
  '{"meno": "Marcel", "priezvisko": "Marcišiak", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('f0000000-0000-0000-0000-000000000002', 'f0000000-0000-0000-0000-000000000002',
  '{"sub": "f0000000-0000-0000-0000-000000000002", "email": "Marcel.Marcisiak@markiza.sk"}'::jsonb,
  'email', 'f0000000-0000-0000-0000-000000000002', NOW(), NOW(), NOW());

-- 40. Marek Marušiak
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_user_meta_data, created_at, updated_at, confirmation_token, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f0000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated',
  'Marek.Marusiak@markiza.sk', crypt('Marek.Marusiak', gen_salt('bf')), NOW(),
  '{"meno": "Marek", "priezvisko": "Marušiak", "rola": "reporter"}'::jsonb, NOW(), NOW(), '', '');
INSERT INTO auth.identities (id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at)
VALUES ('f0000000-0000-0000-0000-000000000003', 'f0000000-0000-0000-0000-000000000003',
  '{"sub": "f0000000-0000-0000-0000-000000000003", "email": "Marek.Marusiak@markiza.sk"}'::jsonb,
  'email', 'f0000000-0000-0000-0000-000000000003', NOW(), NOW(), NOW());

-- =============================================
-- 2. PROFILES (ručne, keďže trigger je vypnutý)
-- =============================================

-- Regionálni redaktori
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('a0000000-0000-0000-0000-000000000001', 'Michal.Bujna@markizatv.sk', 'Michal', 'Bujna', 'reporter', '+421 905 111 001'),
('a0000000-0000-0000-0000-000000000002', 'nikola.capekova@markizatv.sk', 'Nikola', 'Čapeková', 'reporter', '+421 905 111 002'),
('a0000000-0000-0000-0000-000000000003', 'jana.cerovska@markizatv.sk', 'Jana', 'Čerovská', 'reporter', '+421 905 111 003'),
('a0000000-0000-0000-0000-000000000004', 'Jozef.Demeter@markizatv.sk', 'Jozef', 'Demeter', 'reporter', '+421 905 111 004'),
('a0000000-0000-0000-0000-000000000005', 'Juraj.Fazekas@markizatv.sk', 'Juraj', 'Fazekaš', 'reporter', '+421 905 111 005'),
('a0000000-0000-0000-0000-000000000006', 'Lubomir.Fronko@markizatv.sk', 'Ľubomír', 'Fronko', 'reporter', '+421 905 111 006'),
('a0000000-0000-0000-0000-000000000007', 'Michal.Hrenovcik@markizatv.sk', 'Michal', 'Hrenovčík', 'reporter', '+421 905 111 007'),
('a0000000-0000-0000-0000-000000000008', 'Martin.Jedinak@markizatv.sk', 'Martin', 'Jedinák', 'reporter', '+421 905 111 008'),
('a0000000-0000-0000-0000-000000000009', 'Veronika.Kandracova@markizatv.sk', 'Veronika', 'Kandráčová', 'reporter', '+421 905 111 009'),
('a0000000-0000-0000-0000-000000000010', 'Martina.Kasiarova@markizatv.sk', 'Martina', 'Kašiarová', 'reporter', '+421 905 111 010'),
('a0000000-0000-0000-0000-000000000011', 'Mario.Kermiet@markizatv.sk', 'Mario', 'Kermiet', 'reporter', '+421 905 111 011'),
('a0000000-0000-0000-0000-000000000012', 'Monika.Kolekova@markizatv.sk', 'Monika', 'Koleková', 'reporter', '+421 905 111 012'),
('a0000000-0000-0000-0000-000000000013', 'Karol.Mindak@markizatv.sk', 'Karol', 'Mindák', 'reporter', '+421 905 111 013'),
('a0000000-0000-0000-0000-000000000014', 'Roman.Ruttkay@markizatv.sk', 'Roman', 'Ruttkay', 'reporter', '+421 905 111 014'),
('a0000000-0000-0000-0000-000000000015', 'Marek.Silhavik@markizatv.sk', 'Marek', 'Šilhavík', 'reporter', '+421 905 111 015'),
('a0000000-0000-0000-0000-000000000016', 'Pavol.Sivak@markizatv.sk', 'Pavol', 'Sivák', 'reporter', '+421 905 111 016'),
('a0000000-0000-0000-0000-000000000017', 'Veronika.Tesakova@markizatv.sk', 'Veronika', 'Tešáková', 'reporter', '+421 905 111 017'),
('a0000000-0000-0000-0000-000000000018', 'Jan.Tribula@markiza.sk', 'Ján', 'Tribula', 'reporter', '+421 905 111 018'),
('a0000000-0000-0000-0000-000000000019', 'Marek.Vnencak@markizatv.sk', 'Marek', 'Vnenčák', 'reporter', '+421 905 111 019'),
('a0000000-0000-0000-0000-000000000020', 'Peter.Ziman@markizatv.sk', 'Peter', 'Ziman', 'reporter', '+421 905 111 020');

-- Vedúci vydania (admin + veduci)
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('b0000000-0000-0000-0000-000000000001', 'Alexander.Kopunec@markiza.sk', 'Alexander', 'Kopunec', 'admin', '+421 902 200 001'),
('b0000000-0000-0000-0000-000000000002', 'Lubica.Janikova@markiza.sk', 'Ľubica', 'Janíková', 'veduci', '+421 902 200 002'),
('b0000000-0000-0000-0000-000000000003', 'Silvia.Kajankova@markiza.sk', 'Silvia', 'Kajanková', 'veduci', '+421 902 200 003'),
('b0000000-0000-0000-0000-000000000004', 'Zuzana.Ferencakova@markiza.sk', 'Zuzana', 'Ferencáková', 'veduci', '+421 902 200 004'),
('b0000000-0000-0000-0000-000000000005', 'Danica.Nejedla@markiza.sk', 'Danica', 'Nejedlá', 'veduci', '+421 902 200 005'),
('b0000000-0000-0000-0000-000000000006', 'Viera.Poliakova@markiza.sk', 'Viera', 'Poliaková', 'veduci', '+421 902 200 006'),
('b0000000-0000-0000-0000-000000000007', 'Andrea.Sprochova@markiza.sk', 'Andrea', 'Šprochová', 'veduci', '+421 902 200 007');

-- Pomocný editor
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('c0000000-0000-0000-0000-000000000001', 'Peter.Hosek@markizatv.sk', 'Peter', 'Hošek', 'reporter', '+421 905 300 001'),
('c0000000-0000-0000-0000-000000000002', 'Petra.Ragulova@markiza.sk', 'Petra', 'Ragulová', 'reporter', '+421 905 300 002');

-- Produkcia
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('d0000000-0000-0000-0000-000000000001', 'Lucia.Srnova@markiza.sk', 'Lucia', 'Srnová', 'reporter', '+421 905 400 001'),
('d0000000-0000-0000-0000-000000000002', 'David.Sirucek@markiza.sk', 'Dávid', 'Širúček', 'reporter', '+421 905 400 002'),
('d0000000-0000-0000-0000-000000000003', 'Sindy.Molokac@markiza.sk', 'Sindy', 'Molokáč', 'reporter', '+421 905 400 003'),
('d0000000-0000-0000-0000-000000000004', 'Karol.Molnar@markiza.sk', 'Karol', 'Molnár', 'reporter', '+421 905 400 004');

-- WEB editor
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('e0000000-0000-0000-0000-000000000001', 'martin.celiga@markiza.sk', 'Martin', 'Čeliga', 'reporter', '+421 905 500 001'),
('e0000000-0000-0000-0000-000000000002', 'Ivan.Cernansky@markiza.sk', 'Ivan', 'Černanský', 'reporter', '+421 905 500 002'),
('e0000000-0000-0000-0000-000000000003', 'Alexandra.Murajdova@markiza.sk', 'Alexandra', 'Murajdová', 'reporter', '+421 905 500 003'),
('e0000000-0000-0000-0000-000000000004', 'Katarina.Acs@markiza.sk', 'Katarína', 'Ács', 'reporter', '+421 905 500 004');

-- TN Live
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon) VALUES
('f0000000-0000-0000-0000-000000000001', 'Lukas.Zuzelka@markiza.sk', 'Lukáš', 'Zúželka', 'reporter', '+421 905 600 001'),
('f0000000-0000-0000-0000-000000000002', 'Marcel.Marcisiak@markiza.sk', 'Marcel', 'Marcišiak', 'reporter', '+421 905 600 002'),
('f0000000-0000-0000-0000-000000000003', 'Marek.Marusiak@markiza.sk', 'Marek', 'Marušiak', 'reporter', '+421 905 600 003');

-- =============================================
-- 3. VEDÚCI DŇA (rozvrh na feb 2026)
-- =============================================

INSERT INTO veduci_dna (datum, veduci_id) VALUES
-- Týždeň 9.-13. feb
('2026-02-09', 'b0000000-0000-0000-0000-000000000002'), -- Janíková - pondelok
('2026-02-10', 'b0000000-0000-0000-0000-000000000003'), -- Kajanková - utorok
('2026-02-11', 'b0000000-0000-0000-0000-000000000004'), -- Ferencáková - streda
('2026-02-12', 'b0000000-0000-0000-0000-000000000005'), -- Nejedlá - štvrtok
('2026-02-13', 'b0000000-0000-0000-0000-000000000006'), -- Poliaková - piatok
-- Víkend
('2026-02-14', 'b0000000-0000-0000-0000-000000000007'), -- Šprochová - sobota
('2026-02-15', 'b0000000-0000-0000-0000-000000000002'), -- Janíková - nedeľa
-- Týždeň 16.-20. feb
('2026-02-16', 'b0000000-0000-0000-0000-000000000003'), -- Kajanková - pondelok
('2026-02-17', 'b0000000-0000-0000-0000-000000000004'), -- Ferencáková - utorok
('2026-02-18', 'b0000000-0000-0000-0000-000000000005'), -- Nejedlá - streda (dnes)
('2026-02-19', 'b0000000-0000-0000-0000-000000000006'), -- Poliaková - štvrtok
('2026-02-20', 'b0000000-0000-0000-0000-000000000007'), -- Šprochová - piatok
('2026-02-21', 'b0000000-0000-0000-0000-000000000002'), -- Janíková - sobota
('2026-02-22', 'b0000000-0000-0000-0000-000000000003'), -- Kajanková - nedeľa
-- Týždeň 23.-27. feb
('2026-02-23', 'b0000000-0000-0000-0000-000000000004'), -- Ferencáková
('2026-02-24', 'b0000000-0000-0000-0000-000000000005'), -- Nejedlá
('2026-02-25', 'b0000000-0000-0000-0000-000000000006'), -- Poliaková
('2026-02-26', 'b0000000-0000-0000-0000-000000000007'), -- Šprochová
('2026-02-27', 'b0000000-0000-0000-0000-000000000002'), -- Janíková
('2026-02-28', 'b0000000-0000-0000-0000-000000000003'); -- Kajanková

-- =============================================
-- 4. TÉMY (realistické spravodajské témy)
-- =============================================

INSERT INTO temy (reporter_id, datum, nazov, popis, stav, poznamka_veduceho, schvalil_id) VALUES

-- === 10. feb 2026 (pondelok) ===
('a0000000-0000-0000-0000-000000000001', '2026-02-10', 'Požiar bytovky v Košiciach',
  'Požiar vypukol na 4. poschodí bytového domu na Triede SNP. Evakuovaných 30 ľudí, 2 zranení prevezení do UNLP.',
  'schvalene', 'Dať do hlavnej relácie, rozhovor s hasičmi aj obyvateľmi.', 'b0000000-0000-0000-0000-000000000003'),

('a0000000-0000-0000-0000-000000000004', '2026-02-10', 'Otvorenie nového úseku D1 pri Ružomberku',
  'Minister dopravy slávnostne otvoril 8 km úsek diaľnice D1 Hubová - Ivachnová. Skráti čas jazdy o 15 minút.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

('a0000000-0000-0000-0000-000000000008', '2026-02-10', 'Protest učiteľov pred MŠ SR',
  'Odborový zväz pracovníkov školstva zorganizoval protestné zhromaždenie pred Ministerstvom školstva. Žiadajú 15% navýšenie platov.',
  'schvalene', 'Rozhovor s predsedom OZ a reakcia ministerstva.', 'b0000000-0000-0000-0000-000000000003'),

('a0000000-0000-0000-0000-000000000014', '2026-02-10', 'Dopravná nehoda na R1 pri Trnave',
  'Hromadná nehoda 5 áut na rýchlostnej ceste R1. Jeden mŕtvy, traja ťažko zranení. Cesta bola uzavretá 4 hodiny.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

('f0000000-0000-0000-0000-000000000001', '2026-02-10', 'TN LIVE: Rozhovor s ministrom zdravotníctva',
  'Živý rozhovor o reforme nemocníc a nedostatku zdravotníkov v regiónoch.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

-- === 11. feb 2026 (utorok) ===
('a0000000-0000-0000-0000-000000000002', '2026-02-11', 'Záplavy na Zemplíne',
  'Rieka Laborec sa vyliala z koryta v okolí Michaloviec. Zaplavených niekoľko domov, zasahujú hasiči aj armáda.',
  'schvalene', 'Priorita! Poslať aj kameramana s dronom.', 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000005', '2026-02-11', 'Nový zákon o stavebnom konaní',
  'NR SR schválila novelu stavebného zákona. Zjednodušenie povoľovacieho procesu pre rodinné domy.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000009', '2026-02-11', 'Kauza predražených IT zákaziek na ministerstve',
  'Investigatívny materiál o predražených IT zákazkách na Ministerstve vnútra. Zmluvy za 12 miliónov eur.',
  'schvalene', 'Výborné! Dať na začiatok relácie.', 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000011', '2026-02-11', 'Vražda v Žiline - podozrivý zadržaný',
  'Polícia zadržala 34-ročného muža podozrivého z vraždy 28-ročnej ženy v centre Žiliny. Motív zatiaľ neznámy.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000004'),

('e0000000-0000-0000-0000-000000000002', '2026-02-11', 'WEB: Top 10 lyžiarskych stredísk na Slovensku',
  'Prehľadový článok o najlepších lyžiarskych strediskách, ceny skipasov a podmienky na zjazdovkách.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000004'),

-- === 12. feb 2026 (streda) ===
('a0000000-0000-0000-0000-000000000003', '2026-02-12', 'Výbuch plynu v rodinnom dome v Prievidzi',
  'Výbuch plynu čiastočne zničil rodinný dom na ulici M. R. Štefánika. Jedna osoba hospitalizovaná s popáleninami.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000005'),

('a0000000-0000-0000-0000-000000000006', '2026-02-12', 'Návšteva pápeža na Slovensku - prípravy',
  'Organizačný výbor predstavil program návštevy pápeža Františka na Slovensku plánovanej na jar. Očakáva sa 100-tisíc veriacich.',
  'schvalene', 'Koordinovať s Vatikánom na potvrdenie dátumu.', 'b0000000-0000-0000-0000-000000000005'),

('a0000000-0000-0000-0000-000000000012', '2026-02-12', 'Štrajk vodičov MHD v Bratislave',
  'Vodiči bratislavského DPB vstúpili do výstražného štrajku. Ranná špička bez autobusov a trolejbusov.',
  'schvalene', 'Live vstup ráno z Hlavnej stanice.', 'b0000000-0000-0000-0000-000000000005'),

('a0000000-0000-0000-0000-000000000016', '2026-02-12', 'Prípad týraných detí v Nitre',
  'Sociálna kuratela odobrala 3 deti z rodiny v Nitre po nahlásení susedmi. Polícia začala trestné stíhanie.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000005'),

('f0000000-0000-0000-0000-000000000002', '2026-02-12', 'TN LIVE: Klimatická zmena a Slovensko',
  'Rozhovor s klimatológom o dopadoch klimatickej zmeny na Slovensko - sucho, záplavy, extrémne teploty.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000005'),

-- === 13. feb 2026 (štvrtok) ===
('a0000000-0000-0000-0000-000000000007', '2026-02-13', 'Korupčný škandál na radnici v Banskej Bystrici',
  'Prokurátor vzniesol obvinenie proti primátorovi z prijímania úplatkov pri stavebných povoleniach.',
  'schvalene', 'Exkluzívny materiál, držať do hlavnej relácie!', 'b0000000-0000-0000-0000-000000000006'),

('a0000000-0000-0000-0000-000000000010', '2026-02-13', 'Lavína v Nízkych Tatrách - záchranná akcia',
  'Horskí záchranári hľadajú 2 skialpinistov po lavíne v oblasti Chopku. Nasadený vrtuľník.',
  'schvalene', 'Urgentné! Priamo z miesta.', 'b0000000-0000-0000-0000-000000000006'),

('a0000000-0000-0000-0000-000000000013', '2026-02-13', 'Nový investor - automobilka v Nitre',
  'Čínska automobilka oznámila investíciu 500 miliónov eur do závodu v priemyselnom parku Nitra. 3000 nových pracovných miest.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000006'),

('a0000000-0000-0000-0000-000000000017', '2026-02-13', 'Valentínsky špeciál - netradičné svadobné miesta',
  'Reportáž o netradičných miestach na svadbu na Slovensku - hrady, jaskyne, lesy.',
  'neschvalene', 'Príliš ľahká téma pre hlavnú reláciu, skúsiť na web.', NULL),

('e0000000-0000-0000-0000-000000000001', '2026-02-13', 'WEB: Valentín - kam na romantickú večeru',
  'Prehľad najlepších reštaurácií pre romantickú večeru v slovenských mestách.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000006'),

-- === 14. feb 2026 (piatok) ===
('a0000000-0000-0000-0000-000000000015', '2026-02-14', 'Valentínske zásahy hasičov',
  'Kuriózne valentínske prípady - zaseknutý prsteň, uviaznutý pár na lanovke.',
  'schvalene', 'Ľahší materiál na záver relácie.', 'b0000000-0000-0000-0000-000000000007'),

('a0000000-0000-0000-0000-000000000019', '2026-02-14', 'Smog v Jelšave - namerané rekordné hodnoty',
  'Meracie stanice v Jelšave zaznamenali 5-násobne prekročené limity PM10. Obyvatelia žiadajú opatrenia.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000007'),

('a0000000-0000-0000-0000-000000000020', '2026-02-14', 'Nelegálna skládka pri Dunaji',
  'Reporter odhalil nelegálnu skládku odpadu v chránenej oblasti pri Dunaji neďaleko Komárna.',
  'schvalene', 'Doplniť reakciu MŽP.', 'b0000000-0000-0000-0000-000000000007'),

-- === 16. feb 2026 (pondelok) ===
('a0000000-0000-0000-0000-000000000001', '2026-02-16', 'Nový vlakový grafikon - chaos na staniciach',
  'Prvý deň platnosti nového grafikonu ŽSR. Cestujúci hlásia meškania a zrušené spoje.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

('a0000000-0000-0000-0000-000000000004', '2026-02-16', 'Pád mosta v Trenčíne',
  'Lávka pre peších cez Váh v Trenčíne sa zrútila. Nikto nebol zranený, ale odhalilo sa zlé technické stav mostov.',
  'schvalene', 'Top téma! Rozhovor s expertom na mosty.', 'b0000000-0000-0000-0000-000000000003'),

('a0000000-0000-0000-0000-000000000008', '2026-02-16', 'Predražené školské obedy',
  'Rodičia v Bratislave sa sťažujú na kvalitu a cenu školských obedov. Porovnanie cien naprieč Slovenskom.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

('f0000000-0000-0000-0000-000000000003', '2026-02-16', 'TN LIVE: Rozhovor s opozičným lídrom',
  'Exkluzívny rozhovor o pripravovanom hlasovaní o dôvere vláde.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000003'),

-- === 17. feb 2026 (utorok) ===
('a0000000-0000-0000-0000-000000000002', '2026-02-17', 'Nebezpečný pes napadol dieťa v Poprade',
  'Voľne pobehujúci pes rasy americký staford napadol 7-ročné dieťa na sídlisku. Chlapec je v nemocnici.',
  'schvalene', 'Rozhovor s rodičmi a políciou.', 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000005', '2026-02-17', 'Farmári blokujú hranice - protest proti dovozu',
  'Slovenskí farmári zablokovali hraničné priechody s Ukrajinou. Protestujú proti lacným poľnohospodárskym produktom.',
  'schvalene', 'Doplniť vyjadrenie ministerstva pôdohospodárstva.', 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000009', '2026-02-17', 'Nová nemocnica v Martine - oneskorenie',
  'Výstavba novej fakultnej nemocnice v Martine mešká o 2 roky. Náklady narástli o 40%.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000004'),

('a0000000-0000-0000-0000-000000000011', '2026-02-17', 'Únos dieťaťa z materskej školy v Bratislave',
  'Pokus o únos 4-ročného dieťaťa z MŠ na Kramároch. Podozrivý muž utiekol, polícia ho hľadá.',
  'schvalene', 'URGENTNÉ - live vstup ihneď!', 'b0000000-0000-0000-0000-000000000004'),

('e0000000-0000-0000-0000-000000000003', '2026-02-17', 'WEB: Zmeny v daniach od marca 2026',
  'Prehľad najdôležitejších zmien v daňových zákonoch platných od 1. marca.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000004'),

-- === 18. feb 2026 (streda - DNES) ===
('a0000000-0000-0000-0000-000000000003', '2026-02-18', 'Výbuch v chemičke v Novákoch',
  'Výbuch v areáli Fortischem. Evakuácia okolitých obcí v okruhu 5 km. Merajú sa škodlivé látky v ovzduší.',
  'schvalene', 'Hlavná téma dňa! Koordinovať s HaZZ a SHMÚ.', 'b0000000-0000-0000-0000-000000000005'),

('a0000000-0000-0000-0000-000000000006', '2026-02-18', 'Rokovanie vlády - rozpočet na rok 2027',
  'Vláda začala rokovať o návrhu štátneho rozpočtu. Opozícia kritizuje navrhované škrty v sociálnej oblasti.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000005'),

('a0000000-0000-0000-0000-000000000010', '2026-02-18', 'Zatvorenie porodnice v Revúcej',
  'MZ SR oznámilo zatvorenie pôrodnice v Revúcej od marca. Ženy budú musieť cestovať do Rožňavy alebo Rimavskej Soboty.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000012', '2026-02-18', 'Hokejový šampionát - prípravy v Bratislave',
  'Organizátori MS v hokeji predstavili harmonogram príprav. Zimný štadión prechádza rekonštrukciou.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000014', '2026-02-18', 'Divoké prasatá ničia úrodu v Topoľčianskom okrese',
  'Farmári hlásia miliónové škody spôsobené premnožením diviačej zveri. Žiadajú povolenie mimoriadneho odstrelu.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000016', '2026-02-18', 'Kriminalita na východe - prepadnutá pošta',
  'Ozbrojený muž prepadol poštu v Humennom. Odniesol 8 tisíc eur, polícia po ňom pátra.',
  'schvalene', 'Rozhovor s policajným hovorcom.', 'b0000000-0000-0000-0000-000000000005'),

('f0000000-0000-0000-0000-000000000001', '2026-02-18', 'TN LIVE: Situácia v chemičke Nováky',
  'Živé spojenie z miesta výbuchu. Rozhovor s hasičským veliteľom a starostom obce.',
  'schvalene', NULL, 'b0000000-0000-0000-0000-000000000005'),

('e0000000-0000-0000-0000-000000000004', '2026-02-18', 'WEB: Evakuácia Novák - čo robiť',
  'Praktické informácie pre obyvateľov postihnutých evakuáciou - kontakty, evakuačné centrá.',
  'schvalene', 'Publikovať ihneď.', 'b0000000-0000-0000-0000-000000000005'),

-- === 19. feb 2026 (štvrtok - zajtra) ===
('a0000000-0000-0000-0000-000000000007', '2026-02-19', 'Pokračovanie - chemička Nováky',
  'Follow-up k výbuchu. Merania ovzdušia, návrat evakuovaných, vyšetrovanie príčin.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000013', '2026-02-19', 'Otvorenie Národného futbalového štadióna',
  'Slávnostné otvorenie NFS v Bratislave. Priateľský zápas Slovensko - Česko.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000015', '2026-02-19', 'Kauza falšovania potravín na Liptove',
  'ŠVPS odhalila sklad s falšovanými potravinami - falošné bio značky na konvenčných produktoch.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000019', '2026-02-19', 'Nový most cez Dunaj v Komárne',
  'Podpísanie zmluvy na výstavbu nového mosta medzi Komárnom a Komáromom.',
  'caka', NULL, NULL),

-- === 20. feb 2026 (piatok) ===
('a0000000-0000-0000-0000-000000000001', '2026-02-20', 'Povodňové nebezpečenstvo na Váhu',
  'SHMÚ vydal výstrahu 3. stupňa. Hladina Váhu v Žiline dosiahla kritickú úroveň.',
  'caka', NULL, NULL),

('a0000000-0000-0000-0000-000000000020', '2026-02-20', 'Škandál v domove dôchodcov v Prešove',
  'Bývalí zamestnanci prezradili podrobnosti o zlom zaobchádzaní s klientmi zariadenia.',
  'caka', NULL, NULL);

-- =============================================
-- 5. VOĽNÁ (dovolenky a voľno)
-- =============================================

INSERT INTO volna (reporter_id, datum_od, datum_do, dovod) VALUES
-- Aktuálne voľná
('a0000000-0000-0000-0000-000000000018', '2026-02-16', '2026-02-20', 'Dovolenka - rodinná oslava'),
('a0000000-0000-0000-0000-000000000005', '2026-02-18', '2026-02-19', 'Lekárske vyšetrenie'),
('c0000000-0000-0000-0000-000000000001', '2026-02-17', '2026-02-21', 'Dovolenka - lyžovačka'),
('d0000000-0000-0000-0000-000000000003', '2026-02-18', '2026-02-18', 'Osobné voľno'),

-- Minulé voľná
('a0000000-0000-0000-0000-000000000009', '2026-02-02', '2026-02-06', 'Dovolenka'),
('a0000000-0000-0000-0000-000000000014', '2026-02-09', '2026-02-10', 'Náhradné voľno za víkendovú službu'),
('b0000000-0000-0000-0000-000000000006', '2026-02-10', '2026-02-11', 'Školenie vedúcich'),
('e0000000-0000-0000-0000-000000000001', '2026-02-03', '2026-02-07', 'Dovolenka - zahraničie'),
('f0000000-0000-0000-0000-000000000002', '2026-02-12', '2026-02-13', 'Rodinné dôvody'),

-- Budúce voľná
('a0000000-0000-0000-0000-000000000001', '2026-02-23', '2026-02-27', 'Dovolenka - jarné prázdniny'),
('a0000000-0000-0000-0000-000000000007', '2026-02-25', '2026-02-26', 'Sťahovanie'),
('a0000000-0000-0000-0000-000000000012', '2026-03-02', '2026-03-06', 'Dovolenka'),
('a0000000-0000-0000-0000-000000000020', '2026-02-23', '2026-02-24', 'Osobné voľno'),
('d0000000-0000-0000-0000-000000000001', '2026-03-09', '2026-03-13', 'Dovolenka - dovolenkový pobyt'),
('b0000000-0000-0000-0000-000000000004', '2026-03-02', '2026-03-03', 'Konferencia mimo redakcie');

-- =============================================
-- 6. DENNÝ STAV (posledné dni)
-- =============================================

-- 17. feb 2026 (utorok)
INSERT INTO denny_stav (reporter_id, datum, stav, nastavil_id) VALUES
('a0000000-0000-0000-0000-000000000001', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000002', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000003', '2026-02-17', 'nepracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000004', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000005', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000006', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000007', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000008', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000009', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000010', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000011', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000012', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000013', '2026-02-17', 'nepracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000014', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000015', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000016', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000017', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000018', '2026-02-17', 'volno', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000019', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('a0000000-0000-0000-0000-000000000020', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('c0000000-0000-0000-0000-000000000001', '2026-02-17', 'volno', 'b0000000-0000-0000-0000-000000000004'),
('c0000000-0000-0000-0000-000000000002', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('e0000000-0000-0000-0000-000000000001', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('e0000000-0000-0000-0000-000000000002', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('e0000000-0000-0000-0000-000000000003', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('f0000000-0000-0000-0000-000000000001', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('f0000000-0000-0000-0000-000000000002', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004'),
('f0000000-0000-0000-0000-000000000003', '2026-02-17', 'pracujuci', 'b0000000-0000-0000-0000-000000000004');

-- 18. feb 2026 (streda - DNES)
INSERT INTO denny_stav (reporter_id, datum, stav, nastavil_id) VALUES
('a0000000-0000-0000-0000-000000000001', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000002', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000003', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000004', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000005', '2026-02-18', 'volno', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000006', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000007', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000008', '2026-02-18', 'nepracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000009', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000010', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000011', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000012', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000013', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000014', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000015', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000016', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000017', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000018', '2026-02-18', 'volno', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000019', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('a0000000-0000-0000-0000-000000000020', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('c0000000-0000-0000-0000-000000000001', '2026-02-18', 'volno', 'b0000000-0000-0000-0000-000000000005'),
('c0000000-0000-0000-0000-000000000002', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('d0000000-0000-0000-0000-000000000001', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('d0000000-0000-0000-0000-000000000002', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('d0000000-0000-0000-0000-000000000003', '2026-02-18', 'volno', 'b0000000-0000-0000-0000-000000000005'),
('d0000000-0000-0000-0000-000000000004', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('e0000000-0000-0000-0000-000000000001', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('e0000000-0000-0000-0000-000000000002', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('e0000000-0000-0000-0000-000000000003', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('e0000000-0000-0000-0000-000000000004', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('f0000000-0000-0000-0000-000000000001', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005'),
('f0000000-0000-0000-0000-000000000002', '2026-02-18', 'nepracujuci', 'b0000000-0000-0000-0000-000000000005'),
('f0000000-0000-0000-0000-000000000003', '2026-02-18', 'pracujuci', 'b0000000-0000-0000-0000-000000000005');

-- =============================================
-- Obnoviť trigger na vytváranie profilu
-- =============================================
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- Obnoviť RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- =============================================
-- HOTOVO! Seed data boli úspešne vložené.
-- 
-- Prihlásenie: email = celý email, heslo = časť pred @
-- Napr.: Alexander.Kopunec@markiza.sk / Alexander.Kopunec
--
-- Roly:
--   admin: Alexander Kopunec
--   veduci: Janíková, Kajanková, Ferencáková, Nejedlá, Poliaková, Šprochová
--   reporter: všetci ostatní (30 používateľov)
-- =============================================
