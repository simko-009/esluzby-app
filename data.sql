
-- =============================================
-- Mock data (development/local testing)
-- =============================================
-- Note: FK to auth.users is temporarily bypassed so the data can be loaded quickly.
SET session_replication_role = replica;

-- Profily
INSERT INTO profiles (id, email, meno, priezvisko, rola, telefon)
VALUES
  (gen_random_uuid(), 'Michal.Bujna@markizatv.sk', 'Michal', 'Bujna', 'reporter', '+421900111001'),
  (gen_random_uuid(), 'nikola.capekova@markizatv.sk', 'Nikola', 'Capekova', 'reporter', '+421900111002'),
  (gen_random_uuid(), 'jana.cerovska@markizatv.sk', 'Jana', 'Cerovska', 'reporter', '+421900111003'),
  (gen_random_uuid(), 'Jozef.Demeter@markizatv.sk', 'Jozef', 'Demeter', 'reporter', '+421900111004'),
  (gen_random_uuid(), 'Juraj.Fazekas@markizatv.sk', 'Juraj', 'Fazekas', 'reporter', '+421900111005'),
  (gen_random_uuid(), 'Lubomir.Fronko@markizatv.sk', 'Lubomir', 'Fronko', 'reporter', '+421900111006'),
  (gen_random_uuid(), 'Michal.Hrenovcik@markizatv.sk', 'Michal', 'Hrenovcik', 'reporter', '+421900111007'),
  (gen_random_uuid(), 'Martin.Jedinak@markizatv.sk', 'Martin', 'Jedinak', 'reporter', '+421900111008'),
  (gen_random_uuid(), 'Veronika.Kandracova@markizatv.sk', 'Veronika', 'Kandracova', 'reporter', '+421900111009'),
  (gen_random_uuid(), 'Martina.Kasiarova@markizatv.sk', 'Martina', 'Kasiarova', 'reporter', '+421900111010'),
  (gen_random_uuid(), 'Mario.Kermiet@markizatv.sk', 'Mario', 'Kermiet', 'reporter', '+421900111011'),
  (gen_random_uuid(), 'Monika.Kolekova@markizatv.sk', 'Monika', 'Kolekova', 'reporter', '+421900111012'),
  (gen_random_uuid(), 'Karol.Mindak@markizatv.sk', 'Karol', 'Mindak', 'reporter', '+421900111013'),
  (gen_random_uuid(), 'Roman.Ruttkay@markizatv.sk', 'Roman', 'Ruttkay', 'reporter', '+421900111014'),
  (gen_random_uuid(), 'Marek.Silhavik@markizatv.sk', 'Marek', 'Silhavik', 'reporter', '+421900111015'),
  (gen_random_uuid(), 'Pavol.Sivak@markizatv.sk', 'Pavol', 'Sivak', 'reporter', '+421900111016'),
  (gen_random_uuid(), 'Veronika.Tesakova@markizatv.sk', 'Veronika', 'Tesakova', 'reporter', '+421900111017'),
  (gen_random_uuid(), 'Jan.Tribula@markiza.sk', 'Jan', 'Tribula', 'reporter', '+421900111018'),
  (gen_random_uuid(), 'Marek.Vnencak@markizatv.sk', 'Marek', 'Vnencak', 'reporter', '+421900111019'),
  (gen_random_uuid(), 'Peter.Ziman@markizatv.sk', 'Peter', 'Ziman', 'reporter', '+421900111020'),
  (gen_random_uuid(), 'Alexander.Kopunec@markiza.sk', 'Alexander', 'Kopunec', 'veduci', '+421900222001'),
  (gen_random_uuid(), 'Lubica.Janikova@markiza.sk', 'Lubica', 'Janikova', 'veduci', '+421900222002'),
  (gen_random_uuid(), 'Silvia.Kajankova@markiza.sk', 'Silvia', 'Kajankova', 'veduci', '+421900222003'),
  (gen_random_uuid(), 'Zuzana.Ferencakova@markiza.sk', 'Zuzana', 'Ferencakova', 'veduci', '+421900222004'),
  (gen_random_uuid(), 'Danica.Nejedla@markiza.sk', 'Danica', 'Nejedla', 'veduci', '+421900222005'),
  (gen_random_uuid(), 'Viera.Poliakova@markiza.sk', 'Viera', 'Poliakova', 'veduci', '+421900222006'),
  (gen_random_uuid(), 'Andrea.Sprochova@markiza.sk', 'Andrea', 'Sprochova', 'veduci', '+421900222007'),
  (gen_random_uuid(), 'Peter.Hosek@markizatv.sk', 'Peter', 'Hosek', 'reporter', '+421900333001'),
  (gen_random_uuid(), 'Petra.Ragulova@markiza.sk', 'Petra', 'Ragulova', 'reporter', '+421900333002'),
  (gen_random_uuid(), 'Lucia.Srnova@markiza.sk', 'Lucia', 'Srnova', 'reporter', '+421900444001'),
  (gen_random_uuid(), 'David.Sirucek@markiza.sk', 'David', 'Sirucek', 'reporter', '+421900444002'),
  (gen_random_uuid(), 'Sindy.Molokac@markiza.sk', 'Sindy', 'Molokac', 'reporter', '+421900444003'),
  (gen_random_uuid(), 'Karol.Molnar@markiza.sk', 'Karol', 'Molnar', 'reporter', '+421900444004'),
  (gen_random_uuid(), 'martin.celiga@markiza.sk', 'Martin', 'Celiga', 'reporter', '+421900555001'),
  (gen_random_uuid(), 'Ivan.Cernansky@markiza.sk', 'Ivan', 'Cernansky', 'reporter', '+421900555002'),
  (gen_random_uuid(), 'Alexandra.Murajdova@markiza.sk', 'Alexandra', 'Murajdova', 'reporter', '+421900555003'),
  (gen_random_uuid(), 'Katarina.Acs@markiza.sk', 'Katarina', 'Acs', 'reporter', '+421900555004'),
  (gen_random_uuid(), 'Lukas.Zuzelka@markizatv.sk', 'Lukas', 'Zuzelka', 'reporter', '+421900666001'),
  (gen_random_uuid(), 'Marcel.Marcisiak@markizatv.sk', 'Marcel', 'Marcisiak', 'reporter', '+421900666002'),
  (gen_random_uuid(), 'Marek.Marusiak@markizatv.sk', 'Marek', 'Marusiak', 'reporter', '+421900666003');

-- Veduci dňa (najbližší týždeň)
INSERT INTO veduci_dna (id, datum, veduci_id)
VALUES
  (gen_random_uuid(), '2026-02-15', (SELECT id FROM profiles WHERE email = 'Alexander.Kopunec@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-16', (SELECT id FROM profiles WHERE email = 'Lubica.Janikova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-17', (SELECT id FROM profiles WHERE email = 'Silvia.Kajankova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-18', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-19', (SELECT id FROM profiles WHERE email = 'Danica.Nejedla@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-20', (SELECT id FROM profiles WHERE email = 'Viera.Poliakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), '2026-02-21', (SELECT id FROM profiles WHERE email = 'Andrea.Sprochova@markiza.sk' LIMIT 1));

-- Denný stav (vybratí reportéri)
INSERT INTO denny_stav (id, reporter_id, datum, stav, nastavil_id)
VALUES
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Michal.Bujna@markizatv.sk' LIMIT 1), '2026-02-18', 'pracujuci', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Nikola.Capekova@markizatv.sk' LIMIT 1), '2026-02-18', 'pracujuci', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Jana.Cerovska@markizatv.sk' LIMIT 1), '2026-02-18', 'volno', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Juraj.Fazekas@markizatv.sk' LIMIT 1), '2026-02-18', 'nepracujuci', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Martin.Jedinak@markizatv.sk' LIMIT 1), '2026-02-18', 'pracujuci', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Veronika.Kandracova@markizatv.sk' LIMIT 1), '2026-02-18', 'pracujuci', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Marek.Silhavik@markizatv.sk' LIMIT 1), '2026-02-18', 'volno', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1));

-- Voľná
INSERT INTO volna (id, reporter_id, datum_od, datum_do, dovod)
VALUES
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Jana.Cerovska@markizatv.sk' LIMIT 1), '2026-02-17', '2026-02-20', 'Dovolenka - lyžovačka'),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Marek.Silhavik@markizatv.sk' LIMIT 1), '2026-02-18', '2026-02-19', 'Lekárske vyšetrenie'),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Peter.Ziman@markizatv.sk' LIMIT 1), '2026-02-21', '2026-02-23', 'Rodinné povinnosti'),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Lucia.Srnova@markiza.sk' LIMIT 1), '2026-02-15', '2026-02-16', 'Team offsite'),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Marcel.Marcisiak@markizatv.sk' LIMIT 1), '2026-02-24', '2026-02-25', 'Karanténa');

-- Témy (reportáže)
INSERT INTO temy (id, reporter_id, datum, nazov, popis, stav, poznamka_veduceho, schvalil_id)
VALUES
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Michal.Bujna@markizatv.sk' LIMIT 1), '2026-02-18', 'Snehová kalamita na Orave', 'Živé vstupy z uzavretých úsekov, reakcie vodičov.', 'schvalene', 'Pridať dronové zábery.', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Nikola.Capekova@markizatv.sk' LIMIT 1), '2026-02-18', 'Kontroly energií na školách', 'Ako mestá šetria na vykurovaní, rozhovor s riaditeľmi.', 'caka', NULL, NULL),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Juraj.Fazekas@markizatv.sk' LIMIT 1), '2026-02-18', 'Rozpadnutý most v regióne', 'Aktualizácia stavu opráv a dočasných obchádzok.', 'neschvalene', 'Treba viac potvrdení od SSC.', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Veronika.Kandracova@markizatv.sk' LIMIT 1), '2026-02-19', 'Sčítanie obyvateľov - posledná vlna', 'Reakcie obcí na nedodané formuláre.', 'caka', NULL, NULL),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Martin.Jedinak@markizatv.sk' LIMIT 1), '2026-02-19', 'Nové priemyselné parky', 'Konkurenčný boj o investora v troch okresoch.', 'schvalene', 'Doplniť grafiku s číslami.', (SELECT id FROM profiles WHERE email = 'Danica.Nejedla@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Pavol.Sivak@markizatv.sk' LIMIT 1), '2026-02-20', 'Hokejové derby v extralige', 'Preview zápasu s fanúšikmi a trénermi.', 'caka', NULL, NULL),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Marek.Vnencak@markizatv.sk' LIMIT 1), '2026-02-20', 'Protest zdravotných sestier', 'Zbierame podpisy, reakcie ministerstva.', 'schvalene', 'Zabezpečiť stanovisko komory.', (SELECT id FROM profiles WHERE email = 'Viera.Poliakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Mario.Kermiet@markizatv.sk' LIMIT 1), '2026-02-21', 'Kvalita pitnej vody', 'Merania v obciach, kde sa šetrí na údržbe.', 'caka', NULL, NULL),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Monika.Kolekova@markizatv.sk' LIMIT 1), '2026-02-21', 'Zvýšené ceny MHD', 'Ako sa zmenili ceny lístkov a reakcie cestujúcich.', 'schvalene', 'Urobiť porovnanie s Košicami.', (SELECT id FROM profiles WHERE email = 'Andrea.Sprochova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Karol.Mindak@markizatv.sk' LIMIT 1), '2026-02-22', 'Digitalizácia matrík', 'Pilotný projekt na východe, skúsenosti úradov.', 'caka', NULL, NULL),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Alexandra.Murajdova@markiza.sk' LIMIT 1), '2026-02-18', 'Online podvodníci', 'Príbehy obetí a návod polície ako sa brániť.', 'schvalene', 'Pridať UX screenshoty stránok.', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1)),
  (gen_random_uuid(), (SELECT id FROM profiles WHERE email = 'Lukas.Zuzelka@markizatv.sk' LIMIT 1), '2026-02-18', 'TN Live: ranný spravodajský blok', 'Hosť: minister dopravy, témy diaľnice a vlaky.', 'schvalene', 'Pripraviť podklady pre štúdio.', (SELECT id FROM profiles WHERE email = 'Zuzana.Ferencakova@markiza.sk' LIMIT 1));

SET session_replication_role = DEFAULT;
