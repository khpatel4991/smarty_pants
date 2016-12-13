CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "adults" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar DEFAULT '' NOT NULL, "last_name" varchar DEFAULT '' NOT NULL, "email" varchar DEFAULT '' NOT NULL, "account_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_adults_on_account_id" ON "adults" ("account_id");
CREATE TABLE "credentials" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar DEFAULT '' NOT NULL, "password_digest" varchar DEFAULT '' NOT NULL, "owner_id" integer DEFAULT NULL NOT NULL, "owner_type" varchar DEFAULT '' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX index_credentials_on_username ON credentials (lower(username));
INSERT INTO schema_migrations (version) VALUES ('20160113102413');

INSERT INTO schema_migrations (version) VALUES ('20160116144928');

INSERT INTO schema_migrations (version) VALUES ('20160116151936');

