--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    description text NOT NULL,
    number_of_planets integer,
    galaxy_types character varying(30),
    distance_from_earth_in_lightyears numeric(30,2),
    orbits_blackhole boolean,
    number_of_companion_galaxies integer,
    is_satellite boolean
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
    description text NOT NULL,
    discovery_year integer,
    moon_type character varying(30),
    distance_from_planet_in_km numeric(30,2),
    has_atmosphere boolean,
    orbital_period_in_days integer,
    is_tidally_locked boolean,
    planet_id integer NOT NULL
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    number_of_moons integer,
    planet_types character varying(30),
    distance_from_earth_in_lightyears numeric(30,2),
    has_rings boolean,
    orbital_period_in_days integer,
    is_gas_giant boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_physical_parameters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_physical_parameters (
    planet_physical_parameters_id integer NOT NULL,
    planet_id integer,
    surface_gravity numeric(5,2),
    mean_temperature_kelvin integer,
    has_magnetic_field boolean DEFAULT false,
    name character varying(50) DEFAULT 'Temporary Name'::character varying NOT NULL
);


ALTER TABLE public.planet_physical_parameters OWNER TO freecodecamp;

--
-- Name: planet_physical_parameters_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_physical_parameters_parameter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_physical_parameters_parameter_id_seq OWNER TO freecodecamp;

--
-- Name: planet_physical_parameters_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_physical_parameters_parameter_id_seq OWNED BY public.planet_physical_parameters.planet_physical_parameters_id;


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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    number_of_orbiting_planets integer,
    star_types character varying(30),
    distance_from_earth_in_lightyears numeric(30,2),
    is_pulsar boolean,
    age_in_billions_of_years integer,
    is_binary boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: planet_physical_parameters planet_physical_parameters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_physical_parameters ALTER COLUMN planet_physical_parameters_id SET DEFAULT nextval('public.planet_physical_parameters_parameter_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, description, number_of_planets, galaxy_types, distance_from_earth_in_lightyears, orbits_blackhole, number_of_companion_galaxies, is_satellite) FROM stdin;
1	Milky Way	Our home galaxy containing Earth and the solar system.	8	Barred Spiral	0.00	t	50	f
2	Andromeda	The largest neighbor galaxy bound for a future collision with us.	10	Spiral	2537000.00	t	14	f
3	Triangulum	The third-largest member of our Local Group of galaxies.	4	Spiral	2730000.00	t	0	f
4	Large Magellanic Cloud	A bright satellite galaxy visible from Earth southern hemisphere.	2	Magellanic Spiral	163000.00	f	0	t
5	Small Magellanic Cloud	A dwarf irregular galaxy that closely orbits the Milky Way.	1	Irregular	204000.00	f	0	t
6	Messier 87	A massive elliptical galaxy hosting a famous supermassive black hole.	100	Elliptical	53490000.00	t	100	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, description, discovery_year, moon_type, distance_from_planet_in_km, has_atmosphere, orbital_period_in_days, is_tidally_locked, planet_id) FROM stdin;
1	The Moon	Earth only natural satellite and brightest night sky object.	1600	Rocky	384400.00	f	27	t	3
2	Phobos	The larger and closer of the two Martian moons.	1877	Captured Asteroid	9377.00	f	0	t	4
3	Deimos	The smaller, outer moon of Mars with a smooth surface.	1877	Captured Asteroid	23460.00	f	1	t	4
4	Io	The most volcanically active body in the solar system.	1610	Volcanic	421700.00	f	2	t	5
5	Europa	An icy world with a hidden subsurface liquid water ocean.	1610	Icy	670900.00	f	4	t	5
6	Ganymede	The largest moon in the solar system, bigger than Mercury.	1610	Icy Silicate	1070400.00	f	7	t	5
7	Callisto	A heavily cratered and ancient icy world.	1610	Icy Silicate	1882700.00	f	17	t	5
8	Amalthea	An irregularly shaped inner moon of Jupiter.	1892	Irregular	181400.00	f	0	t	5
9	Himalia	The largest irregular satellite of Jupiter.	1904	Irregular	11461000.00	f	250	f	5
10	Mimas	An icy moon famous for its giant Herschel impact crater.	1789	Icy	185520.00	f	1	t	6
11	Enceladus	Features active cryovolcanoes shooting water ice into space.	1789	Icy	237948.00	f	1	t	6
12	Tethys	A mid-sized icy moon dominated by a massive canyon.	1684	Icy	294619.00	f	2	t	6
13	Dione	An icy moon with heavily cratered and wispy terrain.	1684	Icy	377396.00	f	3	t	6
14	Rhea	The second-largest moon of Saturn, mostly water ice.	1672	Icy	527108.00	f	5	t	6
15	Titan	The only moon in the solar system with a dense atmosphere.	1655	Titanian	1221830.00	t	16	t	6
16	Iapetus	Features a dramatic two-toned dark and light surface.	1671	Icy	3560820.00	f	79	t	6
17	Miranda	Features a chaotic, patchwork surface of deep canyons.	1948	Icy	129390.00	f	1	t	7
18	Titania	The largest moon of Uranus, marked by vast faults.	1787	Icy	435910.00	f	9	t	7
19	Triton	A large frozen moon that orbits Neptune backward.	1846	Ice Dwarf	354759.00	f	6	t	8
20	Andromeda Moon A	A massive exo-moon orbiting planet Andromeda Prime.	2024	Exo-moon	500000.00	t	12	t	11
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, number_of_moons, planet_types, distance_from_earth_in_lightyears, has_rings, orbital_period_in_days, is_gas_giant, star_id) FROM stdin;
1	Mercury	The smallest and closest planet to the Sun.	0	Terrestrial	0.00	f	88	f	1
2	Venus	A scorching hot planet with a thick, toxic atmosphere.	0	Terrestrial	0.00	f	225	f	1
3	Earth	Our home planet and the only known world to support life.	1	Terrestrial	0.00	f	365	f	1
4	Mars	The dusty, cold desert world with a thin atmosphere.	2	Terrestrial	0.00	f	687	f	1
5	Jupiter	The largest gas giant planet in our solar system.	95	Gas Giant	0.00	t	4333	t	1
6	Saturn	Famous gas giant decorated with a dazzling ring system.	146	Gas Giant	0.00	t	10759	t	1
7	Uranus	An ice giant planet that rotates completely on its side.	28	Ice Giant	0.00	t	30687	t	1
8	Neptune	The most distant giant planet in our solar system.	16	Ice Giant	0.00	t	60190	t	1
9	Proxima b	An Earth-sized exoplanet orbiting within its stars habitable zone.	0	Exoplanet	4.24	f	11	f	3
10	Proxima c	A colder, outer planet orbiting Proxima Centauri.	0	Exoplanet	4.24	t	1894	f	3
11	Andromeda Prime	A hypothetical massive gas giant inside the Andromeda galaxy.	4	Exoplanet	2537000.00	t	500	t	5
12	Andromeda Minor	A rocky exoplanet orbiting tightly to its parent star.	1	Exoplanet	2537000.00	f	45	f	5
\.


--
-- Data for Name: planet_physical_parameters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet_physical_parameters (planet_physical_parameters_id, planet_id, surface_gravity, mean_temperature_kelvin, has_magnetic_field, name) FROM stdin;
1	1	3.70	440	f	Mercury Metrics
2	2	8.87	737	f	Venus Metrics
3	3	9.81	288	t	Earth Metrics
4	4	3.71	210	f	Mars Metrics
5	5	24.79	165	t	Jupiter Metrics
6	6	10.44	134	t	Saturn Metrics
7	7	8.69	76	t	Uranus Metrics
8	8	11.15	72	t	Neptune Metrics
9	9	10.10	234	t	Proxima b Metrics
10	10	5.50	60	f	Proxima c Metrics
11	11	28.20	150	t	Andromeda Prime Metrics
12	12	11.30	320	f	Andromeda Minor Metrics
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, description, number_of_orbiting_planets, star_types, distance_from_earth_in_lightyears, is_pulsar, age_in_billions_of_years, is_binary, galaxy_id) FROM stdin;
1	The Sun	The yellow dwarf star at the center of our solar system.	8	Yellow Dwarf	0.00	f	5	f	1
2	Sirius A	The brightest star in Earth night sky, located in Canis Major.	0	Main Sequence	8.60	f	1	t	1
3	Proxima Centauri	The closest known star to the Sun, hosting its own planets.	3	Red Dwarf	4.24	f	5	t	1
4	Crab Pulsar	A highly magnetized, rapidly rotating neutron star remnant.	0	Neutron Star	6500.00	t	1	f	1
5	Andromeda Main Star	A massive, bright star located deep inside our neighbor galaxy.	2	Blue Giant	2537000.00	f	2	f	2
6	M87 Central Giant	A supermassive hypergiant star near the core of Messier 87.	0	Supergiant	53490000.00	f	10	f	6
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_physical_parameters_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_physical_parameters_parameter_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


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
-- Name: planet_physical_parameters planet_physical_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_physical_parameters
    ADD CONSTRAINT planet_physical_parameters_pkey PRIMARY KEY (planet_physical_parameters_id);


--
-- Name: planet_physical_parameters planet_physical_parameters_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_physical_parameters
    ADD CONSTRAINT planet_physical_parameters_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: planet_physical_parameters planet_physical_parameters_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_physical_parameters
    ADD CONSTRAINT planet_physical_parameters_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

