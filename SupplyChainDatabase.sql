--
-- PostgreSQL database dump
--

\restrict 0C0nhBttUol6axCPKCkPZK9zyIl40NylYJQjy6kwffQ8sLBTeToK3xik1YtwOSI

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-31 17:43:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 231 (class 1259 OID 16476)
-- Name: inspection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inspection (
    inspection_id integer NOT NULL,
    manufacturing_id integer,
    inspection_results character varying(100),
    defect_rates numeric(5,2)
);


ALTER TABLE public.inspection OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16475)
-- Name: inspection_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inspection_inspection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inspection_inspection_id_seq OWNER TO postgres;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 230
-- Name: inspection_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inspection_inspection_id_seq OWNED BY public.inspection.inspection_id;


--
-- TOC entry 220 (class 1259 OID 16395)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    sku character varying(50) NOT NULL,
    availability integer,
    stock_levels integer
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16463)
-- Name: manufacturing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturing (
    manufacturing_id integer NOT NULL,
    sku character varying(50),
    production_volumes integer,
    manufacturing_lead_time integer,
    manufacturing_costs numeric(10,2)
);


ALTER TABLE public.manufacturing OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16462)
-- Name: manufacturing_manufacturing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturing_manufacturing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manufacturing_manufacturing_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 228
-- Name: manufacturing_manufacturing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturing_manufacturing_id_seq OWNED BY public.manufacturing.manufacturing_id;


--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    sku character varying(50) NOT NULL,
    product_type character varying(100),
    price numeric(10,2)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16445)
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_order (
    poid integer NOT NULL,
    supplier_id integer,
    sku character varying(50),
    order_quantity integer
);


ALTER TABLE public.purchase_order OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16444)
-- Name: purchase_order_poid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_order_poid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_order_poid_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 226
-- Name: purchase_order_poid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_order_poid_seq OWNED BY public.purchase_order.poid;


--
-- TOC entry 225 (class 1259 OID 16432)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    sku character varying(50),
    num_products_sold integer,
    revenue_generated numeric(10,2),
    customer_demographics character varying(100)
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16431)
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_sale_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 224
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- TOC entry 233 (class 1259 OID 16489)
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    shipment_id integer NOT NULL,
    poid integer,
    shipping_carrier character varying(100),
    transportation_mode character varying(50),
    route character varying(100),
    shipping_times integer,
    shipping_costs numeric(10,2),
    total_costs numeric(10,2)
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16488)
-- Name: shipping_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_shipment_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 232
-- Name: shipping_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_shipment_id_seq OWNED BY public.shipping.shipment_id;


--
-- TOC entry 222 (class 1259 OID 16407)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    supplier_name character varying(100),
    location character varying(100)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16414)
-- Name: supplier_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_product (
    supplier_id integer NOT NULL,
    sku character varying(50) NOT NULL,
    supplier_lead_time integer
);


ALTER TABLE public.supplier_product OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16406)
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;


--
-- TOC entry 234 (class 1259 OID 16514)
-- Name: temp_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_table (
    "Product type" text,
    "SKU" text,
    "Price" numeric,
    "Availability" integer,
    "Number of products sold" integer,
    "Revenue generated" numeric,
    "Customer demographics" text,
    "Stock levels" integer,
    "Lead times" integer,
    "Order quantities" integer,
    "Shipping times" integer,
    "Shipping carriers" text,
    "Shipping costs" numeric,
    "Supplier name" text,
    "Location" text,
    "Lead time" integer,
    "Production volumes" integer,
    "Manufacturing lead time" integer,
    "Manufacturing costs" numeric,
    "Inspection results" text,
    "Defect rates" numeric,
    "Transportation modes" text,
    "Routes" text,
    "Costs" numeric
);


ALTER TABLE public.temp_table OWNER TO postgres;

--
-- TOC entry 4901 (class 2604 OID 16479)
-- Name: inspection inspection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection ALTER COLUMN inspection_id SET DEFAULT nextval('public.inspection_inspection_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16466)
-- Name: manufacturing manufacturing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturing ALTER COLUMN manufacturing_id SET DEFAULT nextval('public.manufacturing_manufacturing_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 16448)
-- Name: purchase_order poid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order ALTER COLUMN poid SET DEFAULT nextval('public.purchase_order_poid_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16435)
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 16492)
-- Name: shipping shipment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN shipment_id SET DEFAULT nextval('public.shipping_shipment_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 16410)
-- Name: supplier supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);


--
-- TOC entry 5089 (class 0 OID 16476)
-- Dependencies: 231
-- Data for Name: inspection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inspection (inspection_id, manufacturing_id, inspection_results, defect_rates) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 16395)
-- Dependencies: 220
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (sku, availability, stock_levels) FROM stdin;
SKU32	43	89
SKU99	17	55
SKU65	72	57
SKU93	88	63
SKU84	99	73
SKU36	34	18
SKU12	41	100
SKU28	12	48
SKU57	65	5
SKU82	13	42
SKU79	56	31
SKU87	24	5
SKU0	55	58
SKU97	56	46
SKU66	52	13
SKU75	29	16
SKU74	64	41
SKU47	93	4
SKU19	100	48
SKU2	34	1
SKU17	82	45
SKU50	91	31
SKU40	97	90
SKU39	26	78
SKU18	23	10
SKU63	55	54
SKU7	59	93
SKU88	58	60
SKU72	88	57
SKU48	28	30
SKU76	23	38
SKU20	22	27
SKU96	29	67
SKU61	23	32
SKU77	14	96
SKU37	5	25
SKU29	3	45
SKU85	83	15
SKU46	75	92
SKU95	65	15
SKU41	35	64
SKU53	93	96
SKU56	90	25
SKU1	95	53
SKU22	55	71
SKU9	35	14
SKU6	48	11
SKU94	97	77
SKU4	26	5
SKU34	96	1
SKU64	11	73
SKU23	30	84
SKU68	29	0
SKU55	16	97
SKU15	94	9
SKU78	50	5
SKU14	26	54
SKU89	10	90
SKU69	62	95
SKU35	11	42
SKU16	74	2
SKU98	43	53
SKU86	18	32
SKU38	75	69
SKU25	73	82
SKU24	32	4
SKU30	10	60
SKU70	90	10
SKU13	5	80
SKU60	16	41
SKU90	56	66
SKU11	95	46
SKU5	87	90
SKU58	81	10
SKU54	11	33
SKU81	9	48
SKU71	14	76
SKU49	19	97
SKU45	1	93
SKU62	89	86
SKU44	34	13
SKU67	16	12
SKU43	6	36
SKU3	68	23
SKU59	30	100
SKU51	61	100
SKU26	9	59
SKU8	78	5
SKU73	41	17
SKU92	44	90
SKU91	90	98
SKU21	60	69
SKU80	75	39
SKU42	98	22
SKU33	63	4
SKU27	42	47
SKU83	82	65
SKU52	1	64
SKU31	28	6
SKU10	11	51
\.


--
-- TOC entry 5087 (class 0 OID 16463)
-- Dependencies: 229
-- Data for Name: manufacturing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturing (manufacturing_id, sku, production_volumes, manufacturing_lead_time, manufacturing_costs) FROM stdin;
2	SKU0	215	29	46.28
3	SKU1	517	30	33.62
4	SKU2	971	27	30.69
5	SKU3	937	18	35.62
6	SKU4	414	3	92.07
7	SKU5	104	17	56.77
8	SKU6	314	24	1.09
9	SKU7	564	1	99.47
10	SKU8	769	8	11.42
11	SKU9	963	23	47.96
12	SKU10	830	5	96.53
13	SKU11	362	11	27.59
14	SKU12	563	3	32.32
15	SKU13	173	10	97.83
16	SKU14	558	14	5.79
17	SKU15	580	7	97.12
18	SKU16	399	21	77.11
19	SKU17	453	16	47.68
20	SKU18	374	17	27.11
21	SKU19	694	16	82.37
22	SKU20	309	6	65.69
23	SKU21	791	4	61.74
24	SKU22	780	28	50.12
25	SKU23	568	29	98.61
26	SKU24	447	3	40.38
27	SKU25	934	23	78.28
28	SKU26	171	4	15.97
29	SKU27	291	4	10.53
30	SKU28	171	7	59.43
31	SKU29	329	7	39.29
32	SKU30	806	30	51.63
33	SKU31	461	8	60.25
34	SKU32	737	7	29.69
35	SKU33	251	23	23.85
36	SKU34	452	10	10.75
37	SKU35	367	2	58.00
38	SKU36	671	19	45.53
39	SKU37	867	15	34.34
40	SKU38	841	12	5.93
41	SKU39	791	6	9.01
42	SKU40	793	1	88.18
43	SKU41	892	7	95.33
44	SKU42	179	7	96.42
45	SKU43	206	23	26.28
46	SKU44	834	18	22.55
47	SKU45	794	25	66.31
48	SKU46	870	23	77.32
49	SKU47	964	20	19.71
50	SKU48	109	18	23.13
51	SKU49	177	28	14.15
52	SKU50	306	21	45.18
53	SKU51	673	28	14.19
54	SKU52	727	27	9.17
55	SKU53	631	17	83.34
56	SKU54	497	29	30.19
57	SKU55	918	5	30.32
58	SKU56	826	28	12.84
59	SKU57	588	25	67.78
60	SKU58	396	7	65.05
61	SKU59	176	4	1.90
62	SKU60	929	24	87.21
63	SKU61	480	12	78.70
64	SKU62	751	14	21.05
65	SKU63	736	10	20.08
66	SKU64	328	6	8.69
67	SKU65	358	21	1.60
68	SKU66	867	28	42.08
69	SKU67	198	11	7.06
70	SKU68	375	18	97.11
71	SKU69	862	7	77.63
72	SKU70	775	16	11.44
73	SKU71	258	10	30.66
74	SKU72	152	11	55.76
75	SKU73	444	4	46.87
76	SKU74	919	9	80.58
77	SKU75	759	11	48.06
78	SKU76	985	24	64.32
79	SKU77	334	5	42.95
80	SKU78	858	21	71.13
81	SKU79	228	12	57.87
82	SKU80	202	5	76.96
83	SKU81	698	1	19.79
84	SKU82	955	26	4.47
85	SKU83	443	5	97.73
86	SKU84	589	22	33.81
87	SKU85	211	2	69.93
88	SKU86	569	18	74.61
89	SKU87	523	17	28.70
90	SKU88	953	11	68.18
91	SKU89	370	11	46.60
92	SKU90	585	8	85.68
93	SKU91	207	28	39.77
94	SKU92	671	29	62.61
95	SKU93	824	20	35.63
96	SKU94	908	14	60.39
97	SKU95	450	26	58.89
98	SKU96	648	28	17.80
99	SKU97	535	13	65.77
100	SKU98	581	9	5.60
101	SKU99	921	2	38.07
\.


--
-- TOC entry 5077 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (sku, product_type, price) FROM stdin;
SKU80	skincare	91.13
SKU76	haircare	69.11
SKU85	cosmetics	76.96
SKU72	cosmetics	90.20
SKU71	cosmetics	6.38
SKU42	skincare	46.53
SKU59	cosmetics	63.83
SKU13	skincare	16.16
SKU22	haircare	27.68
SKU68	haircare	37.93
SKU2	haircare	11.32
SKU73	cosmetics	83.85
SKU98	skincare	19.75
SKU12	haircare	71.21
SKU90	skincare	13.88
SKU60	skincare	17.03
SKU66	skincare	26.03
SKU91	cosmetics	62.11
SKU6	skincare	4.08
SKU44	cosmetics	51.36
SKU75	skincare	93.00
SKU34	skincare	37.47
SKU86	skincare	20.00
SKU20	skincare	96.34
SKU16	skincare	7.55
SKU83	haircare	68.91
SKU35	cosmetics	84.96
SKU67	skincare	87.76
SKU18	haircare	36.44
SKU88	cosmetics	75.27
SKU57	haircare	49.26
SKU64	skincare	89.63
SKU97	haircare	3.53
SKU41	skincare	99.11
SKU31	skincare	50.85
SKU58	skincare	59.84
SKU50	cosmetics	14.20
SKU25	haircare	39.63
SKU27	cosmetics	92.56
SKU52	skincare	98.03
SKU36	skincare	9.81
SKU5	haircare	1.70
SKU63	skincare	13.02
SKU95	haircare	77.90
SKU69	skincare	54.87
SKU55	haircare	79.86
SKU54	haircare	31.15
SKU37	skincare	23.40
SKU21	cosmetics	84.89
SKU47	skincare	95.71
SKU93	haircare	69.29
SKU40	skincare	80.54
SKU3	skincare	61.16
SKU99	haircare	68.52
SKU28	cosmetics	2.40
SKU10	skincare	15.71
SKU77	haircare	57.45
SKU8	cosmetics	68.72
SKU30	haircare	8.02
SKU7	cosmetics	42.96
SKU9	skincare	64.02
SKU33	cosmetics	64.80
SKU24	haircare	4.16
SKU94	cosmetics	3.04
SKU46	haircare	27.08
SKU14	skincare	99.17
SKU92	cosmetics	47.71
SKU53	skincare	30.34
SKU65	skincare	33.70
SKU61	haircare	52.03
SKU0	haircare	69.81
SKU87	haircare	80.41
SKU38	cosmetics	52.08
SKU43	haircare	11.74
SKU23	cosmetics	4.32
SKU82	skincare	17.03
SKU32	skincare	79.21
SKU15	skincare	36.99
SKU62	cosmetics	72.80
SKU1	skincare	14.84
SKU48	haircare	76.04
SKU45	haircare	33.78
SKU74	haircare	3.17
SKU79	haircare	57.06
SKU26	haircare	97.45
SKU51	haircare	26.70
SKU29	cosmetics	63.45
SKU84	haircare	89.10
SKU19	skincare	51.12
SKU81	haircare	72.82
SKU70	haircare	47.91
SKU39	skincare	19.13
SKU89	cosmetics	97.76
SKU11	skincare	90.64
SKU96	cosmetics	24.42
SKU78	haircare	6.31
SKU49	cosmetics	78.90
SKU56	skincare	20.99
SKU4	skincare	4.81
SKU17	cosmetics	81.46
\.


--
-- TOC entry 5085 (class 0 OID 16445)
-- Dependencies: 227
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order (poid, supplier_id, sku, order_quantity) FROM stdin;
2	16	SKU0	96
3	16	SKU1	37
4	24	SKU2	88
5	20	SKU3	59
6	3	SKU4	56
7	23	SKU5	66
8	17	SKU6	58
9	23	SKU7	11
10	2	SKU8	15
11	15	SKU9	83
12	20	SKU10	80
13	26	SKU11	60
14	11	SKU12	85
15	13	SKU13	48
16	22	SKU14	78
17	4	SKU15	69
18	4	SKU16	78
19	10	SKU17	85
20	26	SKU18	46
21	19	SKU19	94
22	10	SKU20	68
23	25	SKU21	7
24	11	SKU22	63
25	20	SKU23	29
26	5	SKU24	2
27	11	SKU25	52
28	5	SKU26	48
29	12	SKU27	62
30	24	SKU28	24
31	22	SKU29	67
32	11	SKU30	35
33	7	SKU31	44
34	17	SKU32	64
35	25	SKU33	95
36	10	SKU34	21
37	3	SKU35	85
38	18	SKU36	28
39	17	SKU37	21
40	12	SKU38	88
41	26	SKU39	34
42	22	SKU40	39
43	19	SKU41	38
44	13	SKU42	57
45	12	SKU43	85
46	18	SKU44	72
47	15	SKU45	52
48	7	SKU46	6
49	22	SKU47	51
50	21	SKU48	9
51	8	SKU49	9
52	18	SKU50	82
53	13	SKU51	52
54	24	SKU52	11
55	3	SKU53	54
56	22	SKU54	61
57	18	SKU55	11
58	24	SKU56	83
59	18	SKU57	51
60	6	SKU58	44
61	22	SKU59	26
62	2	SKU60	72
63	11	SKU61	36
64	21	SKU62	40
65	9	SKU63	10
66	3	SKU64	75
67	20	SKU65	54
68	20	SKU66	19
69	24	SKU67	71
70	5	SKU68	58
71	11	SKU69	27
72	4	SKU70	22
73	5	SKU71	26
74	4	SKU72	77
75	19	SKU73	66
76	14	SKU74	1
77	10	SKU75	56
78	5	SKU76	22
79	22	SKU77	57
80	12	SKU78	51
81	9	SKU79	20
82	7	SKU80	41
83	6	SKU81	8
84	21	SKU82	72
85	4	SKU83	7
86	25	SKU84	80
87	25	SKU85	66
88	24	SKU86	22
89	7	SKU87	55
90	21	SKU88	85
91	22	SKU89	27
92	9	SKU90	96
93	14	SKU91	85
94	21	SKU92	10
95	19	SKU93	66
96	18	SKU94	72
97	2	SKU95	26
98	16	SKU96	32
99	2	SKU97	4
100	25	SKU98	27
101	15	SKU99	59
102	16	SKU0	96
103	16	SKU1	37
104	24	SKU2	88
105	20	SKU3	59
106	3	SKU4	56
107	23	SKU5	66
108	17	SKU6	58
109	23	SKU7	11
110	2	SKU8	15
111	15	SKU9	83
112	20	SKU10	80
113	26	SKU11	60
114	11	SKU12	85
115	13	SKU13	48
116	22	SKU14	78
117	4	SKU15	69
118	4	SKU16	78
119	10	SKU17	85
120	26	SKU18	46
121	19	SKU19	94
122	10	SKU20	68
123	25	SKU21	7
124	11	SKU22	63
125	20	SKU23	29
126	5	SKU24	2
127	11	SKU25	52
128	5	SKU26	48
129	12	SKU27	62
130	24	SKU28	24
131	22	SKU29	67
132	11	SKU30	35
133	7	SKU31	44
134	17	SKU32	64
135	25	SKU33	95
136	10	SKU34	21
137	3	SKU35	85
138	18	SKU36	28
139	17	SKU37	21
140	12	SKU38	88
141	26	SKU39	34
142	22	SKU40	39
143	19	SKU41	38
144	13	SKU42	57
145	12	SKU43	85
146	18	SKU44	72
147	15	SKU45	52
148	7	SKU46	6
149	22	SKU47	51
150	21	SKU48	9
151	8	SKU49	9
152	18	SKU50	82
153	13	SKU51	52
154	24	SKU52	11
155	3	SKU53	54
156	22	SKU54	61
157	18	SKU55	11
158	24	SKU56	83
159	18	SKU57	51
160	6	SKU58	44
161	22	SKU59	26
162	2	SKU60	72
163	11	SKU61	36
164	21	SKU62	40
165	9	SKU63	10
166	3	SKU64	75
167	20	SKU65	54
168	20	SKU66	19
169	24	SKU67	71
170	5	SKU68	58
171	11	SKU69	27
172	4	SKU70	22
173	5	SKU71	26
174	4	SKU72	77
175	19	SKU73	66
176	14	SKU74	1
177	10	SKU75	56
178	5	SKU76	22
179	22	SKU77	57
180	12	SKU78	51
181	9	SKU79	20
182	7	SKU80	41
183	6	SKU81	8
184	21	SKU82	72
185	4	SKU83	7
186	25	SKU84	80
187	25	SKU85	66
188	24	SKU86	22
189	7	SKU87	55
190	21	SKU88	85
191	22	SKU89	27
192	9	SKU90	96
193	14	SKU91	85
194	21	SKU92	10
195	19	SKU93	66
196	18	SKU94	72
197	2	SKU95	26
198	16	SKU96	32
199	2	SKU97	4
200	25	SKU98	27
201	15	SKU99	59
\.


--
-- TOC entry 5083 (class 0 OID 16432)
-- Dependencies: 225
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_id, sku, num_products_sold, revenue_generated, customer_demographics) FROM stdin;
2	SKU0	802	8662.00	Non-binary
3	SKU1	736	7460.90	Female
4	SKU2	8	9577.75	Unknown
5	SKU3	83	7766.84	Non-binary
6	SKU4	871	2686.51	Non-binary
7	SKU5	147	2828.35	Non-binary
8	SKU6	65	7823.48	Male
9	SKU7	426	8496.10	Female
10	SKU8	150	7517.36	Female
11	SKU9	980	4971.15	Unknown
12	SKU10	996	2330.97	Non-binary
13	SKU11	960	6099.94	Female
14	SKU12	336	2873.74	Unknown
15	SKU13	249	4052.74	Male
16	SKU14	562	8653.57	Non-binary
17	SKU15	469	5442.09	Non-binary
18	SKU16	280	6453.80	Female
19	SKU17	126	2629.40	Female
20	SKU18	620	9364.67	Unknown
21	SKU19	187	2553.50	Unknown
22	SKU20	320	8128.03	Unknown
23	SKU21	601	7087.05	Unknown
24	SKU22	884	2390.81	Unknown
25	SKU23	391	8858.37	Unknown
26	SKU24	209	9049.08	Male
27	SKU25	142	2174.78	Male
28	SKU26	353	3716.49	Male
29	SKU27	352	2686.46	Unknown
30	SKU28	394	6117.32	Female
31	SKU29	253	8318.90	Female
32	SKU30	327	2766.34	Male
33	SKU31	168	9655.14	Male
34	SKU32	781	9571.55	Unknown
35	SKU33	616	5150.00	Non-binary
36	SKU34	602	9061.71	Unknown
37	SKU35	449	6541.33	Female
38	SKU36	963	7573.40	Female
39	SKU37	963	2438.34	Female
40	SKU38	705	9692.32	Non-binary
41	SKU39	176	1912.47	Female
42	SKU40	933	5724.96	Female
43	SKU41	556	5521.21	Female
44	SKU42	155	1839.61	Female
45	SKU43	598	5737.43	Unknown
46	SKU44	919	7152.29	Female
47	SKU45	24	5267.96	Male
48	SKU46	859	2556.77	Non-binary
49	SKU47	910	7089.47	Male
50	SKU48	29	7397.07	Non-binary
51	SKU49	99	8001.61	Unknown
52	SKU50	633	5910.89	Female
53	SKU51	154	9866.47	Male
54	SKU52	820	9435.76	Male
55	SKU53	242	8232.33	Male
56	SKU54	622	6088.02	Non-binary
57	SKU55	701	2925.68	Male
58	SKU56	93	4767.02	Non-binary
59	SKU57	227	1605.87	Unknown
60	SKU58	896	2021.15	Non-binary
61	SKU59	484	1061.62	Non-binary
62	SKU60	380	8864.08	Female
63	SKU61	117	6885.59	Unknown
64	SKU62	270	3899.75	Unknown
65	SKU63	246	4256.95	Non-binary
66	SKU64	134	8458.73	Female
67	SKU65	457	8354.58	Male
68	SKU66	704	8367.72	Female
69	SKU67	513	9473.80	Unknown
70	SKU68	163	3550.22	Non-binary
71	SKU69	511	1752.38	Non-binary
72	SKU70	32	7014.89	Female
73	SKU71	637	8180.34	Female
74	SKU72	478	2633.12	Non-binary
75	SKU73	375	7910.89	Male
76	SKU74	904	5709.95	Female
77	SKU75	106	1889.07	Non-binary
78	SKU76	241	5328.38	Male
79	SKU77	359	2483.76	Unknown
80	SKU78	946	1292.46	Unknown
81	SKU79	198	7888.72	Non-binary
82	SKU80	872	8651.67	Unknown
83	SKU81	774	4384.41	Unknown
84	SKU82	336	2943.38	Unknown
85	SKU83	663	2411.75	Unknown
86	SKU84	618	2048.29	Unknown
87	SKU85	25	8684.61	Female
88	SKU86	223	1229.59	Unknown
89	SKU87	79	5133.85	Male
90	SKU88	737	9444.74	Male
91	SKU89	134	5924.68	Unknown
92	SKU90	320	9592.63	Non-binary
93	SKU91	916	1935.21	Male
94	SKU92	276	2100.13	Male
95	SKU93	114	4531.40	Unknown
96	SKU94	987	7888.36	Unknown
97	SKU95	672	7386.36	Unknown
98	SKU96	324	7698.42	Non-binary
99	SKU97	62	4370.92	Male
100	SKU98	913	8525.95	Female
101	SKU99	627	9185.19	Unknown
\.


--
-- TOC entry 5091 (class 0 OID 16489)
-- Dependencies: 233
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping (shipment_id, poid, shipping_carrier, transportation_mode, route, shipping_times, shipping_costs, total_costs) FROM stdin;
2	2	Carrier B	Road	Route B	4	2.96	187.75
3	3	Carrier A	Road	Route B	2	9.72	503.07
4	4	Carrier B	Air	Route C	2	8.05	141.92
5	5	Carrier C	Rail	Route A	6	1.73	254.78
6	6	Carrier A	Air	Route A	8	3.89	923.44
7	7	Carrier B	Road	Route A	3	4.44	235.46
8	8	Carrier C	Sea	Route A	8	3.88	134.37
9	9	Carrier B	Road	Route C	1	2.35	802.06
10	10	Carrier C	Sea	Route B	7	3.40	505.56
11	11	Carrier A	Rail	Route B	1	7.17	995.93
12	12	Carrier C	Road	Route B	2	8.67	806.10
13	13	Carrier A	Air	Route A	1	4.52	126.72
14	14	Carrier A	Road	Route B	4	1.33	402.97
15	15	Carrier A	Road	Route B	9	9.54	547.24
16	16	Carrier B	Air	Route B	5	2.04	929.24
17	17	Carrier B	Sea	Route B	7	2.42	127.86
18	18	Carrier B	Air	Route A	1	4.19	865.53
19	19	Carrier C	Air	Route C	9	3.59	670.93
20	20	Carrier C	Sea	Route A	8	4.34	593.48
21	21	Carrier A	Road	Route C	3	4.74	477.31
22	22	Carrier A	Air	Route B	6	8.88	493.87
23	23	Carrier B	Air	Route C	6	6.04	523.36
24	24	Carrier A	Rail	Route C	10	9.57	205.57
25	25	Carrier A	Rail	Route A	7	2.92	196.33
26	26	Carrier C	Air	Route A	8	9.74	758.72
27	27	Carrier C	Road	Route B	3	2.23	458.54
28	28	Carrier B	Rail	Route A	4	6.51	617.87
29	29	Carrier C	Sea	Route B	8	7.41	762.46
30	30	Carrier B	Air	Route A	4	9.90	123.44
31	31	Carrier B	Road	Route B	7	8.10	764.94
32	32	Carrier B	Road	Route C	7	8.95	880.08
33	33	Carrier B	Rail	Route C	4	2.68	609.38
34	34	Carrier C	Road	Route A	4	6.60	761.17
35	35	Carrier C	Sea	Route A	9	4.86	371.26
36	36	Carrier A	Road	Route B	7	1.02	510.36
37	37	Carrier C	Sea	Route C	8	5.29	553.42
38	38	Carrier B	Air	Route C	3	2.11	403.81
39	39	Carrier A	Sea	Route A	9	1.53	183.93
40	40	Carrier B	Air	Route B	5	9.24	339.67
41	41	Carrier A	Air	Route B	3	5.56	653.67
42	42	Carrier C	Road	Route A	8	7.23	529.81
43	43	Carrier B	Sea	Route A	8	5.77	275.52
44	44	Carrier C	Road	Route A	4	7.53	635.66
45	45	Carrier B	Air	Route A	9	3.69	716.04
46	46	Carrier C	Rail	Route A	6	7.58	610.45
47	47	Carrier B	Rail	Route A	6	5.22	495.31
48	48	Carrier B	Road	Route B	8	4.07	380.44
49	49	Carrier B	Rail	Route A	9	8.98	581.60
50	50	Carrier C	Rail	Route B	3	7.10	768.65
51	51	Carrier C	Rail	Route A	6	2.51	336.89
52	52	Carrier A	Rail	Route B	10	6.25	496.25
53	53	Carrier A	Road	Route A	1	4.78	694.98
54	54	Carrier B	Air	Route C	1	8.63	602.90
55	55	Carrier B	Air	Route B	3	1.01	750.74
56	56	Carrier B	Road	Route B	3	4.31	814.07
57	57	Carrier A	Sea	Route B	5	5.01	323.01
58	58	Carrier C	Air	Route B	5	1.77	832.21
59	59	Carrier B	Rail	Route A	1	9.16	482.19
60	60	Carrier A	Road	Route B	7	4.94	110.36
61	61	Carrier B	Air	Route A	7	7.29	312.57
62	62	Carrier C	Rail	Route A	8	4.38	430.17
63	63	Carrier C	Air	Route A	7	9.03	164.37
64	64	Carrier C	Sea	Route C	7	7.29	320.85
65	65	Carrier A	Sea	Route A	4	2.46	687.29
66	66	Carrier C	Air	Route C	6	4.59	771.23
67	67	Carrier C	Rail	Route C	8	6.58	555.86
68	68	Carrier A	Road	Route A	8	2.22	393.84
69	69	Carrier C	Sea	Route C	9	9.15	169.27
70	70	Carrier B	Rail	Route A	8	1.19	299.71
71	71	Carrier B	Air	Route A	3	9.71	207.66
72	72	Carrier B	Road	Route C	4	6.32	183.27
73	73	Carrier A	Road	Route A	6	9.23	405.17
74	74	Carrier A	Rail	Route B	9	6.60	677.94
75	75	Carrier B	Road	Route A	5	1.51	866.47
76	76	Carrier A	Rail	Route A	5	5.24	341.55
77	77	Carrier C	Air	Route C	10	2.47	873.13
78	78	Carrier A	Rail	Route A	10	7.05	997.41
79	79	Carrier B	Road	Route B	4	6.78	852.57
80	80	Carrier B	Sea	Route C	5	8.47	323.59
81	81	Carrier B	Air	Route C	1	6.50	351.50
82	82	Carrier C	Sea	Route B	2	2.83	787.78
83	83	Carrier B	Rail	Route B	5	4.07	276.78
84	84	Carrier A	Road	Route C	1	4.71	589.98
85	85	Carrier B	Road	Route A	8	4.95	682.97
86	86	Carrier A	Air	Route B	10	8.38	465.46
87	87	Carrier C	Road	Route B	2	8.25	842.69
88	88	Carrier B	Rail	Route A	6	1.45	264.25
89	89	Carrier A	Sea	Route B	10	6.58	879.36
90	90	Carrier A	Sea	Route A	7	3.80	103.92
91	91	Carrier B	Rail	Route B	8	9.93	517.50
92	92	Carrier B	Rail	Route B	7	7.67	990.08
93	93	Carrier B	Rail	Route B	7	7.47	996.78
94	94	Carrier B	Rail	Route B	8	4.47	230.09
95	95	Carrier C	Air	Route A	1	7.01	823.52
96	96	Carrier B	Rail	Route B	9	6.94	846.67
97	97	Carrier B	Air	Route A	9	8.63	778.86
98	98	Carrier C	Road	Route A	3	5.35	188.74
99	99	Carrier A	Road	Route A	9	7.90	540.13
100	100	Carrier B	Rail	Route A	7	1.41	882.20
101	101	Carrier B	Rail	Route B	6	1.31	210.74
102	102	Carrier B	Road	Route B	4	2.96	187.75
103	103	Carrier A	Road	Route B	2	9.72	503.07
104	104	Carrier B	Air	Route C	2	8.05	141.92
105	105	Carrier C	Rail	Route A	6	1.73	254.78
106	106	Carrier A	Air	Route A	8	3.89	923.44
107	107	Carrier B	Road	Route A	3	4.44	235.46
108	108	Carrier C	Sea	Route A	8	3.88	134.37
109	109	Carrier B	Road	Route C	1	2.35	802.06
110	110	Carrier C	Sea	Route B	7	3.40	505.56
111	111	Carrier A	Rail	Route B	1	7.17	995.93
112	112	Carrier C	Road	Route B	2	8.67	806.10
113	113	Carrier A	Air	Route A	1	4.52	126.72
114	114	Carrier A	Road	Route B	4	1.33	402.97
115	115	Carrier A	Road	Route B	9	9.54	547.24
116	116	Carrier B	Air	Route B	5	2.04	929.24
117	117	Carrier B	Sea	Route B	7	2.42	127.86
118	118	Carrier B	Air	Route A	1	4.19	865.53
119	119	Carrier C	Air	Route C	9	3.59	670.93
120	120	Carrier C	Sea	Route A	8	4.34	593.48
121	121	Carrier A	Road	Route C	3	4.74	477.31
122	122	Carrier A	Air	Route B	6	8.88	493.87
123	123	Carrier B	Air	Route C	6	6.04	523.36
124	124	Carrier A	Rail	Route C	10	9.57	205.57
125	125	Carrier A	Rail	Route A	7	2.92	196.33
126	126	Carrier C	Air	Route A	8	9.74	758.72
127	127	Carrier C	Road	Route B	3	2.23	458.54
128	128	Carrier B	Rail	Route A	4	6.51	617.87
129	129	Carrier C	Sea	Route B	8	7.41	762.46
130	130	Carrier B	Air	Route A	4	9.90	123.44
131	131	Carrier B	Road	Route B	7	8.10	764.94
132	132	Carrier B	Road	Route C	7	8.95	880.08
133	133	Carrier B	Rail	Route C	4	2.68	609.38
134	134	Carrier C	Road	Route A	4	6.60	761.17
135	135	Carrier C	Sea	Route A	9	4.86	371.26
136	136	Carrier A	Road	Route B	7	1.02	510.36
137	137	Carrier C	Sea	Route C	8	5.29	553.42
138	138	Carrier B	Air	Route C	3	2.11	403.81
139	139	Carrier A	Sea	Route A	9	1.53	183.93
140	140	Carrier B	Air	Route B	5	9.24	339.67
141	141	Carrier A	Air	Route B	3	5.56	653.67
142	142	Carrier C	Road	Route A	8	7.23	529.81
143	143	Carrier B	Sea	Route A	8	5.77	275.52
144	144	Carrier C	Road	Route A	4	7.53	635.66
145	145	Carrier B	Air	Route A	9	3.69	716.04
146	146	Carrier C	Rail	Route A	6	7.58	610.45
147	147	Carrier B	Rail	Route A	6	5.22	495.31
148	148	Carrier B	Road	Route B	8	4.07	380.44
149	149	Carrier B	Rail	Route A	9	8.98	581.60
150	150	Carrier C	Rail	Route B	3	7.10	768.65
151	151	Carrier C	Rail	Route A	6	2.51	336.89
152	152	Carrier A	Rail	Route B	10	6.25	496.25
153	153	Carrier A	Road	Route A	1	4.78	694.98
154	154	Carrier B	Air	Route C	1	8.63	602.90
155	155	Carrier B	Air	Route B	3	1.01	750.74
156	156	Carrier B	Road	Route B	3	4.31	814.07
157	157	Carrier A	Sea	Route B	5	5.01	323.01
158	158	Carrier C	Air	Route B	5	1.77	832.21
159	159	Carrier B	Rail	Route A	1	9.16	482.19
160	160	Carrier A	Road	Route B	7	4.94	110.36
161	161	Carrier B	Air	Route A	7	7.29	312.57
162	162	Carrier C	Rail	Route A	8	4.38	430.17
163	163	Carrier C	Air	Route A	7	9.03	164.37
164	164	Carrier C	Sea	Route C	7	7.29	320.85
165	165	Carrier A	Sea	Route A	4	2.46	687.29
166	166	Carrier C	Air	Route C	6	4.59	771.23
167	167	Carrier C	Rail	Route C	8	6.58	555.86
168	168	Carrier A	Road	Route A	8	2.22	393.84
169	169	Carrier C	Sea	Route C	9	9.15	169.27
170	170	Carrier B	Rail	Route A	8	1.19	299.71
171	171	Carrier B	Air	Route A	3	9.71	207.66
172	172	Carrier B	Road	Route C	4	6.32	183.27
173	173	Carrier A	Road	Route A	6	9.23	405.17
174	174	Carrier A	Rail	Route B	9	6.60	677.94
175	175	Carrier B	Road	Route A	5	1.51	866.47
176	176	Carrier A	Rail	Route A	5	5.24	341.55
177	177	Carrier C	Air	Route C	10	2.47	873.13
178	178	Carrier A	Rail	Route A	10	7.05	997.41
179	179	Carrier B	Road	Route B	4	6.78	852.57
180	180	Carrier B	Sea	Route C	5	8.47	323.59
181	181	Carrier B	Air	Route C	1	6.50	351.50
182	182	Carrier C	Sea	Route B	2	2.83	787.78
183	183	Carrier B	Rail	Route B	5	4.07	276.78
184	184	Carrier A	Road	Route C	1	4.71	589.98
185	185	Carrier B	Road	Route A	8	4.95	682.97
186	186	Carrier A	Air	Route B	10	8.38	465.46
187	187	Carrier C	Road	Route B	2	8.25	842.69
188	188	Carrier B	Rail	Route A	6	1.45	264.25
189	189	Carrier A	Sea	Route B	10	6.58	879.36
190	190	Carrier A	Sea	Route A	7	3.80	103.92
191	191	Carrier B	Rail	Route B	8	9.93	517.50
192	192	Carrier B	Rail	Route B	7	7.67	990.08
193	193	Carrier B	Rail	Route B	7	7.47	996.78
194	194	Carrier B	Rail	Route B	8	4.47	230.09
195	195	Carrier C	Air	Route A	1	7.01	823.52
196	196	Carrier B	Rail	Route B	9	6.94	846.67
197	197	Carrier B	Air	Route A	9	8.63	778.86
198	198	Carrier C	Road	Route A	3	5.35	188.74
199	199	Carrier A	Road	Route A	9	7.90	540.13
200	200	Carrier B	Rail	Route A	7	1.41	882.20
201	201	Carrier B	Rail	Route B	6	1.31	210.74
\.


--
-- TOC entry 5080 (class 0 OID 16407)
-- Dependencies: 222
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, supplier_name, location) FROM stdin;
2	Supplier 4	Mumbai
3	Supplier 1	Delhi
4	Supplier 1	Bangalore
5	Supplier 2	Bangalore
6	Supplier 3	Delhi
7	Supplier 3	Chennai
8	Supplier 5	Delhi
9	Supplier 3	Bangalore
10	Supplier 1	Chennai
11	Supplier 4	Kolkata
12	Supplier 5	Mumbai
13	Supplier 5	Bangalore
14	Supplier 4	Delhi
15	Supplier 2	Chennai
16	Supplier 3	Mumbai
17	Supplier 3	Kolkata
18	Supplier 2	Delhi
19	Supplier 4	Chennai
20	Supplier 5	Kolkata
21	Supplier 2	Mumbai
22	Supplier 1	Kolkata
23	Supplier 4	Bangalore
24	Supplier 1	Mumbai
25	Supplier 5	Chennai
26	Supplier 2	Kolkata
\.


--
-- TOC entry 5081 (class 0 OID 16414)
-- Dependencies: 223
-- Data for Name: supplier_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_product (supplier_id, sku, supplier_lead_time) FROM stdin;
2	SKU60	29
2	SKU8	13
2	SKU95	18
2	SKU97	10
3	SKU35	3
3	SKU4	5
3	SKU53	1
3	SKU64	17
4	SKU15	14
4	SKU16	3
4	SKU70	22
4	SKU72	21
4	SKU83	20
5	SKU24	28
5	SKU26	26
5	SKU68	2
5	SKU71	2
5	SKU76	25
6	SKU58	18
6	SKU81	28
7	SKU31	24
7	SKU46	18
7	SKU80	8
7	SKU87	27
8	SKU49	28
9	SKU63	18
9	SKU79	5
9	SKU90	8
10	SKU17	7
10	SKU20	29
10	SKU34	4
10	SKU75	25
11	SKU12	3
11	SKU22	22
11	SKU25	19
11	SKU30	27
11	SKU61	14
11	SKU69	9
12	SKU27	25
12	SKU38	10
12	SKU43	1
12	SKU78	25
13	SKU13	23
13	SKU42	26
13	SKU51	18
14	SKU74	1
14	SKU91	5
15	SKU45	25
15	SKU9	29
15	SKU99	29
16	SKU0	29
16	SKU1	23
16	SKU96	28
17	SKU32	30
17	SKU37	24
17	SKU6	14
18	SKU36	26
18	SKU44	7
18	SKU50	20
18	SKU55	27
18	SKU57	21
18	SKU94	12
19	SKU19	20
19	SKU41	18
19	SKU73	13
19	SKU93	21
20	SKU10	18
20	SKU23	11
20	SKU3	24
20	SKU65	16
20	SKU66	24
21	SKU48	9
21	SKU62	13
21	SKU82	6
21	SKU88	21
21	SKU92	4
22	SKU14	25
22	SKU29	16
22	SKU40	18
22	SKU47	10
22	SKU54	26
22	SKU59	11
22	SKU77	26
22	SKU89	23
23	SKU5	10
23	SKU7	22
24	SKU2	12
24	SKU28	13
24	SKU52	10
24	SKU56	24
24	SKU67	10
24	SKU86	4
25	SKU21	19
25	SKU33	1
25	SKU84	24
25	SKU85	4
25	SKU98	28
26	SKU11	28
26	SKU18	18
26	SKU39	30
\.


--
-- TOC entry 5092 (class 0 OID 16514)
-- Dependencies: 234
-- Data for Name: temp_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_table ("Product type", "SKU", "Price", "Availability", "Number of products sold", "Revenue generated", "Customer demographics", "Stock levels", "Lead times", "Order quantities", "Shipping times", "Shipping carriers", "Shipping costs", "Supplier name", "Location", "Lead time", "Production volumes", "Manufacturing lead time", "Manufacturing costs", "Inspection results", "Defect rates", "Transportation modes", "Routes", "Costs") FROM stdin;
haircare	SKU0	69.80800554211577	55	802	8661.996792392383	Non-binary	58	7	96	4	Carrier B	2.956572139430807	Supplier 3	Mumbai	29	215	29	46.27987924050832	Pending	0.2264103608499251	Road	Route B	187.75207545920392
skincare	SKU1	14.84352327508434	95	736	7460.900065445849	Female	53	30	37	2	Carrier A	9.71657477143131	Supplier 3	Mumbai	23	517	30	33.61676895373	Pending	4.854068026388706	Road	Route B	503.0655791496692
haircare	SKU2	11.319683293090566	34	8	9577.74962586873	Unknown	1	10	88	2	Carrier B	8.054479261732155	Supplier 1	Mumbai	12	971	27	30.688019348284204	Pending	4.580592619199229	Air	Route C	141.92028177151906
skincare	SKU3	61.163343016437736	68	83	7766.836425685233	Non-binary	23	13	59	6	Carrier C	1.7295685635434288	Supplier 5	Kolkata	24	937	18	35.62474139712503	Fail	4.74664862064775	Rail	Route A	254.77615921928663
skincare	SKU4	4.805496036345893	26	871	2686.505151567447	Non-binary	5	3	56	8	Carrier A	3.890547915870672	Supplier 1	Delhi	5	414	3	92.06516059871284	Fail	3.145579522833002	Air	Route A	923.4406317119222
haircare	SKU5	1.6999760138659377	87	147	2828.348745975759	Non-binary	90	27	66	3	Carrier B	4.444098864382293	Supplier 4	Bangalore	10	104	17	56.7664755574318	Fail	2.7791935115711617	Road	Route A	235.4612367355375
skincare	SKU6	4.078332863107945	48	65	7823.476559531737	Male	11	15	58	8	Carrier C	3.880763302952003	Supplier 3	Kolkata	14	314	24	1.0850685695870688	Pending	1.0009106193041355	Sea	Route A	134.36909686103172
cosmetics	SKU7	42.95838438246007	59	426	8496.103813089838	Female	93	17	11	1	Carrier B	2.3483387844177805	Supplier 4	Bangalore	22	564	1	99.46610860359912	Fail	0.3981771868506506	Road	Route C	802.0563118175586
cosmetics	SKU8	68.71759674852733	78	150	7517.363210631127	Female	5	10	15	7	Carrier C	3.4047338570830266	Supplier 4	Mumbai	13	769	8	11.423027139565695	Pending	2.709862691109961	Sea	Route B	505.55713422546415
skincare	SKU9	64.01573294127854	35	980	4971.145987585558	Unknown	14	27	83	1	Carrier A	7.166645291048216	Supplier 2	Chennai	29	963	23	47.95760163495158	Pending	3.844614478767585	Rail	Route B	995.9294614986416
skincare	SKU10	15.707795681912138	11	996	2330.965802091949	Non-binary	51	13	80	2	Carrier C	8.673211211278613	Supplier 5	Kolkata	18	830	5	96.52735278531092	Pass	1.7273139283559424	Road	Route B	806.103177702923
skincare	SKU11	90.63545998228868	95	960	6099.944115581452	Female	46	23	60	1	Carrier A	4.523943124316663	Supplier 2	Kolkata	28	362	11	27.592363086663696	Pending	0.0211698213729943	Air	Route A	126.72303340940724
haircare	SKU12	71.21338907536008	41	336	2873.7414460214413	Unknown	100	30	85	4	Carrier A	1.325274010184522	Supplier 4	Kolkata	3	563	3	32.32128621342403	Fail	2.161253747555912	Road	Route B	402.9687890737706
skincare	SKU13	16.160393317379977	5	249	4052.738416237866	Male	80	8	48	9	Carrier A	9.537283061108338	Supplier 5	Bangalore	23	173	10	97.82905011017328	Pending	1.6310742300715386	Road	Route B	547.2410051609685
skincare	SKU14	99.1713286386242	26	562	8653.570926469802	Non-binary	54	29	78	5	Carrier B	2.039770189449332	Supplier 1	Kolkata	25	558	14	5.791436629862989	Pending	0.1006828515650937	Air	Route B	929.2352899608896
skincare	SKU15	36.98924492862691	94	469	5442.086785397673	Non-binary	9	8	69	7	Carrier B	2.4220397232752044	Supplier 1	Bangalore	14	580	7	97.12128175147431	Pass	2.264405761198549	Sea	Route B	127.8618000016254
skincare	SKU16	7.547172109791272	74	280	6453.797968176285	Female	2	5	78	1	Carrier B	4.191324585705502	Supplier 1	Bangalore	3	399	21	77.10634249785001	Pass	1.012563089258049	Air	Route A	865.5257797712403
cosmetics	SKU17	81.46253436923702	82	126	2629.396434845262	Female	45	17	85	9	Carrier C	3.585418958232342	Supplier 1	Chennai	7	453	16	47.679680368355335	Fail	0.1020207549181761	Air	Route C	670.9343907924103
haircare	SKU18	36.443627770460935	23	620	9364.673505076173	Unknown	10	10	46	8	Carrier C	4.339224714110709	Supplier 2	Kolkata	18	374	17	27.10798085484392	Pending	2.231939110729264	Sea	Route A	593.4802587206518
skincare	SKU19	51.12387008796474	100	187	2553.495584991215	Unknown	48	11	94	3	Carrier A	4.742635882841877	Supplier 4	Chennai	20	694	16	82.37332058799021	Fail	3.646450865417029	Road	Route C	477.3076310909034
skincare	SKU20	96.34107243996338	22	320	8128.027696851192	Unknown	27	12	68	6	Carrier A	8.87833465092684	Supplier 1	Chennai	29	309	6	65.68625960848863	Pass	4.231416573534539	Air	Route B	493.87121531620585
cosmetics	SKU21	84.89386898495083	60	601	7087.052696357437	Unknown	69	25	7	6	Carrier B	6.037883769218298	Supplier 5	Chennai	19	791	4	61.73572895416093	Pending	0.0186075676310149	Air	Route C	523.360914720158
haircare	SKU22	27.67978088650196	55	884	2390.8078665561734	Unknown	71	1	63	10	Carrier A	9.56764892092304	Supplier 4	Kolkata	22	780	28	50.12083961297735	Fail	2.591275473211116	Rail	Route C	205.57199582694707
cosmetics	SKU23	4.324341185864164	30	391	8858.367571011484	Unknown	84	5	29	7	Carrier A	2.924857601145554	Supplier 5	Kolkata	11	568	29	98.60995724270389	Pending	1.342291562722734	Rail	Route A	196.32944611241268
haircare	SKU24	4.156308359311108	32	209	9049.077860939897	Male	4	26	2	8	Carrier C	9.741291689284369	Supplier 2	Bangalore	28	447	3	40.382359702924816	Pending	3.691310292628728	Air	Route A	758.7247726029383
haircare	SKU25	39.62934398509263	73	142	2174.777054350654	Male	82	11	52	3	Carrier C	2.231073681281728	Supplier 4	Kolkata	19	934	23	78.28038311841539	Pending	3.797231217114183	Road	Route B	458.535945739209
haircare	SKU26	97.44694661789282	9	353	3716.493325894037	Male	59	16	48	4	Carrier B	6.507548621078551	Supplier 2	Bangalore	26	171	4	15.97222975718176	Pass	2.119319736724923	Rail	Route A	617.8669164583772
cosmetics	SKU27	92.55736081240202	42	352	2686.457223575984	Unknown	47	9	62	8	Carrier C	7.406750952998074	Supplier 5	Mumbai	25	291	4	10.528245070042162	Fail	2.864667837883373	Sea	Route B	762.4591821556837
cosmetics	SKU28	2.397274705597141	12	394	6117.324615083992	Female	48	15	24	4	Carrier B	9.898140508069222	Supplier 1	Mumbai	13	171	7	59.42938181069157	Fail	0.815757079295672	Air	Route A	123.43702751182708
cosmetics	SKU29	63.44755918520733	3	253	8318.903194617178	Female	45	5	67	7	Carrier B	8.100973145397031	Supplier 1	Kolkata	16	329	7	39.29287558606575	Pass	3.878098936588488	Road	Route B	764.9353759407081
haircare	SKU30	8.022859210526393	10	327	2766.342366866089	Male	60	26	35	7	Carrier B	8.954528315318015	Supplier 4	Kolkata	27	806	30	51.63489340010933	Pending	0.9653947053523932	Road	Route C	880.080988247161
skincare	SKU31	50.8473930517187	28	168	9655.135102719398	Male	6	17	44	4	Carrier B	2.6796609649814065	Supplier 3	Chennai	24	461	8	60.25114566159808	Pending	2.9890000066550746	Rail	Route C	609.3792066184267
skincare	SKU32	79.20993601565672	43	781	9571.55048732782	Unknown	89	13	64	4	Carrier C	6.599104901238584	Supplier 3	Kolkata	30	737	7	29.69246715374977	Pass	1.946036119386113	Road	Route A	761.1739095148776
cosmetics	SKU33	64.7954350001556	63	616	5149.9983504080365	Non-binary	4	17	95	9	Carrier C	4.85827050343664	Supplier 5	Chennai	1	251	23	23.853427512896133	Fail	3.541046012250923	Sea	Route A	371.255295519871
skincare	SKU34	37.46759232984246	96	602	9061.710895507724	Unknown	1	26	21	7	Carrier A	1.019487570822119	Supplier 1	Chennai	4	452	10	10.754272815029331	Pass	0.6466045593720549	Road	Route B	510.3580004335235
cosmetics	SKU35	84.95778681635043	11	449	6541.329344802465	Female	42	27	85	8	Carrier C	5.288189990327409	Supplier 1	Delhi	3	367	2	58.004787044743765	Pass	0.5411540980605811	Sea	Route C	553.4204712303558
skincare	SKU36	9.813002578754052	34	963	7573.402457848733	Female	18	23	28	3	Carrier B	2.107951267159081	Supplier 2	Delhi	26	671	19	45.531364237162144	Fail	3.8055333792433537	Air	Route C	403.8089742481805
skincare	SKU37	23.39984475261435	5	963	2438.339930470029	Female	25	8	21	9	Carrier A	1.5326552735904306	Supplier 3	Kolkata	24	867	15	34.34327746507538	Pending	2.610288084848113	Sea	Route A	183.9329680435944
cosmetics	SKU38	52.0759306827078	75	705	9692.318040218432	Non-binary	69	1	88	5	Carrier B	9.235931437249228	Supplier 5	Mumbai	10	841	12	5.930693645528318	Pending	0.6133268991645074	Air	Route B	339.6728699486061
skincare	SKU39	19.127477265823256	26	176	1912.4656631007608	Female	78	29	34	3	Carrier A	5.562503778830384	Supplier 2	Kolkata	30	791	6	9.005807428781642	Fail	1.451972203996816	Air	Route B	653.6729945520332
skincare	SKU40	80.54142417094033	97	933	5724.959350456265	Female	90	20	39	8	Carrier C	7.229595139736474	Supplier 1	Kolkata	18	793	1	88.17940710421746	Pending	4.213269430586566	Road	Route A	529.8087239806919
skincare	SKU41	99.11329161531717	35	556	5521.205259010972	Female	64	19	38	8	Carrier B	5.773263743766654	Supplier 4	Chennai	18	892	7	95.3320645487725	Fail	0.0453022623982596	Sea	Route A	275.5243711313098
skincare	SKU42	46.52916761451677	98	155	1839.609425856764	Female	22	27	57	4	Carrier C	7.526248326851508	Supplier 5	Bangalore	26	179	7	96.42282063957188	Fail	4.939255288620948	Road	Route A	635.6571205019919
haircare	SKU43	11.74327177630924	6	598	5737.425599119023	Unknown	36	29	85	9	Carrier B	3.6940212683884543	Supplier 5	Mumbai	1	206	23	26.27736595733241	Pending	0.3723047679850977	Air	Route A	716.0441197593407
cosmetics	SKU44	51.35579091311039	34	919	7152.2860494355145	Female	13	19	72	6	Carrier C	7.577449657376693	Supplier 2	Delhi	7	834	18	22.554106620887744	Fail	2.962626320454882	Rail	Route A	610.4532696192277
haircare	SKU45	33.78413803306551	1	24	5267.956807510521	Male	93	7	52	6	Carrier B	5.21515500871191	Supplier 2	Chennai	25	794	25	66.31254443999165	Pass	3.219604612084106	Rail	Route A	495.305697028474
haircare	SKU46	27.0822071998889	75	859	2556.767360633596	Non-binary	92	29	6	8	Carrier B	4.070955837084083	Supplier 3	Chennai	18	870	23	77.32235321105162	Pending	3.6486105925362033	Road	Route B	380.4359371119643
skincare	SKU47	95.71213588093607	93	910	7089.474249934186	Male	4	15	51	9	Carrier B	8.97875075594997	Supplier 1	Kolkata	10	964	20	19.712992911293647	Pending	0.3805735867132137	Rail	Route A	581.6023550505868
haircare	SKU48	76.03554442689172	28	29	7397.07100458718	Non-binary	30	16	9	3	Carrier C	7.0958331565551385	Supplier 2	Mumbai	9	109	18	23.126363582464776	Fail	1.6981125407144038	Rail	Route B	768.65191395437
cosmetics	SKU49	78.89791320564004	19	99	8001.613206519002	Unknown	97	24	9	6	Carrier C	2.5056210329009154	Supplier 5	Delhi	28	177	28	14.147815443979216	Pass	2.825813985400132	Rail	Route A	336.8901685199779
cosmetics	SKU50	14.203484264803022	91	633	5910.885389668899	Female	31	23	82	10	Carrier A	6.247860914975991	Supplier 2	Delhi	20	306	21	45.17875792463452	Fail	4.754800804671185	Rail	Route B	496.24865029194046
haircare	SKU51	26.70076097246173	61	154	9866.465457979695	Male	100	4	52	1	Carrier A	4.783000557947665	Supplier 5	Bangalore	18	673	28	14.19032834456998	Pending	1.7729511720835571	Road	Route A	694.9823175794459
skincare	SKU52	98.03182965646508	1	820	9435.76260891213	Male	64	11	11	1	Carrier B	8.631052179768947	Supplier 1	Mumbai	10	727	27	9.166849148597151	Pending	2.1224716191438247	Air	Route C	602.8984988383834
skincare	SKU53	30.34147071121421	93	242	8232.334829425821	Male	96	25	54	3	Carrier B	1.0134865660958965	Supplier 1	Delhi	1	631	17	83.34405899167797	Pending	1.4103475760760271	Air	Route B	750.7378406682709
haircare	SKU54	31.146243160240854	11	622	6088.021479940859	Non-binary	33	22	61	3	Carrier B	4.305103471287636	Supplier 1	Kolkata	26	497	29	30.186023375822508	Pass	2.478771975539748	Road	Route B	814.0699965821875
haircare	SKU55	79.85505834078943	16	701	2925.6751703038126	Male	97	11	11	5	Carrier A	5.014364955030907	Supplier 2	Delhi	27	918	5	30.3235452566165	Fail	4.548919659396385	Sea	Route B	323.01292795247883
skincare	SKU56	20.986386037043378	90	93	4767.020484344137	Non-binary	25	23	83	5	Carrier C	1.7744297140717396	Supplier 1	Mumbai	24	826	28	12.836284572832753	Pass	1.173755495387454	Air	Route B	832.2108087060217
haircare	SKU57	49.26320535073416	65	227	1605.8669003924058	Unknown	5	18	51	1	Carrier B	9.16055853538187	Supplier 2	Delhi	21	588	25	67.77962298707814	Pending	2.511174830212707	Rail	Route A	482.1912386025281
skincare	SKU58	59.84156137728931	81	896	2021.149810337108	Non-binary	10	5	44	7	Carrier A	4.93843856471209	Supplier 3	Delhi	18	396	7	65.04741509469146	Fail	1.7303747198591968	Road	Route B	110.36433523136472
cosmetics	SKU59	63.828398347710966	30	484	1061.618523013288	Non-binary	100	16	26	7	Carrier B	7.293722596867728	Supplier 1	Kolkata	11	176	4	1.900762243519458	Fail	0.4471940154638232	Air	Route A	312.5742736100933
skincare	SKU60	17.028027920188702	16	380	8864.084349586436	Female	41	27	72	8	Carrier C	4.3813681581023145	Supplier 4	Mumbai	29	929	24	87.21305781513568	Fail	2.853090616649054	Rail	Route A	430.1690969751365
haircare	SKU61	52.02874990329492	23	117	6885.589350896253	Unknown	32	23	36	7	Carrier C	9.030340422521949	Supplier 4	Kolkata	14	480	12	78.7023939688789	Fail	4.367470538205053	Air	Route A	164.36652824341942
cosmetics	SKU62	72.79635395558736	89	270	3899.746833729224	Unknown	86	2	40	7	Carrier C	7.291701388776776	Supplier 2	Mumbai	13	751	14	21.048642725168644	Pass	1.8740014040443749	Sea	Route C	320.8465157591116
skincare	SKU63	13.017376785287857	55	246	4256.949140850225	Non-binary	54	19	10	4	Carrier A	2.45793352798733	Supplier 3	Bangalore	18	736	10	20.075003975630484	Pending	3.6328432903821337	Sea	Route A	687.2861778664173
skincare	SKU64	89.63409560813533	11	134	8458.730878367178	Female	73	27	75	6	Carrier C	4.585353468194652	Supplier 1	Delhi	17	328	6	8.693042425877287	Fail	0.1594863147175146	Air	Route C	771.2250846811575
skincare	SKU65	33.69771720664313	72	457	8354.579686481995	Male	57	24	54	8	Carrier C	6.580541347884595	Supplier 5	Kolkata	16	358	21	1.5972227430506774	Fail	4.911095954842331	Rail	Route C	555.8591036717435
skincare	SKU66	26.03486977396209	52	704	8367.721618020154	Female	13	17	19	8	Carrier A	2.2161427287713638	Supplier 5	Kolkata	24	867	28	42.08443673830996	Fail	3.4480632883402618	Road	Route A	393.8433485784279
skincare	SKU67	87.75543235400107	16	513	9473.798032508335	Unknown	12	9	71	9	Carrier C	9.147811544710631	Supplier 1	Mumbai	10	198	11	7.057876146978231	Pass	0.1319554443118148	Sea	Route C	169.2718013847869
haircare	SKU68	37.93181238279032	29	163	3550.218432780992	Non-binary	0	8	58	8	Carrier B	1.1942518648849991	Supplier 2	Bangalore	2	375	18	97.1135815634622	Fail	1.98346787217418	Rail	Route A	299.7063031181032
skincare	SKU69	54.86552851706979	62	511	1752.3810874841247	Non-binary	95	1	27	3	Carrier B	9.705286790120349	Supplier 4	Kolkata	9	862	7	77.62776581274817	Pending	1.3623879886491086	Air	Route A	207.6632062085756
haircare	SKU70	47.914541824058766	90	32	7014.887987203389	Female	10	12	22	4	Carrier B	6.315717754600723	Supplier 1	Bangalore	22	775	16	11.440781823761265	Pass	1.8305755986122316	Road	Route C	183.272898748711
cosmetics	SKU71	6.381533162747966	14	637	8180.337085425443	Female	76	2	26	6	Carrier A	9.228190317052515	Supplier 2	Bangalore	2	258	10	30.66167747785956	Pending	2.078750607874969	Road	Route A	405.1670678888559
cosmetics	SKU72	90.20442752052809	88	478	2633.121981312256	Non-binary	57	29	77	9	Carrier A	6.599614159689544	Supplier 1	Bangalore	21	152	11	55.76049289524421	Pending	3.213329607438309	Rail	Route B	677.9445698461833
cosmetics	SKU73	83.8510176813046	41	375	7910.886916140686	Male	17	25	66	5	Carrier B	1.5129368369160772	Supplier 4	Chennai	13	444	4	46.87023879761716	Fail	4.620546064513706	Road	Route A	866.4728001296578
haircare	SKU74	3.170011413566155	64	904	5709.945295969287	Female	41	6	1	5	Carrier A	5.237654650037448	Supplier 4	Delhi	1	919	9	80.58085215644782	Fail	0.3966127241099354	Rail	Route A	341.55265678322337
skincare	SKU75	92.99688423397066	29	106	1889.073589779335	Non-binary	16	20	56	10	Carrier C	2.473897761045461	Supplier 1	Chennai	25	759	11	48.06478264000659	Pass	2.030069088668752	Air	Route C	873.1296480176514
haircare	SKU76	69.10879954743032	23	241	5328.375984297758	Male	38	1	22	10	Carrier A	7.054538336836926	Supplier 2	Bangalore	25	985	24	64.32359779560022	Pending	2.1800374515822165	Rail	Route A	997.4134501331946
haircare	SKU77	57.44974295897148	14	359	2483.7601775427947	Unknown	96	28	57	4	Carrier B	6.780946625617895	Supplier 1	Kolkata	26	334	5	42.95244474899184	Pass	3.055141818307548	Road	Route B	852.56809891985
haircare	SKU78	6.306883176111915	50	946	1292.4584179377562	Unknown	5	4	51	5	Carrier B	8.46704977086199	Supplier 5	Mumbai	25	858	21	71.12651472040338	Pending	4.096881332470452	Sea	Route C	323.59220343132216
haircare	SKU79	57.05703122110322	56	198	7888.723268427081	Non-binary	31	25	20	1	Carrier B	6.4963253642950445	Supplier 3	Bangalore	5	228	12	57.87090292403628	Pending	0.1658716274806082	Air	Route C	351.50421933503867
skincare	SKU80	91.12831835044432	75	872	8651.672682982065	Unknown	39	14	41	2	Carrier C	2.8331846794189746	Supplier 3	Chennai	8	202	5	76.96122802382001	Fail	2.8496621985053308	Sea	Route B	787.7798504943445
haircare	SKU81	72.81920693031822	9	774	4384.413400045863	Unknown	48	6	8	5	Carrier B	4.066277501512044	Supplier 3	Delhi	28	698	1	19.789592941903603	Pending	2.547547121548712	Rail	Route B	276.77833594679885
skincare	SKU82	17.034930739467917	13	336	2943.3818676094515	Unknown	42	19	72	1	Carrier A	4.70818187354193	Supplier 2	Mumbai	6	955	26	4.46527843494324	Pending	4.137877048622357	Road	Route C	589.9785556280407
haircare	SKU83	68.91124621160633	82	663	2411.754632110491	Unknown	65	24	7	8	Carrier B	4.949839577996949	Supplier 1	Bangalore	20	443	5	97.73059380053304	Fail	0.7730061340672478	Road	Route A	682.9710182260933
haircare	SKU84	89.10436729210225	99	618	2048.2900998487103	Unknown	73	26	80	10	Carrier A	8.381615624922631	Supplier 5	Chennai	24	589	22	33.808636513209095	Pass	4.843456577118041	Air	Route B	465.457005963688
cosmetics	SKU85	76.96299441519388	83	25	8684.613059253858	Female	15	18	66	2	Carrier C	8.249168704871728	Supplier 5	Chennai	4	211	2	69.9293455186723	Fail	1.3744289997457582	Road	Route B	842.6868300046415
skincare	SKU86	19.99817694040422	18	223	1229.5910285649834	Unknown	32	14	22	6	Carrier B	1.4543053101535517	Supplier 1	Mumbai	4	569	18	74.60896999519468	Pass	2.0515129307662465	Rail	Route A	264.2548898358665
haircare	SKU87	80.41403665035574	24	79	5133.846701086692	Male	5	7	55	10	Carrier A	6.575803797548535	Supplier 3	Chennai	27	523	17	28.69699682414317	Fail	3.693737787839276	Sea	Route B	879.3592177349243
cosmetics	SKU88	75.27040697572501	58	737	9444.74203306298	Male	60	18	85	7	Carrier A	3.8012531329310777	Supplier 2	Mumbai	21	953	11	68.18491905704117	Pending	0.722204401882931	Sea	Route A	103.91624796070496
cosmetics	SKU89	97.76008558193868	10	134	5924.682566853231	Unknown	90	1	27	8	Carrier B	9.92981624527726	Supplier 1	Kolkata	23	370	11	46.60387338164447	Pending	1.9076657339590744	Rail	Route B	517.4999739290605
skincare	SKU90	13.881913501359142	56	320	9592.633570280312	Non-binary	66	18	96	7	Carrier B	7.674430708112694	Supplier 3	Bangalore	8	585	8	85.67596333579797	Pass	1.2193822244013883	Rail	Route B	990.0784725058112
cosmetics	SKU91	62.11196546396179	90	916	1935.206793507599	Male	98	22	85	7	Carrier B	7.471514084401146	Supplier 4	Delhi	5	207	28	39.772882502339975	Pending	0.6260018582093946	Rail	Route B	996.7783149506238
cosmetics	SKU92	47.71423307582023	44	276	2100.1297546259366	Male	90	25	10	8	Carrier B	4.469500026123601	Supplier 2	Mumbai	4	671	29	62.61269039561434	Pass	0.3334318252247392	Rail	Route B	230.0927825367629
haircare	SKU93	69.29083100290549	88	114	4531.4021336919095	Unknown	63	17	66	1	Carrier C	7.0064320590043945	Supplier 4	Chennai	21	824	20	35.63365234334388	Fail	4.165781795424145	Air	Route A	823.5238458881558
cosmetics	SKU94	3.037688724631414	97	987	7888.356546661873	Unknown	77	26	72	9	Carrier B	6.942945942032581	Supplier 2	Delhi	12	908	14	60.38737861486212	Pass	1.4636074984727798	Rail	Route B	846.6652569866948
haircare	SKU95	77.90392721944775	65	672	7386.363944048664	Unknown	15	14	26	9	Carrier B	8.630338869602754	Supplier 4	Mumbai	18	450	26	58.89068576858998	Pending	1.2108821295850665	Air	Route A	778.8642413766479
cosmetics	SKU96	24.42313142037338	29	324	7698.424765632117	Non-binary	67	2	32	3	Carrier C	5.352878043996809	Supplier 3	Mumbai	28	648	28	17.80375633139127	Pending	3.872047681482133	Road	Route A	188.74214114905695
haircare	SKU97	3.526111259143416	56	62	4370.916579984536	Male	46	19	4	9	Carrier A	7.904845611209675	Supplier 4	Mumbai	10	535	13	65.76515592636746	Fail	3.376237834717981	Road	Route A	540.1324228679678
skincare	SKU98	19.7546048668786	43	913	8525.952559683526	Female	53	1	27	7	Carrier B	1.409801095138073	Supplier 5	Chennai	28	581	9	5.604690864371781	Pending	2.908122169351261	Rail	Route A	882.1988635470415
haircare	SKU99	68.51783269927664	17	627	9185.185829181704	Unknown	55	8	59	6	Carrier B	1.3110237561206226	Supplier 2	Chennai	29	921	2	38.07289852062604	Fail	0.3460272907055034	Rail	Route B	210.74300896424612
\.


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 230
-- Name: inspection_inspection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inspection_inspection_id_seq', 1, true);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 228
-- Name: manufacturing_manufacturing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturing_manufacturing_id_seq', 101, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 226
-- Name: purchase_order_poid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_poid_seq', 201, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 224
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 101, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 232
-- Name: shipping_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_shipment_id_seq', 201, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 26, true);


--
-- TOC entry 4918 (class 2606 OID 16482)
-- Name: inspection inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection
    ADD CONSTRAINT inspection_pkey PRIMARY KEY (inspection_id);


--
-- TOC entry 4906 (class 2606 OID 16400)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (sku);


--
-- TOC entry 4916 (class 2606 OID 16469)
-- Name: manufacturing manufacturing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturing
    ADD CONSTRAINT manufacturing_pkey PRIMARY KEY (manufacturing_id);


--
-- TOC entry 4904 (class 2606 OID 16394)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (sku);


--
-- TOC entry 4914 (class 2606 OID 16451)
-- Name: purchase_order purchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (poid);


--
-- TOC entry 4912 (class 2606 OID 16438)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 4920 (class 2606 OID 16495)
-- Name: shipping shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 4908 (class 2606 OID 16413)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4910 (class 2606 OID 16420)
-- Name: supplier_product supplier_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_product
    ADD CONSTRAINT supplier_product_pkey PRIMARY KEY (supplier_id, sku);


--
-- TOC entry 4928 (class 2606 OID 16483)
-- Name: inspection inspection_manufacturing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection
    ADD CONSTRAINT inspection_manufacturing_id_fkey FOREIGN KEY (manufacturing_id) REFERENCES public.manufacturing(manufacturing_id);


--
-- TOC entry 4921 (class 2606 OID 16401)
-- Name: inventory inventory_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_sku_fkey FOREIGN KEY (sku) REFERENCES public.product(sku);


--
-- TOC entry 4927 (class 2606 OID 16470)
-- Name: manufacturing manufacturing_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturing
    ADD CONSTRAINT manufacturing_sku_fkey FOREIGN KEY (sku) REFERENCES public.product(sku);


--
-- TOC entry 4925 (class 2606 OID 16457)
-- Name: purchase_order purchase_order_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_sku_fkey FOREIGN KEY (sku) REFERENCES public.product(sku);


--
-- TOC entry 4926 (class 2606 OID 16452)
-- Name: purchase_order purchase_order_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- TOC entry 4924 (class 2606 OID 16439)
-- Name: sales sales_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_sku_fkey FOREIGN KEY (sku) REFERENCES public.product(sku);


--
-- TOC entry 4929 (class 2606 OID 16496)
-- Name: shipping shipping_poid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_poid_fkey FOREIGN KEY (poid) REFERENCES public.purchase_order(poid);


--
-- TOC entry 4922 (class 2606 OID 16426)
-- Name: supplier_product supplier_product_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_product
    ADD CONSTRAINT supplier_product_sku_fkey FOREIGN KEY (sku) REFERENCES public.product(sku);


--
-- TOC entry 4923 (class 2606 OID 16421)
-- Name: supplier_product supplier_product_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_product
    ADD CONSTRAINT supplier_product_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


-- Completed on 2026-03-31 17:43:54

--
-- PostgreSQL database dump complete
--

\unrestrict 0C0nhBttUol6axCPKCkPZK9zyIl40NylYJQjy6kwffQ8sLBTeToK3xik1YtwOSI

