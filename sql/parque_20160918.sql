--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.3.13
-- Started on 2016-09-18 09:11:26 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 55826)
-- Name: caracteristicas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE caracteristicas (
    id_caracteristica integer NOT NULL,
    nom_caracteristica character varying(100) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.caracteristicas OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 55830)
-- Name: caracteristicas_id_caracteristica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE caracteristicas_id_caracteristica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caracteristicas_id_caracteristica_seq OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 172
-- Name: caracteristicas_id_caracteristica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE caracteristicas_id_caracteristica_seq OWNED BY caracteristicas.id_caracteristica;


--
-- TOC entry 173 (class 1259 OID 55832)
-- Name: connections_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE connections_history (
    id_connection integer NOT NULL,
    id_user integer NOT NULL,
    login character varying(100) NOT NULL,
    ip character varying(50) NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.connections_history OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 55836)
-- Name: connections_history_id_connection_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE connections_history_id_connection_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connections_history_id_connection_seq OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 174
-- Name: connections_history_id_connection_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE connections_history_id_connection_seq OWNED BY connections_history.id_connection;


--
-- TOC entry 175 (class 1259 OID 55838)
-- Name: espacios_imagenes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE espacios_imagenes (
    id_espacio integer NOT NULL,
    imagen character varying(100) NOT NULL,
    id_espacios_imagenes integer NOT NULL,
    orden integer
);


ALTER TABLE public.espacios_imagenes OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 55841)
-- Name: espacio_imagenes_id_espacios_imagenes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE espacio_imagenes_id_espacios_imagenes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.espacio_imagenes_id_espacios_imagenes_seq OWNER TO postgres;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 176
-- Name: espacio_imagenes_id_espacios_imagenes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE espacio_imagenes_id_espacios_imagenes_seq OWNED BY espacios_imagenes.id_espacios_imagenes;


--
-- TOC entry 177 (class 1259 OID 55843)
-- Name: espacios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE espacios (
    id_espacio integer NOT NULL,
    nom_espacio character varying(100) NOT NULL,
    des_espacio character varying(100),
    status integer DEFAULT 1 NOT NULL,
    capacidad integer NOT NULL,
    ut numeric,
    id_tipo_espacio integer,
    id_zona_ubicacion integer NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL,
    precio numeric
);


ALTER TABLE public.espacios OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 55850)
-- Name: espacios_caracteristicas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE espacios_caracteristicas (
    id_espacio integer NOT NULL,
    id_caracteristica integer NOT NULL
);


ALTER TABLE public.espacios_caracteristicas OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 55853)
-- Name: kioskos_id_espacio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kioskos_id_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kioskos_id_espacio_seq OWNER TO postgres;

--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 179
-- Name: kioskos_id_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kioskos_id_espacio_seq OWNED BY espacios.id_espacio;


--
-- TOC entry 191 (class 1259 OID 55998)
-- Name: solicitudes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitudes (
    id_solicitud integer NOT NULL,
    id_espacio integer NOT NULL,
    id_zona_ubicacion integer NOT NULL,
    id_tipo_espacio integer,
    id_usuario integer,
    fec_reservacion date NOT NULL,
    status integer,
    date_created timestamp without time zone NOT NULL,
    date_updated timestamp without time zone NOT NULL
);


ALTER TABLE public.solicitudes OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 55996)
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solicitudes_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudes_id_solicitud_seq OWNER TO postgres;

--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 190
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solicitudes_id_solicitud_seq OWNED BY solicitudes.id_solicitud;


--
-- TOC entry 180 (class 1259 OID 55855)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE status (
    id_status integer NOT NULL,
    name character varying(50) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_updated timestamp without time zone NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 55858)
-- Name: tipo_espacio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_espacio (
    id_tipo_espacio integer NOT NULL,
    nom_tipo_espacio character varying(50) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    date_created timestamp without time zone DEFAULT now(),
    date_updated timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tipo_espacio OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 55861)
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_espacio_id_tipo_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_espacio_id_tipo_espacio_seq OWNER TO postgres;

--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 182
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_espacio_id_tipo_espacio_seq OWNED BY tipo_espacio.id_tipo_espacio;


--
-- TOC entry 183 (class 1259 OID 55863)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id_user integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_updated timestamp without time zone NOT NULL,
    mail character varying(45) DEFAULT NULL::character varying,
    mail_alternative character varying(45) DEFAULT NULL::character varying,
    rol character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 55870)
-- Name: users_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_data (
    id_user integer NOT NULL,
    first_name character varying(200) NOT NULL,
    second_name character varying(45) DEFAULT NULL::character varying,
    first_last_name character varying(45) NOT NULL,
    second_last_name character varying(45) DEFAULT NULL::character varying,
    nationality character varying(1) NOT NULL,
    document character varying(45) NOT NULL,
    birthdate date,
    gender character varying(1) NOT NULL,
    phone character varying(45) NOT NULL,
    phone1 character varying(45) DEFAULT NULL::character varying,
    date_created timestamp without time zone NOT NULL,
    date_updated timestamp without time zone NOT NULL,
    image character varying(100)
);


ALTER TABLE public.users_data OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 55876)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_user_seq OWNER TO postgres;

--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_user_seq OWNED BY users.id_user;


--
-- TOC entry 189 (class 1259 OID 55951)
-- Name: ut; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ut (
    id_ut integer NOT NULL,
    valor double precision,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ut OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 55949)
-- Name: ut_id_ut_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ut_id_ut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ut_id_ut_seq OWNER TO postgres;

--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 188
-- Name: ut_id_ut_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ut_id_ut_seq OWNED BY ut.id_ut;


--
-- TOC entry 187 (class 1259 OID 55922)
-- Name: zona_ubicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zona_ubicacion (
    id_zona_ubicacion integer NOT NULL,
    des_zona_ubicacion character varying NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.zona_ubicacion OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 55920)
-- Name: zona_ubicacion_id_zona_ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zona_ubicacion_id_zona_ubicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zona_ubicacion_id_zona_ubicacion_seq OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 186
-- Name: zona_ubicacion_id_zona_ubicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zona_ubicacion_id_zona_ubicacion_seq OWNED BY zona_ubicacion.id_zona_ubicacion;


--
-- TOC entry 1965 (class 2604 OID 55878)
-- Name: id_caracteristica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caracteristicas ALTER COLUMN id_caracteristica SET DEFAULT nextval('caracteristicas_id_caracteristica_seq'::regclass);


--
-- TOC entry 1967 (class 2604 OID 55879)
-- Name: id_connection; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connections_history ALTER COLUMN id_connection SET DEFAULT nextval('connections_history_id_connection_seq'::regclass);


--
-- TOC entry 1970 (class 2604 OID 55880)
-- Name: id_espacio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY espacios ALTER COLUMN id_espacio SET DEFAULT nextval('kioskos_id_espacio_seq'::regclass);


--
-- TOC entry 1968 (class 2604 OID 55881)
-- Name: id_espacios_imagenes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY espacios_imagenes ALTER COLUMN id_espacios_imagenes SET DEFAULT nextval('espacio_imagenes_id_espacios_imagenes_seq'::regclass);


--
-- TOC entry 1992 (class 2604 OID 56001)
-- Name: id_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitudes ALTER COLUMN id_solicitud SET DEFAULT nextval('solicitudes_id_solicitud_seq'::regclass);


--
-- TOC entry 1973 (class 2604 OID 55882)
-- Name: id_tipo_espacio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_espacio ALTER COLUMN id_tipo_espacio SET DEFAULT nextval('tipo_espacio_id_tipo_espacio_seq'::regclass);


--
-- TOC entry 1981 (class 2604 OID 55883)
-- Name: id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id_user SET DEFAULT nextval('users_id_user_seq'::regclass);


--
-- TOC entry 1989 (class 2604 OID 55954)
-- Name: id_ut; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ut ALTER COLUMN id_ut SET DEFAULT nextval('ut_id_ut_seq'::regclass);


--
-- TOC entry 1985 (class 2604 OID 55925)
-- Name: id_zona_ubicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zona_ubicacion ALTER COLUMN id_zona_ubicacion SET DEFAULT nextval('zona_ubicacion_id_zona_ubicacion_seq'::regclass);


--
-- TOC entry 2127 (class 0 OID 55826)
-- Dependencies: 171
-- Data for Name: caracteristicas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 172
-- Name: caracteristicas_id_caracteristica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('caracteristicas_id_caracteristica_seq', 1, false);


--
-- TOC entry 2129 (class 0 OID 55832)
-- Dependencies: 173
-- Data for Name: connections_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO connections_history VALUES (1, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:33:01.709027');
INSERT INTO connections_history VALUES (2, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:36:11.590116');
INSERT INTO connections_history VALUES (3, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:38:56.169614');
INSERT INTO connections_history VALUES (4, 1, 'MDEANDRADE', '127.0.0.1', '2016-09-11 14:41:11.281488');
INSERT INTO connections_history VALUES (5, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:44:25.490898');
INSERT INTO connections_history VALUES (6, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:45:54.381579');
INSERT INTO connections_history VALUES (7, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:47:05.397272');
INSERT INTO connections_history VALUES (8, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:47:36.871062');
INSERT INTO connections_history VALUES (9, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:48:05.002686');
INSERT INTO connections_history VALUES (10, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 14:49:52.95499');
INSERT INTO connections_history VALUES (11, 1, 'MDEANDRADE', '127.0.0.1', '2016-09-11 14:56:21.149104');
INSERT INTO connections_history VALUES (12, 1, 'MDEANDRADE', '127.0.0.1', '2016-09-11 14:57:19.232845');
INSERT INTO connections_history VALUES (13, 1, 'MDEANDRADE', '127.0.0.1', '2016-09-11 15:13:55.041579');
INSERT INTO connections_history VALUES (14, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 17:47:16.225055');
INSERT INTO connections_history VALUES (15, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 17:49:15.864419');
INSERT INTO connections_history VALUES (16, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 17:50:40.100405');
INSERT INTO connections_history VALUES (17, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 17:51:00.136919');
INSERT INTO connections_history VALUES (18, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 17:59:23.50084');
INSERT INTO connections_history VALUES (19, 1, 'mdeandrade', '127.0.0.1', '2016-09-11 18:00:03.829056');
INSERT INTO connections_history VALUES (20, 1, 'mdeandrade', '127.0.0.1', '2016-09-14 18:46:29.724027');
INSERT INTO connections_history VALUES (21, 1, 'mdeandrade', '127.0.0.1', '2016-09-14 21:49:42.177905');
INSERT INTO connections_history VALUES (22, 1, 'mdeandrade', '127.0.0.1', '2016-09-15 18:31:17.321826');
INSERT INTO connections_history VALUES (23, 1, 'mdeandrade', '127.0.0.1', '2016-09-15 21:07:06.160261');


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 174
-- Name: connections_history_id_connection_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('connections_history_id_connection_seq', 23, true);


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 176
-- Name: espacio_imagenes_id_espacios_imagenes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('espacio_imagenes_id_espacios_imagenes_seq', 132, true);


--
-- TOC entry 2133 (class 0 OID 55843)
-- Dependencies: 177
-- Data for Name: espacios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO espacios VALUES (10, 'KIOSKO 10', 'KIOSKO 10', 1, 35, 10, 1, 1, '2016-09-11 20:03:57.571002', '2016-09-11 20:03:57.571002', 0);
INSERT INTO espacios VALUES (11, 'ssss', 'sssssssssss', 1, 34, 1, 1, 1, '2016-09-14 21:10:55.97144', '2016-09-14 21:10:55.97144', 0);
INSERT INTO espacios VALUES (12, 'KIOSKO 12', '24224424', 1, 35, 6, 1, 1, '2016-09-14 21:12:07.983308', '2016-09-14 21:12:47.162556', 0);
INSERT INTO espacios VALUES (2, 'KIOSCO 2', 'KIOSCO 2', 1, 35, 10, 1, 1, '2016-09-11 19:30:48.129466', '2016-09-14 21:21:46.664771', 0);
INSERT INTO espacios VALUES (3, 'KIOSKO 3', 'KIOSKO 3', 1, 35, 10, 1, 1, '2016-09-11 19:31:32.512193', '2016-09-14 21:21:47.36557', 0);
INSERT INTO espacios VALUES (5, 'KIOSKO 4', 'KIOSKO 4', 1, 35, 10, 1, 1, '2016-09-11 19:41:53.943233', '2016-09-14 21:21:48.773805', 0);
INSERT INTO espacios VALUES (6, 'KIOSKO 4', 'KIOSKO 4', 1, 35, 10, 1, 1, '2016-09-11 19:57:48.360527', '2016-09-14 21:21:49.431319', 0);
INSERT INTO espacios VALUES (7, 'KIOSKO 4', 'KIOSKO 4', 1, 35, 10, 1, 1, '2016-09-11 19:59:07.310877', '2016-09-14 21:21:50.12374', 0);
INSERT INTO espacios VALUES (8, 'KIOSKO 8', 'KIOSKO 8', 1, 35, 10, 1, 1, '2016-09-11 19:59:49.582871', '2016-09-14 21:21:52.260707', 0);
INSERT INTO espacios VALUES (9, 'KIOSKO 8', 'KIOSKO 8', 1, 35, 10, 1, 1, '2016-09-11 20:01:14.27341', '2016-09-14 21:21:54.056332', 0);
INSERT INTO espacios VALUES (4, 'KIOSKO 4', 'KIOSKO 4', 1, 35, 10, 1, 1, '2016-09-11 19:34:18.371738', '2016-09-14 21:21:55.110753', 0);
INSERT INTO espacios VALUES (1, 'KIOSCO 1', 'KIOSCO 1', 1, 35, 10, 1, 1, '2016-09-11 19:29:17.814676', '2016-09-14 21:23:35.61164', 0);


--
-- TOC entry 2134 (class 0 OID 55850)
-- Dependencies: 178
-- Data for Name: espacios_caracteristicas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2131 (class 0 OID 55838)
-- Dependencies: 175
-- Data for Name: espacios_imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO espacios_imagenes VALUES (0, 'ESPACIO__1.png', 114, 1);
INSERT INTO espacios_imagenes VALUES (0, 'ESPACIO__2.png', 115, 2);
INSERT INTO espacios_imagenes VALUES (0, 'ESPACIO__3.png', 116, 3);
INSERT INTO espacios_imagenes VALUES (0, 'ESPACIO__4.png', 117, 4);
INSERT INTO espacios_imagenes VALUES (1, 'ESPACIO_1_1.png', 129, 1);
INSERT INTO espacios_imagenes VALUES (1, 'ESPACIO_1_2.png', 130, 2);
INSERT INTO espacios_imagenes VALUES (1, 'ESPACIO_1_3.png', 131, 3);
INSERT INTO espacios_imagenes VALUES (1, 'ESPACIO_1_4.png', 132, 4);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 179
-- Name: kioskos_id_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kioskos_id_espacio_seq', 12, true);


--
-- TOC entry 2147 (class 0 OID 55998)
-- Dependencies: 191
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 190
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solicitudes_id_solicitud_seq', 1, false);


--
-- TOC entry 2136 (class 0 OID 55855)
-- Dependencies: 180
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO status VALUES (0, 'DESACTIVADO', '2016-09-11 00:00:00', '2016-09-11 00:00:00');
INSERT INTO status VALUES (1, 'ACTIVO', '2016-09-11 00:00:00', '2016-09-11 00:00:00');


--
-- TOC entry 2137 (class 0 OID 55858)
-- Dependencies: 181
-- Data for Name: tipo_espacio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_espacio VALUES (2, 'tipo prueba 2', 1, '2016-09-15 18:58:28.334524', '2016-09-15 18:58:46.612327');
INSERT INTO tipo_espacio VALUES (1, 'tipo de prueba', 1, '2016-09-15 18:53:00.5153', '2016-09-15 18:58:54.923235');


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 182
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_espacio_id_tipo_espacio_seq', 2, true);


--
-- TOC entry 2139 (class 0 OID 55863)
-- Dependencies: 183
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES (8, 'tamara', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2016-04-02 20:55:08', '2016-06-18 13:42:51', '', NULL, 'SEC');
INSERT INTO users VALUES (9, 'reporte', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2016-04-02 20:55:08', '2016-06-18 13:42:51', '', NULL, 'REP');
INSERT INTO users VALUES (7, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2016-05-08 11:51:43', '2016-09-11 14:55:36.718971', '', NULL, 'ADM');
INSERT INTO users VALUES (10, 'admin2', '18bfddf1020067bbd33fad652bc8f1a59b2427ff8c7ebfd62bbfef6c2dddff49', 1, '2016-09-04 10:32:25', '2016-09-11 14:55:37.865733', NULL, NULL, 'ADM');
INSERT INTO users VALUES (1, 'mdeandrade', '18bfddf1020067bbd33fad652bc8f1a59b2427ff8c7ebfd62bbfef6c2dddff49', 1, '2016-04-02 20:55:08', '2016-09-11 17:52:12', '', NULL, 'ADM');


--
-- TOC entry 2140 (class 0 OID 55870)
-- Dependencies: 184
-- Data for Name: users_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users_data VALUES (7, 'Marcos ', 'arlindo', 'DE ANDRADE', 'CARRERA', 'V', '18020594', NULL, 'M', '04268141850', NULL, '2016-04-03 17:41:26', '2016-04-03 17:41:26', NULL);
INSERT INTO users_data VALUES (8, 'Marcos', 'arlindo', 'DE ANDRADE', 'CARRERA', 'V', '18020594', NULL, 'M', '04142695880', NULL, '2016-04-03 17:44:48', '2016-04-03 17:44:48', NULL);
INSERT INTO users_data VALUES (9, 'jean', 'maiker', 'de andrade', 'carrera ', 'V', '20303709', NULL, 'M', '04163030894', NULL, '2016-04-03 20:38:36', '2016-04-03 20:38:36', NULL);
INSERT INTO users_data VALUES (10, 'jean', 'maiker', 'de andrade', 'carrera', 'V', '20303709', NULL, 'M', '04163030894', NULL, '2016-04-03 20:50:13', '2016-04-03 20:50:22', NULL);
INSERT INTO users_data VALUES (1, 'MARCOS', 'ARLINDO', 'DE ANDRADE', 'CARRERA', 'V', '18020594', NULL, 'M', '04268141850', '04268141850', '2016-04-02 21:28:41', '2016-09-15 21:57:54.968835', 'mdeandrade.jpg');


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_user_seq', 1, false);


--
-- TOC entry 2145 (class 0 OID 55951)
-- Dependencies: 189
-- Data for Name: ut; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ut VALUES (1, 177, '2016-09-15 19:08:44.83429', '2016-09-15 19:08:44.83429');


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 188
-- Name: ut_id_ut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ut_id_ut_seq', 1, true);


--
-- TOC entry 2143 (class 0 OID 55922)
-- Dependencies: 187
-- Data for Name: zona_ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zona_ubicacion VALUES (2, 'zona de prueba2', 1, '2016-09-14 21:58:55.275527', '2016-09-14 21:58:55.275527');
INSERT INTO zona_ubicacion VALUES (3, 'zona de prueba3', 1, '2016-09-14 21:58:55.275527', '2016-09-14 21:58:55.275527');
INSERT INTO zona_ubicacion VALUES (4, '89898', 1, '2016-09-15 18:36:40.682512', '2016-09-15 18:36:40.682512');
INSERT INTO zona_ubicacion VALUES (5, 'asdasda', 1, '2016-09-15 18:38:39.78745', '2016-09-15 18:38:39.78745');
INSERT INTO zona_ubicacion VALUES (6, 'sfsdfsd', 1, '2016-09-15 18:38:58.882072', '2016-09-15 18:38:58.882072');
INSERT INTO zona_ubicacion VALUES (7, 'sdfsdfsdfd', 1, '2016-09-15 18:39:31.999195', '2016-09-15 18:39:31.999195');
INSERT INTO zona_ubicacion VALUES (1, 'zona de pruebassssssssss', 1, '2016-09-15 18:39:40.429766', '2016-09-15 18:40:14.31048');


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 186
-- Name: zona_ubicacion_id_zona_ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('zona_ubicacion_id_zona_ubicacion_seq', 7, true);


--
-- TOC entry 1994 (class 2606 OID 55885)
-- Name: caracteristicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracteristicas
    ADD CONSTRAINT caracteristicas_pkey PRIMARY KEY (id_caracteristica);


--
-- TOC entry 1996 (class 2606 OID 55887)
-- Name: connections_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY connections_history
    ADD CONSTRAINT connections_history_pkey PRIMARY KEY (id_connection);


--
-- TOC entry 1998 (class 2606 OID 55889)
-- Name: espacio_imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espacios_imagenes
    ADD CONSTRAINT espacio_imagenes_pkey PRIMARY KEY (id_espacios_imagenes);


--
-- TOC entry 2002 (class 2606 OID 55891)
-- Name: espacios_caracteristicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espacios_caracteristicas
    ADD CONSTRAINT espacios_caracteristicas_pkey PRIMARY KEY (id_espacio, id_caracteristica);


--
-- TOC entry 2000 (class 2606 OID 55893)
-- Name: kioskos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espacios
    ADD CONSTRAINT kioskos_pkey PRIMARY KEY (id_espacio);


--
-- TOC entry 2016 (class 2606 OID 56003)
-- Name: solicitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitudes
    ADD CONSTRAINT solicitudes_pkey PRIMARY KEY (id_solicitud);


--
-- TOC entry 2004 (class 2606 OID 55895)
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);


--
-- TOC entry 2006 (class 2606 OID 55897)
-- Name: tipo_espacio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_espacio
    ADD CONSTRAINT tipo_espacio_pkey PRIMARY KEY (id_tipo_espacio);


--
-- TOC entry 2010 (class 2606 OID 55899)
-- Name: users_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_data
    ADD CONSTRAINT users_data_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2008 (class 2606 OID 55901)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2014 (class 2606 OID 55959)
-- Name: ut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ut
    ADD CONSTRAINT ut_pkey PRIMARY KEY (id_ut);


--
-- TOC entry 2012 (class 2606 OID 55931)
-- Name: zona_ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zona_ubicacion
    ADD CONSTRAINT zona_ubicacion_pkey PRIMARY KEY (id_zona_ubicacion);


--
-- TOC entry 2017 (class 2606 OID 55902)
-- Name: connections_history_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connections_history
    ADD CONSTRAINT connections_history_id_user_fkey FOREIGN KEY (id_user) REFERENCES users(id_user);


--
-- TOC entry 2018 (class 2606 OID 55907)
-- Name: kioskos_id_tipo_espacio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY espacios
    ADD CONSTRAINT kioskos_id_tipo_espacio_fkey FOREIGN KEY (id_tipo_espacio) REFERENCES tipo_espacio(id_tipo_espacio);


--
-- TOC entry 2019 (class 2606 OID 55912)
-- Name: users_data_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_data
    ADD CONSTRAINT users_data_id_user_fkey FOREIGN KEY (id_user) REFERENCES users(id_user);


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-18 09:11:27 VET

--
-- PostgreSQL database dump complete
--

