--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.3

-- Started on 2024-10-07 14:04:59

CREATE ROLE postgres LOGIN;

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
-- TOC entry 215 (class 1259 OID 16451)
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    product_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16454)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    menu_id integer NOT NULL,
    name character varying(30),
    description text,
    price numeric(3,2)
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16459)
-- Name: menus_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_menu_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: menus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_menu_id_seq OWNED BY public.menus.menu_id;


--
-- TOC entry 218 (class 1259 OID 16460)
-- Name: product_toppings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_toppings (
    product_id integer NOT NULL,
    topping_id integer NOT NULL
);


ALTER TABLE public.product_toppings OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16463)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_type integer,
    name character varying(100),
    description text,
    price numeric(3,2),
    quantity integer,
    quantity_unit integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16468)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 221 (class 1259 OID 16469)
-- Name: ref_product_quantities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_product_quantities (
    quantity_unit integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.ref_product_quantities OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16472)
-- Name: ref_product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_product_type (
    product_type_id integer NOT NULL,
    description text
);


ALTER TABLE public.ref_product_type OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16477)
-- Name: ref_produt_type_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_produt_type_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ref_produt_type_product_type_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 223
-- Name: ref_produt_type_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_produt_type_product_type_id_seq OWNED BY public.ref_product_type.product_type_id;


--
-- TOC entry 224 (class 1259 OID 16478)
-- Name: ref_topping_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_topping_type (
    topping_type_id integer NOT NULL,
    description text
);


ALTER TABLE public.ref_topping_type OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: ref_topping_type_topping_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_topping_type_topping_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ref_topping_type_topping_type_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 225
-- Name: ref_topping_type_topping_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_topping_type_topping_type_id_seq OWNED BY public.ref_topping_type.topping_type_id;


--
-- TOC entry 226 (class 1259 OID 16484)
-- Name: toppings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.toppings (
    topping_id integer NOT NULL,
    name character varying(50),
    description text,
    price numeric(3,2),
    topping_type integer
);


ALTER TABLE public.toppings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16489)
-- Name: toppings_topping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.toppings_topping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.toppings_topping_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 227
-- Name: toppings_topping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.toppings_topping_id_seq OWNED BY public.toppings.topping_id;


--
-- TOC entry 4720 (class 2604 OID 16490)
-- Name: menus menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN menu_id SET DEFAULT nextval('public.menus_menu_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16491)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16492)
-- Name: ref_product_type product_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_product_type ALTER COLUMN product_type_id SET DEFAULT nextval('public.ref_produt_type_product_type_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16493)
-- Name: ref_topping_type topping_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_topping_type ALTER COLUMN topping_type_id SET DEFAULT nextval('public.ref_topping_type_topping_type_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16494)
-- Name: toppings topping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toppings ALTER COLUMN topping_id SET DEFAULT nextval('public.toppings_topping_id_seq'::regclass);


--
-- TOC entry 4880 (class 0 OID 16451)
-- Dependencies: 215
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (product_id, menu_id) FROM stdin;
7	4
38	4
22	4
34	4
8	5
38	5
22	5
9	6
38	6
22	6
36	6
1	7
10	7
54	7
27	7
30	7
2	8
10	8
22	8
33	8
3	9
10	9
22	9
32	9
4	10
39	10
55	10
35	10
5	11
16	11
53	11
36	11
6	12
6	12
13	12
13	12
31	12
31	12
58	1
38	1
22	1
27	1
59	2
38	2
51	2
57	2
30	2
31	2
60	3
38	3
22	3
35	3
\.


--
-- TOC entry 4881 (class 0 OID 16454)
-- Dependencies: 216
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (menu_id, name, description, price) FROM stdin;
1	Big Juicy Burger Combo	Its big... Its juicy...	4.99
2	Heartstopper Deluxe	Not for the faint of heart.	4.99
3	Jumbo Dumbo Mac	A jumbo dumbo combo.	4.99
4	Spicy Chick Combo	A well-formed chicken meal.	4.99
5	Chick a la Natural Galore	Combo featuring Chick a la Natural.	4.99
6	Crispy Chick Supreme Combo	A supreme meal!	4.99
7	Plantera Combo	A green combo, literally.	4.99
8	Green Smash Combo	Green combo with good sides.	4.99
9	Avocado Dream Combo	The best combo for avocado lovers.	4.99
10	Filet-O-Fish Combo	A classic made into a combo. A classic combo!	4.99
11	Just Fried Fish Combo	When you like the deep fried taste.	4.99
12	Fish Attack Deluxe	Double the burgers & double the sting.	4.99
\.


--
-- TOC entry 4883 (class 0 OID 16460)
-- Dependencies: 218
-- Data for Name: product_toppings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_toppings (product_id, topping_id) FROM stdin;
1	5
1	9
1	19
1	18
1	14
1	23
2	2
2	9
2	9
2	16
2	19
2	11
2	25
3	1
3	9
3	21
3	20
3	28
4	1
4	7
4	16
4	18
4	11
4	22
5	3
5	7
5	17
5	19
5	10
5	21
6	2
6	7
6	14
6	13
6	15
6	12
6	28
7	1
7	8
7	12
7	16
7	18
7	28
8	4
8	8
8	11
8	29
8	22
9	3
9	8
9	11
9	13
9	21
9	18
9	19
9	10
9	27
58	2
58	6
58	19
58	22
59	2
59	6
59	18
59	22
60	2
60	6
60	14
60	22
\.


--
-- TOC entry 4884 (class 0 OID 16463)
-- Dependencies: 219
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_type, name, description, price, quantity, quantity_unit) FROM stdin;
1	1	Plantera Burger	A perfect looking gluten free burger.	7.99	1	1
42	2	Coffee	Black or white, dilute as you wish.	1.99	25	2
11	2	Milk Shake	Made from premium milk.	3.99	70	2
15	2	Tea	Pick from one of our many tastes.	1.99	25	2
16	2	Coffee	Black or white, dilute as you wish.	2.49	35	2
17	2	Latte	Just a mediocre Latte.	1.99	25	2
18	2	Espresso	The finest of coffees.	1.99	25	2
20	2	Hot Chocolate	Dairy free hot choco.	1.99	25	2
40	2	Tea	Pick from one of our many tastes.	2.49	35	2
41	2	Tea	Pick from one of our many tastes.	3.99	50	2
43	2	Coffee	Black or white, dilute as you wish.	3.99	50	2
44	2	Latte	Just a mediocre Latte.	2.49	35	2
45	2	Latte	Just a mediocre Latte.	3.99	50	2
46	2	Espresso	The finest of coffees.	2.49	35	2
47	2	Hot Chocolate	Dairy free hot choco.	2.49	35	2
48	2	Hot Chocolate	Dairy free hot choco.	3.99	50	2
55	3	Chili Cheese	These balls will melt in your mouth.	1.99	4	1
24	3	Chili Cheese	These balls will melt in your mouth.	2.99	7	1
56	3	Chicken Nuggets	What are these made of? I dont know.	1.99	4	1
57	3	Chicken Nuggets	What are these made of? I dont know.	2.99	6	1
31	3	Sourcream & Pepper Dip	A different kind of dip.	0.99	5	2
32	3	Green & Garlic Dip	Objectively the best dip.	0.99	5	2
33	3	Hot Creole Dip	A must have to your combo.	0.99	5	2
34	3	Buffalo Hot Sauce Dip	Strong like a buffalo.	0.99	5	2
35	3	BBQ Dip	Extreme BBQ taste ahead.	0.99	5	2
36	3	Sweet & Spicy Honey Sauce Dip	Its sweet.. Its spicy.	0.99	5	2
52	3	Fries	Classic potato fries.	0.99	50	3
53	3	Sweet Potato Fries	Slightly worse tasting fries.	0.99	50	3
54	3	Sweet Potato Fries	Slightly worse tasting fries.	1.49	100	3
22	3	Fries	Classic potato fries.	1.49	100	3
51	3	Fries	Classic potato fries.	2.99	200	3
23	3	Sweet Potato Fries	Slightly worse tasting fries.	2.99	200	3
25	3	Chicken Wings	We cant beat KFC, but an attempt was made.	2.49	4	1
26	3	Spicy Chicken Wings	These wings are not really spicy	2.99	4	1
27	3	Mozzarella Sticks	Are you asking for a heart attack?	0.99	2	1
28	3	Onion Rings	Onions used will be random.	1.99	5	1
29	3	Spicy Onion Rings	Onion rings but spicy.	2.49	5	1
30	3	Cheddar Dip	Rich tasting cheese dip.	0.99	5	2
2	1	Green Smash Burger	Smashed and green.	5.99	1	1
3	1	Avocado Dream Burger	For all avocado enjoyers out there.	9.99	1	1
4	1	Filet-O-Fish	A true classic.	2.59	1	1
5	1	Deep Fried Fiesta Burger	Deeply fried.. Twice.	3.99	1	1
6	1	Fishing Hook Burger	This one stings, we promise.	4.99	1	1
7	1	Spicy Chick	Made from spice and chicken.	3.99	1	1
8	1	Chick a la Natural	Roadkill chicken.	1.99	1	1
9	1	Crispy Chick Supreme	Made from chickens raised better than you.	6.99	1	1
37	2	Soda	Choose your favorite!	1.49	33	2
10	2	Soda	Choose your favorite!	2.00	50	2
38	2	Soda	Choose your favorite!	2.49	70	2
19	2	Milk Shake	Made from premium milk.	1.99	33	2
12	2	Milk	50/50 goat or cow.	1.49	33	2
13	2	Sparkling Water	Tap water ran in the Sodastream.	0.99	33	2
14	2	Still Water	Tap water, what do you expect?	0.99	33	2
39	2	Milk Shake	Made from premium milk.	2.49	50	2
21	2	Matcha Tea	High quality matcha tea.	1.99	25	2
49	2	Matcha Tea	High quality matcha tea.	2.49	35	2
50	2	Matcha Tea	High quality matcha tea.	3.99	50	2
58	1	Meatylicious	So meaty...	3.99	1	1
59	1	Big Juicy Burger	A big, juicy delight!	7.99	1	1
60	1	Jumbo Dumbo Burger	A huge, tasty burger!	6.99	1	1
\.


--
-- TOC entry 4886 (class 0 OID 16469)
-- Dependencies: 221
-- Data for Name: ref_product_quantities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_product_quantities (quantity_unit, description) FROM stdin;
1	pieces
2	cl
3	grams
\.


--
-- TOC entry 4887 (class 0 OID 16472)
-- Dependencies: 222
-- Data for Name: ref_product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_product_type (product_type_id, description) FROM stdin;
1	burger
2	drink
3	side
\.


--
-- TOC entry 4889 (class 0 OID 16478)
-- Dependencies: 224
-- Data for Name: ref_topping_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_topping_type (topping_type_id, description) FROM stdin;
1	Bread
2	Meat
3	Topping
4	Sauce
\.


--
-- TOC entry 4891 (class 0 OID 16484)
-- Dependencies: 226
-- Data for Name: toppings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.toppings (topping_id, name, description, price, topping_type) FROM stdin;
1	Brioche	Soft and buttery French-style bread.	1.50	1
2	Potato bread	Fluffy bread made with mashed potatoes.	1.30	1
3	Sourdough bread	Tangy and slightly chewy sourdough.	1.75	1
4	French toast	Crispy and golden-brown French toast.	2.00	1
5	Glutenfree bread	Delicious gluten-free alternative.	2.25	1
6	Beef	Juicy, premium ground beef patty.	3.50	2
7	Fish	Freshly grilled or fried fish fillet.	3.75	2
8	Chicken	Grilled or crispy chicken breast.	3.25	2
9	Plant-based	Delicious and healthy plant-based patty.	4.00	2
10	Bacon	Crispy smoked bacon strips.	1.50	3
11	Cheddar	Sharp, aged cheddar cheese.	1.00	3
12	Spicy cheddar	Cheddar with a spicy kick.	1.25	3
13	Silver onion	Mild and crunchy silver onions.	0.75	3
14	Yellow onion	Classic, sweet yellow onion.	0.50	3
15	Red onion	Zesty red onions, sliced fresh.	0.50	3
16	Pickled red onion	Tangy, pickled red onions.	0.80	3
17	Pickle	Crunchy dill pickles.	0.50	3
18	Salad	Fresh lettuce for extra crunch.	0.75	3
19	Tomato	Juicy slices of ripe tomatoes.	0.75	3
20	Mozzarella	Creamy, melted mozzarella cheese.	1.25	3
21	Avocado	Creamy, rich avocado slices.	1.50	3
22	Ketchup	Classic tomato ketchup.	0.30	4
23	Honey Mustard-sauce	Sweet and tangy honey mustard.	0.50	4
24	Tennessee BBQ-sauce	Smoky and rich BBQ sauce.	0.60	4
25	Sambal-sauce	Spicy Indonesian chili sauce.	0.75	4
26	Mustard	Tangy yellow mustard.	0.30	4
27	Fourguys special formula-sauce	Signature house-made sauce.	1.00	4
28	Jalapeño mayonnaise	Creamy mayo with a jalapeño kick.	0.75	4
29	Mayonnaise	Rich and creamy classic mayo.	0.50	4
30	Cheese sauce	Smooth, melted cheese sauce.	1.00	4
\.


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 217
-- Name: menus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_menu_id_seq', 12, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 74, true);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 223
-- Name: ref_produt_type_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_produt_type_product_type_id_seq', 4, true);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 225
-- Name: ref_topping_type_topping_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_topping_type_topping_type_id_seq', 4, true);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 227
-- Name: toppings_topping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.toppings_topping_id_seq', 30, true);


--
-- TOC entry 4726 (class 2606 OID 16496)
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (menu_id);


--
-- TOC entry 4729 (class 2606 OID 16498)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4731 (class 2606 OID 16500)
-- Name: ref_product_type ref_product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_product_type
    ADD CONSTRAINT ref_product_type_pkey PRIMARY KEY (product_type_id);


--
-- TOC entry 4733 (class 2606 OID 16502)
-- Name: ref_topping_type ref_topping_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_topping_type
    ADD CONSTRAINT ref_topping_type_pkey PRIMARY KEY (topping_type_id);


--
-- TOC entry 4735 (class 2606 OID 16504)
-- Name: toppings toppings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_pkey PRIMARY KEY (topping_id);


--
-- TOC entry 4727 (class 1259 OID 16505)
-- Name: fki_o; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_o ON public.products USING btree (product_type);


--
-- TOC entry 4736 (class 2606 OID 16506)
-- Name: products product_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_type_fkey FOREIGN KEY (product_type) REFERENCES public.ref_product_type(product_type_id) NOT VALID;


-- Completed on 2024-10-07 14:04:59

--
-- PostgreSQL database dump complete
--

