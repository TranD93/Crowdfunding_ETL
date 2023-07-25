-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/D1M4Yp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical

CREATE TABLE "Contacts" (
    "contact_ID" INT,   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "email" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_ID"
     )
);

CREATE TABLE "Campaign" (
    "cf_ID" INT   NOT NULL,
    "contact_ID" INT   NOT NULL,
    "company_name" VARCHAR(255)   NOT NULL,
    "description" VARCHAR(255)   NOT NULL,
    "goal" INT   NOT NULL,
    "pledged" INT   NOT NULL,
    "outcome" VARCHAR(255)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    "currency" VARCHAR(255)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_ID" VARCHAR(255)   NOT NULL,
    "subcategory_ID" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_ID"
     )
);

CREATE TABLE "Category" (
    "category_ID" VARCHAR(255)   NOT NULL,
    "category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_ID","category_name"
     )
);

CREATE TABLE "Sub_Category" (
    "sub_category_ID" VARCHAR(255)   NOT NULL,
    "sub_category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Sub_Category" PRIMARY KEY (
        "sub_category_ID","sub_category_name"
     )
);

ALTER TABLE "Contacts" ADD CONSTRAINT "fk_Contacts_contact_ID" FOREIGN KEY("contact_ID")
REFERENCES "Campaign" ("contact_ID");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_ID" FOREIGN KEY("category_ID")
REFERENCES "Category" ("category_ID");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_ID" FOREIGN KEY("subcategory_ID")
REFERENCES "Sub_Category" ("sub_category_ID");

