--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-12-27 15:25:55

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

--
-- TOC entry 239 (class 1255 OID 17194)
-- Name: hasta_ara(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hasta_ara(aranan_id character) RETURNS TABLE("TCKimlikNo" character, "Ad" character varying, "Soyad" character varying, "DogumTarihi" date, "TelNo" character, "HastaNo" integer)
    LANGUAGE plpgsql
    AS $$
begin
	return query select * from hasta
	where hasta."TCKimlikNo" = aranan_id;
end;
$$;


ALTER FUNCTION public.hasta_ara(aranan_id character) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 17189)
-- Name: hasta_ekle(character, character varying, character varying, date, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hasta_ekle(tc character, ad character varying, soyad character varying, dogum_tarihi date, tel_no character) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
	insert into hasta ("TCKimlikNo", "Ad", "Soyad", "DogumTarihi", "TelNo")
values (tc, ad,soyad, dogum_tarihi, tel_no);
end;
$$;


ALTER FUNCTION public.hasta_ekle(tc character, ad character varying, soyad character varying, dogum_tarihi date, tel_no character) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 17206)
-- Name: hasta_listele(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hasta_listele() RETURNS TABLE(tc character, ad character varying, soyad character varying, dogum_tarihi date, tel_no character, hasta_no integer)
    LANGUAGE plpgsql
    AS $$
begin
	return query
	select "TCKimlikNo",
	"Ad",
	"Soyad",
	"DogumTarihi",
	"TelNo",
	"HastaNo"
	from hasta;
end;
$$;


ALTER FUNCTION public.hasta_listele() OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 17195)
-- Name: hasta_sil(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hasta_sil(silinen_id character) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
delete from hasta where hasta."TCKimlikNo"=silinen_id;
end
$$;


ALTER FUNCTION public.hasta_sil(silinen_id character) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 17191)
-- Name: kayit_mesaj(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kayit_mesaj() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	if new."TCKimlikNo" is not null then 
		raise notice 'YENİ KAYIT EKLEMESİ BAŞARILI!';
	end if;
	return new;
end;
$$;


ALTER FUNCTION public.kayit_mesaj() OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 17190)
-- Name: personel_listele(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personel_listele() RETURNS TABLE(sicil_no integer, tc character, ad character varying, soyad character varying, dogum_tarihi date, tel_no character, maas real, personel_tipi character varying)
    LANGUAGE plpgsql
    AS $$
begin
	return query
	select "SicilNo",
	"TCKimlikNo",
	"Ad",
	"Soyad",
	"DogumTarihi",
	"TelNo",
	"Maas",
	"PersonelTipi"
	from personel;
end;
$$;


ALTER FUNCTION public.personel_listele() OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 17196)
-- Name: personelazalt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personelazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
update "hastaneBinasi" set "PersonelSayisi" = "PersonelSayisi" - 1;
return new;
end;
$$;


ALTER FUNCTION public.personelazalt() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 17198)
-- Name: personelsayisi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personelsayisi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
update "hastaneBinasi" set "PersonelSayisi" = "PersonelSayisi" + 1;
return new;
end;
$$;


ALTER FUNCTION public.personelsayisi() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 17110)
-- Name: soyad_degisiklik(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.soyad_degisiklik() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	if new."Soyad" <> old."Soyad" then
		insert into "HastaDegisiklik"("TCKimlikNo", "Ad", "Soyad", "DogumTarihi", "TelNo", "HastaNo", "DegisiklikTarihi")
		values(old."TCKimlikNo", old."Ad", old."Soyad", old."DogumTarihi", old."TelNo", old."HastaNo", current_timestamp::timestamp);
	end if;
	return new;
end;
$$;


ALTER FUNCTION public.soyad_degisiklik() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 17193)
-- Name: toplam_hasta(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam_hasta() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	toplam integer;
BEGIN
   SELECT count(*) into toplam FROM hasta;
   RETURN toplam;
END;
$$;


ALTER FUNCTION public.toplam_hasta() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16420)
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta (
    "TCKimlikNo" character(11) NOT NULL,
    "Ad" character varying(40) NOT NULL,
    "Soyad" character varying(40) NOT NULL,
    "DogumTarihi" date NOT NULL,
    "TelNo" character(10) NOT NULL,
    "HastaNo" integer
);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17165)
-- Name: HASTA_HastaNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HASTA_HastaNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HASTA_HastaNo_seq" OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 235
-- Name: HASTA_HastaNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HASTA_HastaNo_seq" OWNED BY public.hasta."HastaNo";


--
-- TOC entry 234 (class 1259 OID 17105)
-- Name: HastaDegisiklik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HastaDegisiklik" (
    "TCKimlikNo" character(11) NOT NULL,
    "Ad" character varying(40) NOT NULL,
    "Soyad" character varying(40) NOT NULL,
    "DogumTarihi" date NOT NULL,
    "TelNo" character(10) NOT NULL,
    "HastaNo" integer NOT NULL,
    "DegisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."HastaDegisiklik" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16944)
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    "SicilNo" integer NOT NULL,
    "TCKimlikNo" character(11) NOT NULL,
    "Ad" character varying(40) NOT NULL,
    "Soyad" character varying(40) NOT NULL,
    "DogumTarihi" date NOT NULL,
    "TelNo" character(10) NOT NULL,
    "Maas" real NOT NULL,
    "PersonelTipi" character varying(40) NOT NULL
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16943)
-- Name: PERSONEL_SicilNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PERSONEL_SicilNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PERSONEL_SicilNo_seq" OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 220
-- Name: PERSONEL_SicilNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PERSONEL_SicilNo_seq" OWNED BY public.personel."SicilNo";


--
-- TOC entry 228 (class 1259 OID 16976)
-- Name: randevu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.randevu (
    "RandevuNo" integer NOT NULL,
    "Tarih" date NOT NULL,
    "Saat" time without time zone NOT NULL,
    "KlinikNo" integer NOT NULL,
    "SicilNo" integer NOT NULL,
    "MuayeneNo" integer NOT NULL,
    "TCKimlikNo" character(11) NOT NULL,
    "BinaNo" integer NOT NULL
);


ALTER TABLE public.randevu OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16975)
-- Name: RANDEVU_RandevuNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RANDEVU_RandevuNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RANDEVU_RandevuNo_seq" OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 227
-- Name: RANDEVU_RandevuNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RANDEVU_RandevuNo_seq" OWNED BY public.randevu."RandevuNo";


--
-- TOC entry 230 (class 1259 OID 16983)
-- Name: recete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recete (
    "ReceteNo" integer NOT NULL,
    "Ilac" character varying(40) NOT NULL,
    "ReceteTarihi" date NOT NULL,
    "SicilNo" integer NOT NULL,
    "TCKimlikNo" character(11) NOT NULL
);


ALTER TABLE public.recete OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16982)
-- Name: RECETE_ReceteNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RECETE_ReceteNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RECETE_ReceteNo_seq" OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 229
-- Name: RECETE_ReceteNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RECETE_ReceteNo_seq" OWNED BY public.recete."ReceteNo";


--
-- TOC entry 232 (class 1259 OID 16990)
-- Name: ziyaret; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ziyaret (
    "MuayeneNo" integer NOT NULL,
    "MuayeneTarihi" date NOT NULL,
    "IslemTuru" character varying(40) NOT NULL,
    "IslemAdi" character varying(40) NOT NULL,
    "TCKimlikNo" character(11) NOT NULL,
    "SicilNo" integer NOT NULL
);


ALTER TABLE public.ziyaret OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16989)
-- Name: ZIYARET_MuayeneNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ZIYARET_MuayeneNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ZIYARET_MuayeneNo_seq" OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 231
-- Name: ZIYARET_MuayeneNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ZIYARET_MuayeneNo_seq" OWNED BY public.ziyaret."MuayeneNo";


--
-- TOC entry 226 (class 1259 OID 16970)
-- Name: danisma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.danisma (
    "SicilNo" integer NOT NULL
);


ALTER TABLE public.danisma OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16950)
-- Name: doktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doktor (
    "SicilNo" integer NOT NULL,
    "Unvan" character varying(40) NOT NULL,
    "Brans" character varying(40) NOT NULL
);


ALTER TABLE public.doktor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16960)
-- Name: hastaBakici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hastaBakici" (
    "SicilNo" integer NOT NULL
);


ALTER TABLE public."hastaBakici" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16504)
-- Name: hasta_teshis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta_teshis (
    "TCKimlikNo" character(11) NOT NULL,
    "TeshisNo" integer NOT NULL,
    "TeshisNotu" text NOT NULL
);


ALTER TABLE public.hasta_teshis OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16448)
-- Name: hastaneBinasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hastaneBinasi" (
    "BinaNo" integer NOT NULL,
    "PersonelSayisi" integer NOT NULL,
    "HastaKapasitesi" integer NOT NULL,
    "BinaAdi" character varying(40) NOT NULL,
    "TelNo" character(10) NOT NULL,
    "Il" character varying(30) NOT NULL,
    "Ilce" character varying(30) NOT NULL
);


ALTER TABLE public."hastaneBinasi" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16955)
-- Name: hizmet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hizmet (
    "SicilNo" integer NOT NULL
);


ALTER TABLE public.hizmet OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16425)
-- Name: odeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odeme (
    "OdemeNo" character varying(40) NOT NULL,
    "OdemeTarihi" date NOT NULL,
    "OdemeTuru" character varying(20) NOT NULL,
    "ToplamTutar" integer NOT NULL,
    "TCKimlikNo" character(11) NOT NULL
);


ALTER TABLE public.odeme OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16523)
-- Name: poli_bina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poli_bina (
    "BinaNo" integer NOT NULL,
    "KlinikNo" integer NOT NULL
);


ALTER TABLE public.poli_bina OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16443)
-- Name: poliklinik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poliklinik (
    "KlinikNo" integer NOT NULL,
    "KlinikAdi" character varying(40) NOT NULL
);


ALTER TABLE public.poliklinik OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16997)
-- Name: teshis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teshis (
    "TeshisNo" integer NOT NULL,
    "TeshisAdi" character varying(40) NOT NULL,
    "TedaviYontemi" text NOT NULL
);


ALTER TABLE public.teshis OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16965)
-- Name: yonetici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yonetici (
    "SicilNo" integer NOT NULL,
    "IdariBirim" character varying(40) NOT NULL
);


ALTER TABLE public.yonetici OWNER TO postgres;

--
-- TOC entry 3251 (class 2604 OID 17166)
-- Name: hasta HastaNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta ALTER COLUMN "HastaNo" SET DEFAULT nextval('public."HASTA_HastaNo_seq"'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16947)
-- Name: personel SicilNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel ALTER COLUMN "SicilNo" SET DEFAULT nextval('public."PERSONEL_SicilNo_seq"'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16979)
-- Name: randevu RandevuNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu ALTER COLUMN "RandevuNo" SET DEFAULT nextval('public."RANDEVU_RandevuNo_seq"'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16986)
-- Name: recete ReceteNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete ALTER COLUMN "ReceteNo" SET DEFAULT nextval('public."RECETE_ReceteNo_seq"'::regclass);


--
-- TOC entry 3255 (class 2604 OID 16993)
-- Name: ziyaret MuayeneNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ziyaret ALTER COLUMN "MuayeneNo" SET DEFAULT nextval('public."ZIYARET_MuayeneNo_seq"'::regclass);


--
-- TOC entry 3495 (class 0 OID 17105)
-- Dependencies: 234
-- Data for Name: HastaDegisiklik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HastaDegisiklik" ("TCKimlikNo", "Ad", "Soyad", "DogumTarihi", "TelNo", "HastaNo", "DegisiklikTarihi") FROM stdin;
12345678910	Sinem	Karaca	2001-11-20	5462702749	3	2022-12-23 13:54:44.559862
23456      	michael	scott	1974-05-05	5462702740	3	2022-12-24 19:17:11.126952
2          	Pam	Beesly	1980-04-04	5462702749	31	2022-12-25 13:14:27.326956
57         	Yıldız	Tilbe	1979-12-12	5346576779	38	2022-12-25 19:31:32.464441
123456     	Creed	Doe	2001-03-08	5077975082	35	2022-12-26 17:07:59.954293
98765432110	Zehra	Bak	2002-02-26	5077975082	1	2022-12-26 19:02:45.569246
53         	Muhittin	Bilen	1980-07-12	6783455678	40	2022-12-26 20:11:54.301428
123456788  	Andrew	Bernard	2001-03-20	5077975082	28	2022-12-26 22:20:44.198632
234567     	dwight	schrute	1974-05-06	5462702740	4	2022-12-27 15:21:23.082379
\.


--
-- TOC entry 3487 (class 0 OID 16970)
-- Dependencies: 226
-- Data for Name: danisma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.danisma ("SicilNo") FROM stdin;
5
18
\.


--
-- TOC entry 3483 (class 0 OID 16950)
-- Dependencies: 222
-- Data for Name: doktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doktor ("SicilNo", "Unvan", "Brans") FROM stdin;
4	Profesör	Dermatoloji
6	Doçent	Kardiyoloji
11	Doçent	Nöroloji
13	Profesör	Dahiliye
16	Profesör	Fizyoloji
17	Doçent	Psikiyatri
1	Doktor	Diş
2	Profesör	Kardiyoloji
3	Doçent	Psikiyatri
\.


--
-- TOC entry 3475 (class 0 OID 16420)
-- Dependencies: 214
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasta ("TCKimlikNo", "Ad", "Soyad", "DogumTarihi", "TelNo", "HastaNo") FROM stdin;
12345678910	Sinem	Balcıoğlu	2001-11-20	5462702749	2
98765432110	Zehra	karataş	2002-02-26	2345      	1
53         	Muhittin	Biilmeyen	1980-07-12	          	40
123456788  	Andrew	Adams	2001-03-20	          	28
234567     	dwight	Schruteee	1974-05-06	          	4
123478     	Jim	Halpert	1986-03-03	5462702749	26
34         	Kelly	Kapoor	1989-12-03	1111111111	33
23456      	michael	Scarn	1974-05-05	5462702740	3
57         	Yıldız	Star	1979-12-12	          	38
123456     	Creed	Adams	2001-03-08	5077975082	35
\.


--
-- TOC entry 3485 (class 0 OID 16960)
-- Dependencies: 224
-- Data for Name: hastaBakici; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."hastaBakici" ("SicilNo") FROM stdin;
8
\.


--
-- TOC entry 3479 (class 0 OID 16504)
-- Dependencies: 218
-- Data for Name: hasta_teshis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasta_teshis ("TCKimlikNo", "TeshisNo", "TeshisNotu") FROM stdin;
\.


--
-- TOC entry 3478 (class 0 OID 16448)
-- Dependencies: 217
-- Data for Name: hastaneBinasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."hastaneBinasi" ("BinaNo", "PersonelSayisi", "HastaKapasitesi", "BinaAdi", "TelNo", "Il", "Ilce") FROM stdin;
1	18	1000	SinZe	2165611740	İstanbul	Sancaktepe
2	18	78	SakaryaDevletHastanesi	123       	Sakarya	Serdivan
3	18	99	MalatyaDevletHastanesi	234       	Malatya	Merkez
4	18	100	SinopDevletHastanesi	345       	Sinop	Boyabat
5	18	350	OrduDevletHastanesi	456       	Ordu	Fatsa
6	18	95	YalovaDevletHastanesi	567       	Yalova	Çınarcık
\.


--
-- TOC entry 3484 (class 0 OID 16955)
-- Dependencies: 223
-- Data for Name: hizmet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hizmet ("SicilNo") FROM stdin;
7
14
\.


--
-- TOC entry 3476 (class 0 OID 16425)
-- Dependencies: 215
-- Data for Name: odeme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.odeme ("OdemeNo", "OdemeTarihi", "OdemeTuru", "ToplamTutar", "TCKimlikNo") FROM stdin;
1	2022-12-12	Nakit	100	12345678910
2	2022-12-13	Nakit	90	234567     
3	2022-12-17	Kart	230	123456788  
4	2022-12-17	Nakit	100	98765432110
5	2022-12-18	Kart	1345	34         
6	2022-12-12	Nakit	123	123456     
\.


--
-- TOC entry 3482 (class 0 OID 16944)
-- Dependencies: 221
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personel ("SicilNo", "TCKimlikNo", "Ad", "Soyad", "DogumTarihi", "TelNo", "Maas", "PersonelTipi") FROM stdin;
1	223456789  	Sinem	Karaca	2001-11-26	5462702749	2000	Doktor
2	323456789  	Zehra	Bak	2002-02-26	5077975082	2000	Doktor
3	123        	Jane	Adams	2000-12-24	5462702749	2000	Doktor
4	78         	Arda	Pektaş	1976-11-04	1         	1000	Doktor
5	79         	Ayşe	Yıldırım	1988-01-25	2         	1800	Danışma
6	80         	Veli	Dündar	1983-08-03	3         	1000	Doktor
7	81         	Hüsna	Talat	1975-09-16	4         	2000	Hizmet
8	82         	Fikret	Yılman	1966-04-12	5         	7000	HastaB.
9	83         	Yeşim	Kara	1974-06-08	6         	3500	Yonetim
10	67         	İlhan	Kara	1981-10-30	12        	6700	Yonetim
11	66         	Esin	Korkmaz	1965-06-05	23        	1300	Doktor
12	65         	Ali	Tunç	1978-09-15	45        	3450	Yonetim
13	64         	Mert	Kızıl	1990-12-18	78        	4500	Doktor
14	98         	Erdal	Sungur	1991-04-28	40        	1200	Hizmet
15	99         	Gülnur	Öden	1987-02-23	57        	2000	Yonetim
16	997        	Sevinç	Dolu	1977-03-12	88        	2000	Doktor
17	901        	Aygül	Özcan	1965-07-21	7675      	3000	Doktor
18	665        	Şeyma	Dolu	1968-10-04	800       	2000	Danışma
\.


--
-- TOC entry 3480 (class 0 OID 16523)
-- Dependencies: 219
-- Data for Name: poli_bina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poli_bina ("BinaNo", "KlinikNo") FROM stdin;
1	1
\.


--
-- TOC entry 3477 (class 0 OID 16443)
-- Dependencies: 216
-- Data for Name: poliklinik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poliklinik ("KlinikNo", "KlinikAdi") FROM stdin;
1	Dermatoloji
2	Kardiyoloji
3	Nöroloji
4	Psikiyatri
5	Dahiliye
6	Diş
7	Fizyoloji
\.


--
-- TOC entry 3489 (class 0 OID 16976)
-- Dependencies: 228
-- Data for Name: randevu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.randevu ("RandevuNo", "Tarih", "Saat", "KlinikNo", "SicilNo", "MuayeneNo", "TCKimlikNo", "BinaNo") FROM stdin;
\.


--
-- TOC entry 3491 (class 0 OID 16983)
-- Dependencies: 230
-- Data for Name: recete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recete ("ReceteNo", "Ilac", "ReceteTarihi", "SicilNo", "TCKimlikNo") FROM stdin;
\.


--
-- TOC entry 3494 (class 0 OID 16997)
-- Dependencies: 233
-- Data for Name: teshis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teshis ("TeshisNo", "TeshisAdi", "TedaviYontemi") FROM stdin;
1	Grip	İlaçla Tedavi
\.


--
-- TOC entry 3486 (class 0 OID 16965)
-- Dependencies: 225
-- Data for Name: yonetici; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yonetici ("SicilNo", "IdariBirim") FROM stdin;
9	Başhekim
10	Gelir/İdare
12	Satınalma
15	HastaKayıt
\.


--
-- TOC entry 3493 (class 0 OID 16990)
-- Dependencies: 232
-- Data for Name: ziyaret; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ziyaret ("MuayeneNo", "MuayeneTarihi", "IslemTuru", "IslemAdi", "TCKimlikNo", "SicilNo") FROM stdin;
\.


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 235
-- Name: HASTA_HastaNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HASTA_HastaNo_seq"', 41, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 220
-- Name: PERSONEL_SicilNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PERSONEL_SicilNo_seq"', 18, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 227
-- Name: RANDEVU_RandevuNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RANDEVU_RandevuNo_seq"', 1, false);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 229
-- Name: RECETE_ReceteNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RECETE_ReceteNo_seq"', 1, false);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 231
-- Name: ZIYARET_MuayeneNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ZIYARET_MuayeneNo_seq"', 1, false);


--
-- TOC entry 3289 (class 2606 OID 16974)
-- Name: danisma DANISMA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.danisma
    ADD CONSTRAINT "DANISMA_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3277 (class 2606 OID 16954)
-- Name: doktor DOKTOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "DOKTOR_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3265 (class 2606 OID 16452)
-- Name: hastaneBinasi HASTANE_BINASI_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaneBinasi"
    ADD CONSTRAINT "HASTANE_BINASI_pkey" PRIMARY KEY ("BinaNo");


--
-- TOC entry 3283 (class 2606 OID 16964)
-- Name: hastaBakici HASTA_BAKICI_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaBakici"
    ADD CONSTRAINT "HASTA_BAKICI_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3267 (class 2606 OID 16510)
-- Name: hasta_teshis HASTA_TESHIS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta_teshis
    ADD CONSTRAINT "HASTA_TESHIS_pkey" PRIMARY KEY ("TCKimlikNo", "TeshisNo");


--
-- TOC entry 3257 (class 2606 OID 16424)
-- Name: hasta HASTA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "HASTA_pkey" PRIMARY KEY ("TCKimlikNo");


--
-- TOC entry 3280 (class 2606 OID 16959)
-- Name: hizmet HIZMET_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hizmet
    ADD CONSTRAINT "HIZMET_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3259 (class 2606 OID 16461)
-- Name: odeme ODEME_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT "ODEME_pkey" PRIMARY KEY ("OdemeNo");


--
-- TOC entry 3275 (class 2606 OID 16949)
-- Name: personel PERSONEL_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "PERSONEL_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3263 (class 2606 OID 16447)
-- Name: poliklinik POLIKLINIK_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poliklinik
    ADD CONSTRAINT "POLIKLINIK_pkey" PRIMARY KEY ("KlinikNo");


--
-- TOC entry 3271 (class 2606 OID 16527)
-- Name: poli_bina POLI_BINA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poli_bina
    ADD CONSTRAINT "POLI_BINA_pkey" PRIMARY KEY ("BinaNo");


--
-- TOC entry 3292 (class 2606 OID 16981)
-- Name: randevu RANDEVU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "RANDEVU_pkey" PRIMARY KEY ("RandevuNo");


--
-- TOC entry 3299 (class 2606 OID 16988)
-- Name: recete RECETE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete
    ADD CONSTRAINT "RECETE_pkey" PRIMARY KEY ("ReceteNo");


--
-- TOC entry 3307 (class 2606 OID 17003)
-- Name: teshis TESHIS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teshis
    ADD CONSTRAINT "TESHIS_pkey" PRIMARY KEY ("TeshisNo");


--
-- TOC entry 3286 (class 2606 OID 16969)
-- Name: yonetici YONETICI_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yonetici
    ADD CONSTRAINT "YONETICI_pkey" PRIMARY KEY ("SicilNo");


--
-- TOC entry 3303 (class 2606 OID 16995)
-- Name: ziyaret ZIYARET_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ziyaret
    ADD CONSTRAINT "ZIYARET_pkey" PRIMARY KEY ("MuayeneNo");


--
-- TOC entry 3309 (class 2606 OID 17109)
-- Name: HastaDegisiklik hastadegisiklik_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HastaDegisiklik"
    ADD CONSTRAINT hastadegisiklik_pk PRIMARY KEY ("TCKimlikNo");


--
-- TOC entry 3278 (class 1259 OID 17132)
-- Name: fki_Doktor_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Doktor_frgn" ON public.doktor USING btree ("SicilNo");


--
-- TOC entry 3284 (class 1259 OID 17138)
-- Name: fki_HB_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_HB_frgn" ON public."hastaBakici" USING btree ("SicilNo");


--
-- TOC entry 3268 (class 1259 OID 16516)
-- Name: fki_HT_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_HT_frgn" ON public.hasta_teshis USING btree ("TCKimlikNo");


--
-- TOC entry 3269 (class 1259 OID 16522)
-- Name: fki_HT_frgn2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_HT_frgn2" ON public.hasta_teshis USING btree ("TeshisNo");


--
-- TOC entry 3281 (class 1259 OID 17144)
-- Name: fki_Hizmet_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Hizmet_frgn" ON public.hizmet USING btree ("SicilNo");


--
-- TOC entry 3260 (class 1259 OID 16840)
-- Name: fki_Odeme_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Odeme_frgn" ON public.odeme USING btree ("TCKimlikNo");


--
-- TOC entry 3272 (class 1259 OID 16533)
-- Name: fki_PB_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PB_frgn" ON public.poli_bina USING btree ("BinaNo");


--
-- TOC entry 3273 (class 1259 OID 16539)
-- Name: fki_PB_frgn2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PB_frgn2" ON public.poli_bina USING btree ("KlinikNo");


--
-- TOC entry 3293 (class 1259 OID 17038)
-- Name: fki_Randevu_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Randevu_frgn" ON public.randevu USING btree ("TCKimlikNo");


--
-- TOC entry 3294 (class 1259 OID 17044)
-- Name: fki_Randevu_frgn2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Randevu_frgn2" ON public.randevu USING btree ("SicilNo");


--
-- TOC entry 3295 (class 1259 OID 17050)
-- Name: fki_Randevu_frgn3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Randevu_frgn3" ON public.randevu USING btree ("KlinikNo");


--
-- TOC entry 3296 (class 1259 OID 17056)
-- Name: fki_Randevu_frgn4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Randevu_frgn4" ON public.randevu USING btree ("BinaNo");


--
-- TOC entry 3297 (class 1259 OID 17062)
-- Name: fki_Randevu_frgn5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Randevu_frgn5" ON public.randevu USING btree ("MuayeneNo");


--
-- TOC entry 3300 (class 1259 OID 17026)
-- Name: fki_Recete_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Recete_frgn" ON public.recete USING btree ("TCKimlikNo");


--
-- TOC entry 3301 (class 1259 OID 17032)
-- Name: fki_Recete_frgn2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Recete_frgn2" ON public.recete USING btree ("SicilNo");


--
-- TOC entry 3290 (class 1259 OID 17126)
-- Name: fki_S; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_S" ON public.danisma USING btree ("SicilNo");


--
-- TOC entry 3261 (class 1259 OID 16467)
-- Name: fki_TCKimlikNo_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_TCKimlikNo_frgn" ON public.odeme USING btree ("TCKimlikNo");


--
-- TOC entry 3287 (class 1259 OID 17150)
-- Name: fki_Yonetici_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Yonetici_frgn" ON public.yonetici USING btree ("SicilNo");


--
-- TOC entry 3304 (class 1259 OID 17014)
-- Name: fki_Ziyaret_frgn; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Ziyaret_frgn" ON public.ziyaret USING btree ("SicilNo");


--
-- TOC entry 3305 (class 1259 OID 17020)
-- Name: fki_Ziyaret_frgn2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Ziyaret_frgn2" ON public.ziyaret USING btree ("TCKimlikNo");


--
-- TOC entry 3329 (class 2620 OID 17192)
-- Name: hasta kayit_mesaj_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER kayit_mesaj_trigger AFTER INSERT ON public.hasta FOR EACH ROW EXECUTE FUNCTION public.kayit_mesaj();


--
-- TOC entry 3331 (class 2620 OID 17197)
-- Name: personel personelazalttrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER personelazalttrigger AFTER DELETE ON public.personel FOR EACH ROW EXECUTE FUNCTION public.personelazalt();


--
-- TOC entry 3332 (class 2620 OID 17199)
-- Name: personel personelsayisitrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER personelsayisitrigger AFTER INSERT ON public.personel FOR EACH ROW EXECUTE FUNCTION public.personelsayisi();


--
-- TOC entry 3330 (class 2620 OID 17111)
-- Name: hasta soyad_degisiklik_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER soyad_degisiklik_trigger BEFORE UPDATE ON public.hasta FOR EACH ROW EXECUTE FUNCTION public.soyad_degisiklik();


--
-- TOC entry 3319 (class 2606 OID 17121)
-- Name: danisma Danısma_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.danisma
    ADD CONSTRAINT "Danısma_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.personel("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3315 (class 2606 OID 17127)
-- Name: doktor Doktor_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "Doktor_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.personel("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 17133)
-- Name: hastaBakici HB_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaBakici"
    ADD CONSTRAINT "HB_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.personel("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3311 (class 2606 OID 16511)
-- Name: hasta_teshis HT_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta_teshis
    ADD CONSTRAINT "HT_frgn" FOREIGN KEY ("TCKimlikNo") REFERENCES public.hasta("TCKimlikNo");


--
-- TOC entry 3312 (class 2606 OID 17004)
-- Name: hasta_teshis HT_frgn2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta_teshis
    ADD CONSTRAINT "HT_frgn2" FOREIGN KEY ("TeshisNo") REFERENCES public.teshis("TeshisNo");


--
-- TOC entry 3316 (class 2606 OID 17139)
-- Name: hizmet Hizmet_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hizmet
    ADD CONSTRAINT "Hizmet_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.personel("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3310 (class 2606 OID 16835)
-- Name: odeme Odeme_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT "Odeme_frgn" FOREIGN KEY ("TCKimlikNo") REFERENCES public.hasta("TCKimlikNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 16528)
-- Name: poli_bina PB_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poli_bina
    ADD CONSTRAINT "PB_frgn" FOREIGN KEY ("BinaNo") REFERENCES public."hastaneBinasi"("BinaNo");


--
-- TOC entry 3314 (class 2606 OID 16534)
-- Name: poli_bina PB_frgn2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poli_bina
    ADD CONSTRAINT "PB_frgn2" FOREIGN KEY ("KlinikNo") REFERENCES public.poliklinik("KlinikNo");


--
-- TOC entry 3320 (class 2606 OID 17033)
-- Name: randevu Randevu_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "Randevu_frgn" FOREIGN KEY ("TCKimlikNo") REFERENCES public.hasta("TCKimlikNo");


--
-- TOC entry 3321 (class 2606 OID 17039)
-- Name: randevu Randevu_frgn2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "Randevu_frgn2" FOREIGN KEY ("SicilNo") REFERENCES public.doktor("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 17045)
-- Name: randevu Randevu_frgn3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "Randevu_frgn3" FOREIGN KEY ("KlinikNo") REFERENCES public.poliklinik("KlinikNo");


--
-- TOC entry 3323 (class 2606 OID 17051)
-- Name: randevu Randevu_frgn4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "Randevu_frgn4" FOREIGN KEY ("BinaNo") REFERENCES public."hastaneBinasi"("BinaNo");


--
-- TOC entry 3324 (class 2606 OID 17057)
-- Name: randevu Randevu_frgn5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT "Randevu_frgn5" FOREIGN KEY ("MuayeneNo") REFERENCES public.ziyaret("MuayeneNo");


--
-- TOC entry 3325 (class 2606 OID 17021)
-- Name: recete Recete_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete
    ADD CONSTRAINT "Recete_frgn" FOREIGN KEY ("TCKimlikNo") REFERENCES public.hasta("TCKimlikNo");


--
-- TOC entry 3326 (class 2606 OID 17027)
-- Name: recete Recete_frgn2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete
    ADD CONSTRAINT "Recete_frgn2" FOREIGN KEY ("SicilNo") REFERENCES public.doktor("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 17145)
-- Name: yonetici Yonetici_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yonetici
    ADD CONSTRAINT "Yonetici_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.personel("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3327 (class 2606 OID 17009)
-- Name: ziyaret Ziyaret_frgn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ziyaret
    ADD CONSTRAINT "Ziyaret_frgn" FOREIGN KEY ("SicilNo") REFERENCES public.doktor("SicilNo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3328 (class 2606 OID 17015)
-- Name: ziyaret Ziyaret_frgn2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ziyaret
    ADD CONSTRAINT "Ziyaret_frgn2" FOREIGN KEY ("TCKimlikNo") REFERENCES public.hasta("TCKimlikNo") NOT VALID;


-- Completed on 2022-12-27 15:25:55

--
-- PostgreSQL database dump complete
--

