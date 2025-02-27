--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    distance_from_earth integer NOT NULL,
    description text,
    age_in_millions_of_years numeric
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    name character varying(30),
    galaxy_types_id integer NOT NULL,
    special_number integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description character varying(120),
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
    name character varying(30),
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    description character varying(120),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    description character varying(120),
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 'cool one', 12);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2403, 'beautiful', 18);
INSERT INTO public.galaxy VALUES (3, 'Whirpool', 31124, 'dangerous', 98);
INSERT INTO public.galaxy VALUES (4, 'Messier', 2182, 'weird', 2);
INSERT INTO public.galaxy VALUES (5, 'NGC 4565', 51245, 'unknown', 179);
INSERT INTO public.galaxy VALUES (6, 'Virgo Cluster', 15513, 'unknown', 13);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES ('cold', 1, 100, 'cold galaxy');
INSERT INTO public.galaxy_types VALUES ('warm', 2, 101, 'warm galaxy');
INSERT INTO public.galaxy_types VALUES ('hot', 3, 102, 'hot galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', false, true, 'cool and big', 1);
INSERT INTO public.moon VALUES (2, 'Ganymede', false, true, 'Largest moon in solar system orbiting Jupiter.', 1);
INSERT INTO public.moon VALUES (3, 'Titan', false, true, 'Saturn moon with dense atmosphere and methane lakes.', 1);
INSERT INTO public.moon VALUES (4, 'Europa', false, true, 'Ice-covered moon of Jupiter with potential ocean.', 1);
INSERT INTO public.moon VALUES (5, 'Ganymede', false, true, 'Largest moon in solar system orbiting Jupiter.', 1);
INSERT INTO public.moon VALUES (6, 'Titan', false, true, 'Saturn moon with dense atmosphere and methane lakes.', 2);
INSERT INTO public.moon VALUES (7, 'Io', false, true, 'Volcanically active moon of Jupiter.', 2);
INSERT INTO public.moon VALUES (8, 'Callisto', false, true, 'Heavily cratered moon of Jupiter.', 2);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, true, 'Saturn moon with geysers suggesting a subsurface ocean.', 2);
INSERT INTO public.moon VALUES (10, 'Triton', false, true, 'Neptunes largest moon, retrograde orbit.', 2);
INSERT INTO public.moon VALUES (11, 'Rhea', false, true, 'Second-largest of Saturns moons.', 2);
INSERT INTO public.moon VALUES (12, 'Dione', false, true, 'Moon of Saturn with icy cliffs.', 2);
INSERT INTO public.moon VALUES (13, 'Tethys', false, true, 'Icy and heavily cratered moon of Saturn.', 2);
INSERT INTO public.moon VALUES (14, 'Oberon', false, true, 'Second-largest moon of Uranus.', 2);
INSERT INTO public.moon VALUES (15, 'Iapetus', false, true, 'Saturns two-tone moon.', 2);
INSERT INTO public.moon VALUES (16, 'Umbriel', false, true, 'Dark and icy Uranian moon.', 2);
INSERT INTO public.moon VALUES (17, 'Ariel', false, true, 'Bright moon with canyons and craters.', 2);
INSERT INTO public.moon VALUES (18, 'Miranda', false, true, 'Uranian moon with diverse terrain.', 2);
INSERT INTO public.moon VALUES (19, 'Phobos', false, false, 'Irregularly shaped moon of Mars.', 2);
INSERT INTO public.moon VALUES (20, 'Deimos', false, false, 'Smaller, outermost moon of Mars.', 2);
INSERT INTO public.moon VALUES (21, 'Charon', false, true, 'Largest moon of Pluto.', 2);
INSERT INTO public.moon VALUES (22, 'Mimas', false, true, 'Also known as the Death Star moon, Saturn.', 2);
INSERT INTO public.moon VALUES (23, 'Hyperion', false, false, 'Chaotic moon of Saturn resembling a sponge.', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', true, 0, 'Our home planet, rich in biodiversity and life.', 1);
INSERT INTO public.planet VALUES (16, 'Proxima b', false, 4200000, 'Nearest known exoplanet to our solar system.', 1);
INSERT INTO public.planet VALUES (19, 'TESS-10b', false, 8000000, 'Exoplanet discovered by NASA TESS mission.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 26100000, 'Similar size to Earth but with a toxic atmosphere.', 2);
INSERT INTO public.planet VALUES (15, 'GJ 1214 b', false, 42370000, 'Water-world planet with a thick atmosphere.', 2);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1d', false, 40000000, 'One of the seven Earth-sized planets around TRAPPIST-1.', 2);
INSERT INTO public.planet VALUES (20, 'LHS 1140 b', false, 41000000, 'Rocky super-Earth 40 light years away.', 2);
INSERT INTO public.planet VALUES (1, 'Mercury', false, 77000000, 'Closest planet to the Sun, has a rocky surface.', 3);
INSERT INTO public.planet VALUES (4, 'Mars', false, 54600000, 'Known as the Red Planet, potential for past life.', 3);
INSERT INTO public.planet VALUES (17, 'K2-18b', false, 124300000, 'Exoplanet detected with water vapor in its atmosphere.', 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 628730000, 'Largest planet in the solar system, gas giant.', 3);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1200000000, 'Notable for its stunning rings, gas giant.', 3);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 1700000000, 'Ice giant with a blue hue due to methane.', 3);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 1800000000, 'Known for its deep blue color, windiest planet.', 3);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 591352000, 'Dwarf planet in the Kuiper belt, icy surface.', 3);
INSERT INTO public.planet VALUES (10, 'Eris', false, 1019500000, 'Distant dwarf planet beyond Pluto in the Kuiper belt.', 3);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 645000000, 'Oval-shaped dwarf planet with fast rotation.', 3);
INSERT INTO public.planet VALUES (12, 'Makemake', false, 746000000, 'Dwarf planet, one of the largest Kuiper belt objects.', 3);
INSERT INTO public.planet VALUES (13, 'Ceres', false, 257000000, 'Dwarf planet in the asteroid belt between Mars and Jupiter.', 3);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', false, 600000000, 'Exoplanet in the habitable zone of its star.', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Bellatrix', true, 32, 'beautifull', 1);
INSERT INTO public.star VALUES (6, 'Belel', false, 5, 'close', 1);
INSERT INTO public.star VALUES (7, 'Sirius', true, 8, 'Brightest star in the night sky known for its luminescence.', 1);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', true, 4, 'The closest known star to the solar system.', 1);
INSERT INTO public.star VALUES (10, 'Vega', true, 25, 'The fifth-brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (12, 'Arcturus', true, 37, 'An orange giant star and one of the brightest.', 1);
INSERT INTO public.star VALUES (15, 'Altair', true, 17, 'A bright star in the constellation Aquila.', 1);
INSERT INTO public.star VALUES (16, 'Aldebaran', false, 65, 'The eye of Taurus, an orange giant star.', 1);
INSERT INTO public.star VALUES (17, 'Capella', true, 42, 'A bright star in the constellation Auriga.', 1);
INSERT INTO public.star VALUES (20, 'Castor', false, 52, 'A star system made up of six individual stars.', 1);
INSERT INTO public.star VALUES (21, 'Pollux', true, 34, 'A giant orange star and part of Gemini constellation.', 1);
INSERT INTO public.star VALUES (22, 'Fomalhaut', true, 25, 'A bright star surrounded by a debris disk.', 1);
INSERT INTO public.star VALUES (24, 'Regulus', true, 79, 'Brightest object in the constellation Leo.', 1);
INSERT INTO public.star VALUES (25, 'Achernar', true, 139, 'One of the hottest stars visible to the naked eye.', 1);
INSERT INTO public.star VALUES (26, 'Zeta Reticuli', false, 39, 'A wide binary star system in the constellation Reticulum.', 1);
INSERT INTO public.star VALUES (13, 'Polaris', true, 433, 'Known as the North Star.', 2);
INSERT INTO public.star VALUES (23, 'Mimosa', false, 350, 'A binary star system in the constellation Crux.', 2);
INSERT INTO public.star VALUES (18, 'Spica', false, 250, 'The brightest star in the constellation Virgo.', 2);
INSERT INTO public.star VALUES (2, 'Achird', false, 652, NULL, 3);
INSERT INTO public.star VALUES (8, 'Betelgeuse', false, 643, 'A red supergiant star in the constellation Orion.', 3);
INSERT INTO public.star VALUES (11, 'Rigel', false, 863, 'A blue supergiant star in the constellation Orion.', 3);
INSERT INTO public.star VALUES (14, 'Antares', false, 554, 'A red supergiant star in the constellation Scorpius.', 3);
INSERT INTO public.star VALUES (1, 'Acamar', true, 1245, 'warm', 4);
INSERT INTO public.star VALUES (3, 'alnitak', true, 7134, 'cold', 4);
INSERT INTO public.star VALUES (5, 'Bharani', true, 2755, 'far away', 4);
INSERT INTO public.star VALUES (19, 'Deneb', true, 2616, 'One of the most distant stars visible to the naked eye.', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 26, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_special_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_special_number_key UNIQUE (special_number);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

