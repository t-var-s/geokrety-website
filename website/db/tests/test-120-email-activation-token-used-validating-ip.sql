-- Start transaction and plan the tests.

BEGIN;

-- SELECT * FROM no_plan();
SELECT plan(112);

INSERT INTO "gk_users" ("id", "username", "registration_ip") VALUES (1, 'test 1', '127.0.0.1');

-- used 0 require requesting_ip an created_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (1, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (2, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (3, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (4, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (5, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (6, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (7, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (8, 1, 'test@geokrety.org', 0, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (9, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (10, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (11, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (12, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (13, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (14, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (15, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (16, 1, 'test@geokrety.org', 0, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 1 require updating_ip an used_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (17, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (18, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (19, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (20, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (21, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (22, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (23, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (24, 1, 'test@geokrety.org', 1, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (25, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (26, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (27, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (28, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (29, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (30, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (31, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (32, 1, 'test@geokrety.org', 1, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 2 require reverting_ip an reverted_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (33, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (34, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (35, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (36, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (37, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (38, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (39, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (40, 1, 'test@geokrety.org', 2, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (41, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (42, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (43, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (44, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (45, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (46, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (47, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (48, 1, 'test@geokrety.org', 2, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 3 require reverting_ip an reverted_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (49, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (50, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (51, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (52, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (53, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (54, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (55, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (56, 1, 'test@geokrety.org', 3, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (57, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (58, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (59, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (60, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (61, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (62, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (63, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (64, 1, 'test@geokrety.org', 3, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 4 require reverting_ip an reverted_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (65, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (66, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (67, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (68, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (69, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (70, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (71, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (72, 1, 'test@geokrety.org', 4, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (73, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (74, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (75, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (76, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (77, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (78, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (79, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (70, 1, 'test@geokrety.org', 4, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 5 require reverting_ip an reverted_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (80, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (81, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (82, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (83, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (84, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (85, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (86, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (87, 1, 'test@geokrety.org', 5, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (88, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (89, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (90, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (91, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (92, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (93, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (94, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (95, 1, 'test@geokrety.org', 5, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);

-- used 6 require reverting_ip an reverted_on_datetime
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (96, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (97, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (98, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (99, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (100, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (101, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (102, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (103, 1, 'test@geokrety.org', 6, '127.0.0.1', NULL, NULL, NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (104, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (105, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (106, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', NULL)$$);
SELECT lives_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (107, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', '2020-04-07 00:00:00+00', '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (108, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (109, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', NULL, '127.0.0.1', NULL)$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (110, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', NULL, NULL, '2020-04-07 00:00:00+00')$$);
SELECT throws_ok($$INSERT INTO "gk_email_activation" ("id", "user", "_email", "used", "requesting_ip", "updating_ip", "used_on_datetime", "reverting_ip", "reverted_on_datetime") VALUES (111, 1, 'test@geokrety.org', 6, '127.0.0.1', '127.0.0.1', NULL, NULL, NULL)$$);


-- TODO: cron to set used=expired

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK;
