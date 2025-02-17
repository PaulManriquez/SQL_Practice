CREATE TABLE IF NOT EXISTS "Users" (
    "id" SERIAL PRIMARY KEY,
    "User_Name" VARCHAR NOT NULL,
    "CreatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "posts" (
    "id" SERIAL PRIMARY KEY,
    "Title" VARCHAR NOT NULL,
    "CreatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Url" VARCHAR NOT NULL,
    "User_id" INTEGER NOT NULL,
    "Caption" VARCHAR NOT NULL,
    "Lat" REAL,
    "Ing" REAL,
	FOREIGN KEY ("User_id") references "Users"("id")
);

CREATE TABLE IF NOT EXISTS "Comments" (
    "id" SERIAL PRIMARY KEY,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "content" VARCHAR NOT NULL,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,
	FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
	FOREIGN KEY ("post_id") REFERENCES "posts"("id")
);

CREATE TABLE IF NOT EXISTS "reactions_likes" (
    "id" SERIAL PRIMARY KEY,
    "type" VARCHAR NOT NULL,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,
    "comment_id" INTEGER NOT NULL,
	FOREIGN KEY ("user_id") references "Users"("id"),
	FOREIGN KEY ("post_id") references "posts"("id"),
	FOREIGN KEY ("comment_id") references "Comments"("id")
);

CREATE TABLE IF NOT EXISTS "photo_tags" (
    "id" SERIAL PRIMARY KEY,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "post_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "x" REAL,
    "y" REAL,
	FOREIGN KEY ("post_id") REFERENCES "posts"("id"),
	FOREIGN KEY ("user_id") REFERENCES "Users"("id")
);

CREATE TABLE IF NOT EXISTS "CaptionTags" (
    "id" SERIAL PRIMARY KEY,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "post_id" INTEGER NOT NULL,
    "user_id" INTEGER,
	FOREIGN KEY ("post_id") REFERENCES "posts"("id"),
	FOREIGN KEY ("user_id") REFERENCES "Users"("id")
);


