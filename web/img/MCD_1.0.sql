-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-10-19 13:40:05.451

-- tables
-- Table: address_client
CREATE TABLE address_client (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    client_id int NOT NULL,
    address_label_1 varchar(255) NOT NULL,
    address_label_2 varchar(255) NOT NULL,
    address_label_3 varchar(255) NOT NULL,
    postal_code varchar(32) NOT NULL,
    city_name varchar(255) NOT NULL,
    country_id int NOT NULL,
    address_type_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT address_client_pk PRIMARY KEY (id)
);

-- Table: address_type
CREATE TABLE address_type (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT address_type_pk PRIMARY KEY (id)
);

-- Table: address_user
CREATE TABLE address_user (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    user_id int NOT NULL,
    address_label_1 varchar(255) NOT NULL,
    address_label_2 varchar(255) NOT NULL,
    address_label_3 varchar(255) NOT NULL,
    postal_code varchar(32) NOT NULL,
    city_name varchar(255) NOT NULL,
    country_id int NOT NULL,
    address_type_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT address_user_pk PRIMARY KEY (id)
);

-- Table: client
CREATE TABLE client (
    id int NOT NULL AUTO_INCREMENT,
    reference varchar(255) NOT NULL,
    email varchar(256) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    company_name varchar(255) NULL,
    description text NOT NULL,
    client_type_id int NOT NULL,
    vat_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id)
);

-- Table: client_type
CREATE TABLE client_type (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT client_type_pk PRIMARY KEY (id)
);

-- Table: concept
CREATE TABLE concept (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description text NOT NULL,
    status_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT concept_pk PRIMARY KEY (id)
);

-- Table: concept_media
CREATE TABLE concept_media (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description text NOT NULL,
    comment text NOT NULL,
    media_path text NOT NULL,
    concept_id int NOT NULL,
    concept_media_type_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT concept_media_pk PRIMARY KEY (id)
);

-- Table: concept_media_type
CREATE TABLE concept_media_type (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT concept_media_type_pk PRIMARY KEY (id)
);

-- Table: concept_product
CREATE TABLE concept_product (
    id int NOT NULL,
    concept_id int NOT NULL,
    product_id int NOT NULL,
    is_mandatory bool NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT concept_product_pk PRIMARY KEY (id)
);

-- Table: concept_status
CREATE TABLE concept_status (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT concept_status_pk PRIMARY KEY (id)
);

-- Table: country
CREATE TABLE country (
    id int NOT NULL AUTO_INCREMENT,
    label varchar(255) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (id)
);

-- Table: note
CREATE TABLE note (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    note_comment text NOT NULL,
    order_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT note_pk PRIMARY KEY (id)
);

-- Table: order
CREATE TABLE `order` (
    id int NOT NULL AUTO_INCREMENT,
    client_id int NOT NULL,
    order_type_id int NOT NULL,
    current_status_id int NOT NULL,
    address_invoicing_id int NOT NULL,
    address_shipping_id int NOT NULL,
    products_total_price_ht decimal(8,2) NOT NULL,
    delivery_price_ht decimal(8,2) NOT NULL,
    discount_price_ht decimal(8,2) NOT NULL,
    final_price_ht decimal(8,2) NOT NULL,
    final_price_ttc int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NULL,
    validated_at timestamp NULL,
    deleted_at timestamp NULL,
    CONSTRAINT order_pk PRIMARY KEY (id)
);

-- Table: order_line
CREATE TABLE order_line (
    id int NOT NULL AUTO_INCREMENT,
    order_id int NOT NULL,
    product_id int NOT NULL,
    quanitity decimal(8,2) NOT NULL,
    price_per_unit_ht decimal(8,2) NOT NULL,
    price_per_unit_ttc decimal(8,2) NOT NULL,
    price_ht decimal(8,2) NOT NULL,
    price_ttc decimal(8,2) NOT NULL,
    supplier_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    UNIQUE INDEX shipmet_details_ak_1 (order_id,product_id),
    CONSTRAINT order_line_pk PRIMARY KEY (id)
);

-- Table: order_status
CREATE TABLE order_status (
    id int NOT NULL AUTO_INCREMENT,
    label_id int NOT NULL,
    name varchar(255) NOT NULL,
    order_id int NOT NULL,
    status_time timestamp NOT NULL,
    comment text NULL,
    CONSTRAINT order_status_pk PRIMARY KEY (id)
);

-- Table: order_status_label
CREATE TABLE order_status_label (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT order_status_label_pk PRIMARY KEY (id)
);

-- Table: order_type
CREATE TABLE order_type (
    id int NOT NULL AUTO_INCREMENT,
    label varchar(255) NOT NULL,
    CONSTRAINT order_type_pk PRIMARY KEY (id)
) COMMENT 'e.g. send after payment, charge after delivery, ...';

-- Table: product
CREATE TABLE product (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    short_description varchar(255) NOT NULL,
    long_description text NOT NULL,
    sku varchar(255) NOT NULL,
    supplier_reference varchar(255) NOT NULL,
    status_id int NOT NULL,
    price_per_unit_ht decimal(8,2) NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id)
);

-- Table: product_media
CREATE TABLE product_media (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description text NOT NULL,
    comment text NOT NULL,
    media_path text NOT NULL,
    product_id int NOT NULL,
    product_media_type_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT product_media_pk PRIMARY KEY (id)
);

-- Table: product_media_type
CREATE TABLE product_media_type (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT product_media_type_pk PRIMARY KEY (id)
);

-- Table: product_status
CREATE TABLE product_status (
    id int NOT NULL AUTO_INCREMENT,
    label varchar(255) NOT NULL,
    CONSTRAINT product_status_pk PRIMARY KEY (id)
);

-- Table: supplier
CREATE TABLE supplier (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    status_id int NOT NULL,
    creator_id int NOT NULL,
    updator_id int NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (id)
);

-- Table: supplier_product
CREATE TABLE supplier_product (
    id int NOT NULL,
    supplier_id int NOT NULL,
    product_id int NOT NULL,
    rank int NOT NULL,
    stock int NOT NULL,
    CONSTRAINT supplier_product_pk PRIMARY KEY (id)
);

-- Table: supplier_status
CREATE TABLE supplier_status (
    id int NOT NULL,
    label int NOT NULL,
    CONSTRAINT supplier_status_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE user (
    id int NOT NULL,
    login varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    user_type_id int NOT NULL,
    roles text NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    deleted_at timestamp NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- Table: user_type
CREATE TABLE user_type (
    id int NOT NULL,
    label varchar(255) NOT NULL,
    CONSTRAINT user_type_pk PRIMARY KEY (id)
);

-- Table: vat
CREATE TABLE vat (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    rate decimal(8,2) NOT NULL,
    CONSTRAINT vat_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: address_client_address_type (table: address_client)
ALTER TABLE address_client ADD CONSTRAINT address_client_address_type FOREIGN KEY address_client_address_type (address_type_id)
    REFERENCES address_type (id);

-- Reference: address_client_client (table: address_client)
ALTER TABLE address_client ADD CONSTRAINT address_client_client FOREIGN KEY address_client_client (client_id)
    REFERENCES client (id);

-- Reference: address_client_creator (table: address_client)
ALTER TABLE address_client ADD CONSTRAINT address_client_creator FOREIGN KEY address_client_creator (creator_id)
    REFERENCES user (id);

-- Reference: address_client_updator (table: address_client)
ALTER TABLE address_client ADD CONSTRAINT address_client_updator FOREIGN KEY address_client_updator (updator_id)
    REFERENCES user (id);

-- Reference: address_user_address_type (table: address_user)
ALTER TABLE address_user ADD CONSTRAINT address_user_address_type FOREIGN KEY address_user_address_type (address_type_id)
    REFERENCES address_type (id);

-- Reference: address_user_country (table: address_user)
ALTER TABLE address_user ADD CONSTRAINT address_user_country FOREIGN KEY address_user_country (country_id)
    REFERENCES country (id);

-- Reference: address_user_user (table: address_user)
ALTER TABLE address_user ADD CONSTRAINT address_user_user FOREIGN KEY address_user_user (user_id)
    REFERENCES user (id);

-- Reference: city_country (table: address_client)
ALTER TABLE address_client ADD CONSTRAINT city_country FOREIGN KEY city_country (country_id)
    REFERENCES country (id);

-- Reference: client_client_type (table: client)
ALTER TABLE client ADD CONSTRAINT client_client_type FOREIGN KEY client_client_type (client_type_id)
    REFERENCES client_type (id);

-- Reference: client_creator (table: client)
ALTER TABLE client ADD CONSTRAINT client_creator FOREIGN KEY client_creator (creator_id)
    REFERENCES user (id);

-- Reference: client_updator (table: client)
ALTER TABLE client ADD CONSTRAINT client_updator FOREIGN KEY client_updator (updator_id)
    REFERENCES user (id);

-- Reference: client_vat (table: client)
ALTER TABLE client ADD CONSTRAINT client_vat FOREIGN KEY client_vat (vat_id)
    REFERENCES vat (id);

-- Reference: concept_concept_status (table: concept)
ALTER TABLE concept ADD CONSTRAINT concept_concept_status FOREIGN KEY concept_concept_status (status_id)
    REFERENCES concept_status (id);

-- Reference: concept_creator (table: concept)
ALTER TABLE concept ADD CONSTRAINT concept_creator FOREIGN KEY concept_creator (creator_id)
    REFERENCES user (id);

-- Reference: concept_media_concept (table: concept_media)
ALTER TABLE concept_media ADD CONSTRAINT concept_media_concept FOREIGN KEY concept_media_concept (concept_id)
    REFERENCES concept (id);

-- Reference: concept_media_concept_media_type (table: concept_media)
ALTER TABLE concept_media ADD CONSTRAINT concept_media_concept_media_type FOREIGN KEY concept_media_concept_media_type (concept_media_type_id)
    REFERENCES concept_media_type (id);

-- Reference: concept_media_creator (table: concept_media)
ALTER TABLE concept_media ADD CONSTRAINT concept_media_creator FOREIGN KEY concept_media_creator (creator_id)
    REFERENCES user (id);

-- Reference: concept_media_updator (table: concept_media)
ALTER TABLE concept_media ADD CONSTRAINT concept_media_updator FOREIGN KEY concept_media_updator (updator_id)
    REFERENCES user (id);

-- Reference: concept_product_concept (table: concept_product)
ALTER TABLE concept_product ADD CONSTRAINT concept_product_concept FOREIGN KEY concept_product_concept (concept_id)
    REFERENCES concept (id);

-- Reference: concept_product_creator (table: concept_product)
ALTER TABLE concept_product ADD CONSTRAINT concept_product_creator FOREIGN KEY concept_product_creator (creator_id)
    REFERENCES user (id);

-- Reference: concept_product_product (table: concept_product)
ALTER TABLE concept_product ADD CONSTRAINT concept_product_product FOREIGN KEY concept_product_product (product_id)
    REFERENCES product (id);

-- Reference: concept_product_updator (table: concept_product)
ALTER TABLE concept_product ADD CONSTRAINT concept_product_updator FOREIGN KEY concept_product_updator (updator_id)
    REFERENCES user (id);

-- Reference: concept_updator (table: concept)
ALTER TABLE concept ADD CONSTRAINT concept_updator FOREIGN KEY concept_updator (updator_id)
    REFERENCES user (id);

-- Reference: note_creator (table: note)
ALTER TABLE note ADD CONSTRAINT note_creator FOREIGN KEY note_creator (creator_id)
    REFERENCES user (id);

-- Reference: note_order (table: note)
ALTER TABLE note ADD CONSTRAINT note_order FOREIGN KEY note_order (order_id)
    REFERENCES `order` (id);

-- Reference: note_updator (table: note)
ALTER TABLE note ADD CONSTRAINT note_updator FOREIGN KEY note_updator (updator_id)
    REFERENCES user (id);

-- Reference: order_address_client (table: order)
ALTER TABLE `order` ADD CONSTRAINT order_address_client FOREIGN KEY order_address_client (address_shipping_id)
    REFERENCES address_client (id);

-- Reference: order_address_user (table: order)
ALTER TABLE `order` ADD CONSTRAINT order_address_user FOREIGN KEY order_address_user (address_invoicing_id)
    REFERENCES address_user (id);

-- Reference: order_creator (table: order)
ALTER TABLE `order` ADD CONSTRAINT order_creator FOREIGN KEY order_creator (creator_id)
    REFERENCES user (id);

-- Reference: order_line_creator (table: order_line)
ALTER TABLE order_line ADD CONSTRAINT order_line_creator FOREIGN KEY order_line_creator (creator_id)
    REFERENCES user (id);

-- Reference: order_line_supplier (table: order_line)
ALTER TABLE order_line ADD CONSTRAINT order_line_supplier FOREIGN KEY order_line_supplier (supplier_id)
    REFERENCES supplier (id);

-- Reference: order_line_updator (table: order_line)
ALTER TABLE order_line ADD CONSTRAINT order_line_updator FOREIGN KEY order_line_updator (updator_id)
    REFERENCES user (id);

-- Reference: order_order_status (table: order)
ALTER TABLE `order` ADD CONSTRAINT order_order_status FOREIGN KEY order_order_status (current_status_id)
    REFERENCES order_status (id);

-- Reference: order_status_order_status_label (table: order_status)
ALTER TABLE order_status ADD CONSTRAINT order_status_order_status_label FOREIGN KEY order_status_order_status_label (label_id)
    REFERENCES order_status_label (id);

-- Reference: order_updator (table: order)
ALTER TABLE `order` ADD CONSTRAINT order_updator FOREIGN KEY order_updator (updator_id)
    REFERENCES user (id);

-- Reference: product_image_product (table: product_media)
ALTER TABLE product_media ADD CONSTRAINT product_image_product FOREIGN KEY product_image_product (product_id)
    REFERENCES product (id);

-- Reference: product_media_creator (table: product_media)
ALTER TABLE product_media ADD CONSTRAINT product_media_creator FOREIGN KEY product_media_creator (creator_id)
    REFERENCES user (id);

-- Reference: product_media_product_media_type (table: product_media)
ALTER TABLE product_media ADD CONSTRAINT product_media_product_media_type FOREIGN KEY product_media_product_media_type (product_media_type_id)
    REFERENCES product_media_type (id);

-- Reference: product_media_updator (table: product_media)
ALTER TABLE product_media ADD CONSTRAINT product_media_updator FOREIGN KEY product_media_updator (updator_id)
    REFERENCES user (id);

-- Reference: product_product_type (table: product)
ALTER TABLE product ADD CONSTRAINT product_product_type FOREIGN KEY product_product_type (status_id)
    REFERENCES product_status (id);

-- Reference: product_updator (table: product)
ALTER TABLE product ADD CONSTRAINT product_updator FOREIGN KEY product_updator (updator_id)
    REFERENCES user (id);

-- Reference: product_user (table: product)
ALTER TABLE product ADD CONSTRAINT product_user FOREIGN KEY product_user (creator_id)
    REFERENCES user (id);

-- Reference: shipment_client (table: order)
ALTER TABLE `order` ADD CONSTRAINT shipment_client FOREIGN KEY shipment_client (client_id)
    REFERENCES client (id);

-- Reference: shipment_shipment_type (table: order)
ALTER TABLE `order` ADD CONSTRAINT shipment_shipment_type FOREIGN KEY shipment_shipment_type (order_type_id)
    REFERENCES order_type (id);

-- Reference: shipment_status_shipment (table: order_status)
ALTER TABLE order_status ADD CONSTRAINT shipment_status_shipment FOREIGN KEY shipment_status_shipment (order_id)
    REFERENCES `order` (id);

-- Reference: shipmet_details_product (table: order_line)
ALTER TABLE order_line ADD CONSTRAINT shipmet_details_product FOREIGN KEY shipmet_details_product (product_id)
    REFERENCES product (id);

-- Reference: shipmet_details_shipment (table: order_line)
ALTER TABLE order_line ADD CONSTRAINT shipmet_details_shipment FOREIGN KEY shipmet_details_shipment (order_id)
    REFERENCES `order` (id);

-- Reference: supplier_creator (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_creator FOREIGN KEY supplier_creator (creator_id)
    REFERENCES user (id);

-- Reference: supplier_product_product (table: supplier_product)
ALTER TABLE supplier_product ADD CONSTRAINT supplier_product_product FOREIGN KEY supplier_product_product (product_id)
    REFERENCES product (id);

-- Reference: supplier_product_supplier (table: supplier_product)
ALTER TABLE supplier_product ADD CONSTRAINT supplier_product_supplier FOREIGN KEY supplier_product_supplier (supplier_id)
    REFERENCES supplier (id);

-- Reference: supplier_supplier_status (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_supplier_status FOREIGN KEY supplier_supplier_status (status_id)
    REFERENCES supplier_status (id);

-- Reference: supplier_updator (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_updator FOREIGN KEY supplier_updator (updator_id)
    REFERENCES user (id);

-- Reference: user_user_type (table: user)
ALTER TABLE user ADD CONSTRAINT user_user_type FOREIGN KEY user_user_type (user_type_id)
    REFERENCES user_type (id);

-- End of file.

