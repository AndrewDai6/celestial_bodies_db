--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    distance_mly numeric(5,2),
    name_origin text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered_by character varying(50),
    discovery_date date,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_moons integer,
    has_rings boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rover; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rover (
    rover_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_kg integer,
    from_nasa boolean
);


ALTER TABLE public.rover OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rover_rover_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rover_rover_id_seq OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rover_rover_id_seq OWNED BY public.rover.rover_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spectral_type character varying(30),
    solar_mass numeric(4,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: rover rover_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover ALTER COLUMN rover_id SET DEFAULT nextval('public.rover_rover_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 0.03, 'The appearance from Earth of the galaxy--a band of light.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 2.45, 'Named after the area of the sky in which it appears, the Andromeda constellation.');
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Coma Berenices', 17.30, 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus.');
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'Canes Venatici', 51.50, 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.');
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 'Draco', 400.00, 'The name comes from the resemblance of the galaxy to a tadpole.');
INSERT INTO public.galaxy VALUES (6, 'Mayall''s Object', 'Ursa Major', 450.00, 'This is named after Nicholas Mayall, of the Lick Observatory, who discovered it.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Asaph Hall', '1877-08-18', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Asaph Hall', '1877-08-12', 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Galileo Galilei, Simon Marius', '1610-01-08', 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Galileo Galilei', '1610-01-07', 5);
INSERT INTO public.moon VALUES (6, 'Titan', 'Christiaan Huygens', '1655-03-25', 6);
INSERT INTO public.moon VALUES (7, 'Io', 'Galileo Galilei', '1610-01-08', 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'William Herschel', '1789-08-28', 6);
INSERT INTO public.moon VALUES (9, 'Triton', 'William Lassell', '1846-10-10', 8);
INSERT INTO public.moon VALUES (11, 'Mimas', 'William Herschel', '1789-09-17', 6);
INSERT INTO public.moon VALUES (12, 'Titania', 'William Herschel', '1787-01-11', 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 'William Herschel', '1787-01-11', 7);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'William Bond, George Bond, William Lassell', '1848-09-16', 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'Giovanni Cassini', '1684-03-30', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Giovanni Cassini', '1671-10-25', 6);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Gerard Kuiper', '1949-05-01', 8);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'William Lassell', '1851-10-24', 7);
INSERT INTO public.moon VALUES (18, 'Amalthea', 'Edward Bernard', '1892-09-09', 5);
INSERT INTO public.moon VALUES (19, 'Epimetheus', 'Richard Walker', '1966-12-18', 6);
INSERT INTO public.moon VALUES (20, 'Daphnis', 'Cassini Imaging Science Team', '2005-05-01', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-11b', NULL, NULL, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-11c', NULL, NULL, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-11d', NULL, NULL, 6);
INSERT INTO public.planet VALUES (12, 'Kepler-11e', NULL, NULL, 6);


--
-- Data for Name: rover; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rover VALUES (1, 'Lunokhod 1', 756, false);
INSERT INTO public.rover VALUES (2, 'Lunar Roving Vehicle', 210, true);
INSERT INTO public.rover VALUES (3, 'Curiosity', 899, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.0, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'M1-2', 16.5, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A0Va', 2.1, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'A3V', 3.8, 2);
INSERT INTO public.star VALUES (5, 'Titawin', 'F8V', 1.3, 2);
INSERT INTO public.star VALUES (6, 'Kepler-11', 'G6V', 1.0, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: rover_rover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rover_rover_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rover rover_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_name_key UNIQUE (name);


--
-- Name: rover rover_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_pkey PRIMARY KEY (rover_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

