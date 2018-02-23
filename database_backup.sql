--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE doctors (
    id integer NOT NULL,
    name character varying,
    specialty character varying
);


ALTER TABLE doctors OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE patients (
    id integer NOT NULL,
    name character varying,
    dob timestamp without time zone,
    department_needed character varying,
    doctor_id integer
);


ALTER TABLE patients OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY doctors (id, name, specialty) FROM stdin;
1	Dr. Stephenson	oncology
2	Dr. Wayne	dentistry
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('doctors_id_seq', 1, false);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patients (id, name, dob, department_needed, doctor_id) FROM stdin;
1	Jessica Jones	1991-04-18 00:00:00	chiropractic	\N
2	Ryan Williams	1972-04-12 00:00:00	dentistry	\N
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patients_id_seq', 1, false);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

