--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)
-- Dumped by pg_dump version 13.4

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
-- Name: book_requests; Type: TABLE; Schema: public; Owner: phwrexlbpagibu
--

CREATE TABLE public.book_requests (
    isbn character(10) NOT NULL,
    title character varying,
    publisher character varying,
    authors character varying
);


ALTER TABLE public.book_requests OWNER TO phwrexlbpagibu;

--
-- Name: books; Type: TABLE; Schema: public; Owner: phwrexlbpagibu
--

CREATE TABLE public.books (
    isbn character(10) NOT NULL,
    isbn13 character(13),
    title character varying,
    image character varying,
    date character varying,
    publisher character varying,
    authors character varying[],
    language character varying,
    edition character varying,
    pages integer,
    available_copies integer,
    nb_copies integer
);


ALTER TABLE public.books OWNER TO phwrexlbpagibu;

--
-- Name: borrowals; Type: TABLE; Schema: public; Owner: phwrexlbpagibu
--

CREATE TABLE public.borrowals (
    user_id integer NOT NULL,
    book_isbn character varying(10) NOT NULL,
    date_borrowing date,
    return_date date,
    renewed boolean
);


ALTER TABLE public.borrowals OWNER TO phwrexlbpagibu;

--
-- Name: users; Type: TABLE; Schema: public; Owner: phwrexlbpagibu
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    hash character(60) NOT NULL,
    isadmin boolean
);


ALTER TABLE public.users OWNER TO phwrexlbpagibu;

--
-- Data for Name: book_requests; Type: TABLE DATA; Schema: public; Owner: phwrexlbpagibu
--

COPY public.book_requests (isbn, title, publisher, authors) FROM stdin;
c         	a	d	b
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: phwrexlbpagibu
--

COPY public.books (isbn, isbn13, title, image, date, publisher, authors, language, edition, pages, available_copies, nb_copies) FROM stdin;
0199739919	9780199739912	American Horizons, Concise: U.S. History in a Global Context, Volume II: Since 1865	https://images.isbndb.com/covers/99/12/9780199739912.jpg	2012	Oxford University Press	{"Schaller, Michael","Schulzinger, Robert","BezIs-Selfa, John","Thomas Greenwood, Janette","Kirk, Andrew","Purcell, Sarah J.","Sheehan-Dean, Aaron"}	en	1	848	4	5
0133813487	9780133813487	Introduction to Java Programming, Brief Version Plus MyLab Programming with Pearson eText -- Access Card Package (10th Edition)	https://images.isbndb.com/covers/34/87/9780133813487.jpg	2014	Pearson	{"Liang, Y. Daniel"}	en	10	780	5	5
013374163X	9780133741636	Prelude to Programming	https://images.isbndb.com/covers/16/36/9780133741636.jpg2014	Pearson	{"Venit, Stewart","Drake, Elizabeth"}	en	6	816	5	5
026202828X	9780262028288	Processing: A Programming Handbook for Visual Designers and Artists (The MIT Press)	https://images.isbndb.com/covers/82/88/9780262028288.jpg	2014	The MIT Press	{"Reas, Casey","Fry, Ben"}	en	second edition	664	5	5
1593272200	9781593272203	The Linux Programming Interface: A Linux and UNIX System Programming Handbook	https://images.isbndb.com/covers/22/03/9781593272203.jpg	2010	No Starch Press	{"Kerrisk, Michael"}	en	1552	5	5
0134058224	9780134058221	Introduction to Programming Using Python, An	https://images.isbndb.com/covers/82/21/9780134058221.jpg	2015	Pearson	{"Schneider, David"}	en	1	432	5	5
0123786266	9780123786265	An Introduction to Real Estate Finance	https://images.isbndb.com/covers/62/65/9780123786265.jpg	2013	Academic Press	{"Glickman, Edward"}	en	1	480	5	5
0674004205	9780674004207	Modern Public Finance	https://images.isbndb.com/covers/42/07/9780674004207.jpg2000	Harvard University Press	{}	en	New Edition	362	5	5
0132373343	9780132373340	Active Experiences for Active Children: Mathematics	https://images.isbndb.com/covers/33/40/9780132373340.jpg	2011	Pearson	{"Seefeldt, Carol","Galper, Alice","Stevenson-Garcia, Judi"}	en	3	224	5	5
020170353X	9780201703535	Accelerated C++: Practical Programming by Example	https://images.isbndb.com/covers/35/35/9780201703535.jpg	2000	Addison-Wesley Professional	{"Koenig, Andrew","Mike Hendrickson","Moo, Barbara"}	en	1	352	4	5
159059908x	9781590599082	Pro Javascript Design Patterns: The Essentials Of Object-oriented Javascript Programming	https://images.isbndb.com/covers/90/82/9781590599082.jpg		Apress	{"Dustin Diaz","Ross Harmes"}	en	1	269	5	5
0133252817	9780133252811	Introduction to Programming with C++ (Myprogramminglab)	https://images.isbndb.com/covers/28/11/9780133252811.jpg	2013	Pearson	{"Liang, Y. Daniel"}	en	3	720	5	5
1285852753	9781285852751	C++ Programming: Program Design Including Data Structures	https://images.isbndb.com/covers/27/51/9781285852751.jpg	2014	Cengage Learning	{"Malik, D. S."}	en	7	1680	5	5
1285856872	9781285856872	C# Programming: From Problem Analysis to Program Design	https://images.isbndb.com/covers/68/72/9781285856872.jpg	2015	Cengage Learning	{"Doyle, Barbara"}	en	5	1088	5
0131395319	9780131395312	Concepts of Programming Languages (10th Edition)	https://images.isbndb.com/covers/53/12/9780131395312.jpg	2012	Pearson	{"Sebesta, Robert W."}	en	10	816	5	5
0201896834	9780201896831	The Art of Computer Programming, Vol. 1: Fundamental Algorithms, 3rd Edition	https://images.isbndb.com/covers/68/31/9780201896831.jpg	1997	Addison-Wesley Professional	{"Knuth, Donald"en	3	672	5	5
013308504X	9780133085044	A Practical Guide to Linux Commands, Editors, and Shell Programming	https://images.isbndb.com/covers/50/44/9780133085044.jpg	2012	Pearson P T R	{"Sobell, Mark G."}	en	3	1200	5	5
0073523356	9780073523354	Java Programming: From The Ground Up	https://images.isbndb.com/covers/33/54/9780073523354.jpg	2009	McGraw-Hill Education	{"Ralph Bravaco","Shai Simonson"}	en	1	1136	5
0073517224	9780073517223	Advanced Programming Using Visual Basic 2008	https://images.isbndb.com/covers/72/23/9780073517223.jpg	2009	McGraw-Hill Education	{"Bradley, Julia Case","Millspaugh, Anita"}	en	672	5	5
0136150993	9780136150992	C++ Programming Today	https://images.isbndb.com/covers/09/92/9780136150992.jpg2007	Pearson	{"Johnston, Barbara"}	en	2	656	5	5
0123742609	9780123742605	An Introduction to Parallel Programming	https://images.isbndb.com/covers/26/05/9780123742605.jpg	2011	Morgan Kaufmann	{"Pacheco, Peter"}	en	1	392	5	5
1111529418	9781111529413	Programming Languages: Principles and Practices (Advanced Topics)	https://images.isbndb.com/covers/94/13/9781111529413.jpg	2011	Cengage Learning	{"Louden, Kenneth C.","Lambert, Kenneth A."}	en	3	704	5	5
1259641635	9781259641633	Programming Arduino: Getting Started with Sketches, Second Edition (Tab)	https://images.isbndb.com/covers/16/33/9781259641633.jpg	2016	McGraw-Hill Education TAB	{"Monk, Simon"}	en	2	192	5	5
1285081951	9781285081953	Java Programming	https://images.isbndb.com/covers/19/53/9781285081953.jpg2013	Cengage Learning	{"Farrell, Joyce"}	en	7	1084	5	5
1259587401	9781259587405	Programming the Raspberry Pi, Second Edition: Getting Started with Python	https://images.isbndb.com/covers/74/05/9781259587405.jpg	2015	McGraw-Hill Education TAB	{"Monk, Simon"}	en	2	208	5	5
110557878X	9781105578786	Web Programming Step by Step	https://images.isbndb.com/covers/87/86/9781105578786.jpg	2021	Step by Step Publishing	{"Jessica Miller"}	en	Second Edition	668	5	5
0201615711	9780201615715	Network Programming with Perl	https://images.isbndb.com/covers/57/15/9780201615715.jpg	2000	Addison-Wesley Professional	{"Stein, Lincoln D."}	en	1	778	5	5
1111576718	9781111576714	MATLAB Programming for Engineers	https://images.isbndb.com/covers/67/14/9781111576714.jpg	2015	Cengage Learning	{"Chapman, Stephen J."}	en	5	672	5	5
0133813460	9780133813463	Introduction to Java Programming, Comprehensive Version plus MyLab Programming with Pearson eText -- Access Card Package (10th Edition)	https://images.isbndb.com/covers/34/63/9780133813463.jpg2014	Pearson	{"Liang, Y. Daniel"}	en	10	1320	5	5
1285061470	9781285061474	Introduction to Programming with C++	https://images.isbndb.com/covers/14/74/9781285061474.jpg	2012	Cengage Learning	{"Zak, Diane"}	en	7	768	5	5
1605259454	9781605259451	Programmable Logic Controllers: Hardware and Programming	https://images.isbndb.com/covers/94/51/9781605259451.jpg	2012	Goodheart-Willcox	{"Rabiee, Max"}	en	3	414	5
0262162091	9780262162098	Types and Programming Languages (The MIT Press)	https://images.isbndb.com/covers/20/98/9780262162098.jpg	2002	The MIT Press	{"Pierce, Benjamin C."}	en	1	648	5	5
1943872074	9781943872077	Murach s Java Programming (5th Edition)	https://images.isbndb.com/covers/20/77/9781943872077.jpg	2017	Mike Murach & Associates	{"Joel Murach"}	en	5	800	5	5
0470108541	9780470108543	Beginning Programming All-in-One Desk Reference For Dummies	https://images.isbndb.com/covers/85/43/9780470108543.jpg	2008	For Dummies	{"Wang, Wallace"}	en	1	720	5
0262525003	9780262525008	Introduction to Computation and Programming Using Python (MIT Press)	https://images.isbndb.com/covers/50/08/9780262525008.jpg	2013	The MIT Press	{"Guttag, John V."}	en	revised and expanded edition	320	5	5
1305273761	9781305273764	C Programming for the Absolute Beginner	https://images.isbndb.com/covers/37/64/9781305273764.jpg	2014	Cengage Learning PTR	{"Davenport, Keith","Vine, Michael"}	en	3	352	5
012417910x	9780124179103	Elementary Linear Programming With Applications (computer Science And Scientific Computing)	https://images.isbndb.com/covers/91/03/9780124179103.jpg	1995	Academic Press	{"Bernard Kolman","Robert E. Beck"}	en	2	449	5	5
0521780985	9780521780988	Concepts in Programming Languages	https://images.isbndb.com/covers/09/88/9780521780988.jpg	2002	Cambridge University Press	{"Mitchell, John C."}	en	1	540	5	5
1590282507	9781590282502	Modern Programming Languages: A Practical Introduction	https://images.isbndb.com/covers/25/02/9781590282502.jpg	2013	Franklin, Beedle & Associates Inc.	{"Webber, Adam Brooks"}	en	588	5	5
0131387685	9780131387683	CUDA by Example: An Introduction to General-Purpose GPU Programming	https://images.isbndb.com/covers/76/83/9780131387683.jpg	2010	Addison-Wesley Professional	{"Sanders / Kandrot, Jason"}	en	1	310	5	5
128402864X	9781284028645	Programming and Problem Solving with C++: Brief	https://images.isbndb.com/covers/86/45/9781284028645.jpg	2013	Jones & Bartlett Learning	{"Dale, Nell","Weems, Chip"}	en	6	776	5	5
1305075196	9781305075191	Scratch 2.0 Programming for Teens	https://images.isbndb.com/covers/51/91/9781305075191.jpg	2014	Cengage Learning PTR	{"Ford, Jr.  Jerry Lee"}	en	2	336	5	5
0805311912	9780805311914	Advanced Programming Language Design	https://images.isbndb.com/covers/19/14/9780805311914.jpg	1995	Pearson	{"Finkel, Raphael"}	en	1	496	5	5
1118490398	9781118490396	Excel 2013 Power Programming with VBA	https://images.isbndb.com/covers/03/96/9781118490396.jpg	2013	Wiley	{"Walkenbach, John"}	en	1	1104	5	5
1491946008	9781491946008	Fluent Python: Clear, Concise, and Effective Programming	https://images.isbndb.com/covers/60/08/9781491946008.jpg	2015	O Reilly Media	{"Ramalho, Luciano"}	en	1	792	5
0131452541	9780131452541	Computer Graphics: Programming in OpenGL for Uisual Communication	https://images.isbndb.com/covers/25/41/9780131452541.jpg	2006	Prentice Hall	{"Cunningham, Steve"}	en	1	632	5	5
0735661685	9780735661684	Start Here! Fundamentals of Microsoft .NET Programming	https://images.isbndb.com/covers/16/84/9780735661684.jpg	2011	Microsoft Press	{"Stephens, Rod"}	en	1	266	5	5
0538744766	9780538744768	Programming Logic and Design, Comprehensive	https://images.isbndb.com/covers/47/68/9780538744768.jpg	2010	Cengage Learning	{"Farrell, Joyce"}	en	6	720	5	5
1284076598	9781284076592	Programming and Problem Solving with C++: Comprehensive	https://images.isbndb.com/covers/65/92/9781284076592.jpg	2016	Jones & Bartlett Learning	{"Dale, Nell","Weems, Chip"}	en	1068	5	5
1285867394	9781285867397	Microsoft Visual Basic Programs to Accompany Programming Logic and Design	https://images.isbndb.com/covers/73/97/9781285867397.jpg	2014	Cengage Learning	{"Smith, Jo Ann"}	en	8	208	5	5
1285096339	9781285096339	Microsoft Visual C# 2012: An Introduction to Object-Oriented Programming	https://images.isbndb.com/covers/63/39/9781285096339.jpg	2013	Cengage Learning	{"Farrell, Joyce"}	en	5	864	5	5
1556227418	9781556227417	Learn Computer Programming With Direct X 7.0	https://images.isbndb.com/covers/74/17/9781556227417.jpg	2000	Wordware Publishing, Inc.	{"Parberry, Ian"}	en		566	5
0071626751	9780071626750	24 Deadly Sins of Software Security: Programming Flaws and How to Fix Them	https://images.isbndb.com/covers/67/50/9780071626750.jpg	2009	McGraw-Hill Education	{"Howard, Michael","LeBlanc, David","Viega, John"}	en	1	432	5	5
013212856X	9780132128568	An Introduction to Programming Using Visual Basic 2010, 8th Edition	https://images.isbndb.com/covers/85/68/9780132128568.jpg	2010	Pearson	{"Schneider, David I."}	en	8	710	5
0735676828	9780735676824	Exam Ref 70-483 Programming in C# (MCSD)	https://images.isbndb.com/covers/68/24/9780735676824.jpg	2013	Microsoft Press	{"De Kort, Wouter"}	en	1	376	5	5
1449694276	9781449694265	Programming and problem solving with C++: comprehensive edition	https://images.isbndb.com/covers/42/65/9781449694265.jpg		Jones And Bartlett Learning,	{"Dale, Nell (nell B.) (author.)"}	en		0	5	5
020107981x	9780201079814	The Awk Programming Language	https://images.isbndb.com/covers/98/14/9780201079814.jpg		Pearson	{"Aho, Alfred V.","Kernighan, Brian W.","Weinberger, Peter J."}	en	1	224	5
859037985x	9788590379850	Programming In Lua	https://images.isbndb.com/covers/98/50/9788590379850.jpg2013	Lua.org	{"Roberto Ierusalimschy"}	pt	3	366	5	5
1890774936	9781890774936	Murach s Android Programming (2nd Edition)	https://images.isbndb.com/covers/49/36/9781890774936.jpg	2015	Mike Murach & Associates	{"Joel Murach"}	en	2	663	5	5
1118102282	9781118102282	Beginning Microsoft SQL Server 2012 Programming	https://images.isbndb.com/covers/22/82/9781118102282.jpg	2012	Wrox	{"Atkinson, Paul","Vieira, Robert"}	en	1	864	5	5
1305509994	9781305509993	Programming and Interfacing ATMEL s AVRs	https://images.isbndb.com/covers/99/93/9781305509993.jpg	2015	Cengage Learning PTR	{"Grace, Thomas"}	en	1	264	5	5
013490012X	9780134900124	UNIX Network Programming: Networking APIs: Sockets and XTI; Volume 1	https://images.isbndb.com/covers/01/24/9780134900124.jpg	1998	Prentice Hall	{"Stevens, W. Richard"}	en	Subsequent	1009	5	5
013490012x	9780134900124	Unix Network Programming: Networking Apis: Sockets And Xti; Volume 1	https://images.isbndb.com/covers/01/24/9780134900124.jpg	1997	Prentice Hall	{"W. Richard Stevens"}	en	2	1009	5	5
0130424110	9780130424112	UNIX Systems Programming: Communication, Concurrency and Threads	https://images.isbndb.com/covers/41/12/9780130424112.jpg	2003	Prentice Hall	{"Kay A. Robbins","Steve Robbins"}	en	2nd Uitgawe and Revised ed.	912	5	5
0763740594	9780763740597	Programming Languages And Methodologies	https://images.isbndb.com/covers/05/97/9780763740597.jpg	2006	Jones & Bartlett Learning	{"Schalkoff, Robert"}	en	1st	672	5	5
1337109630	9781337109635	Programming Logic and Design, Introductory	https://images.isbndb.com/covers/96/35/9781337109635.jpg	2017	Cengage Learning	{"Farrell, Joyce"}	en	9	384	5	5
049529568X	9780495295686	Essentials of MATLAB Programming	https://images.isbndb.com/covers/56/86/9780495295686.jpg	2008	Cengage Learning	{"Chapman, Stephen J."}	en	2	412	5	5
049529568x	9780495295686	Essentials Of Matlab Programming	https://images.isbndb.com/covers/56/86/9780495295686.jpg	2009	Cengage Learning	{"Chapman, Stephen J."}	en	2	412	5	5
0538744774	9780538744775	Programming Logic and Design, Introductory	https://images.isbndb.com/covers/47/75/9780538744775.jpg	2010	Course Technology	{"Farrell, Joyce"}	en	6	384	5	5
3319133136	9783319133133	Foundations of Programming Languages (Undergraduate Topics in Computer Science)	https://images.isbndb.com/covers/31/33/9783319133133.jpg	2015	Springer	{"Lee, Kent D."}	de	2014	354	5	5
0538798084	9780538798082	C++ Programming: From Problem Analysis to Program Design (Introduction to Programming)	https://images.isbndb.com/covers/80/82/9780538798082.jpg	2010	Cengage Learning	{"Malik, D. S."}	en	5	1384	5	5
0133593495	9780133593495	Intro to Java Programming, Comprehensive Version, Student Value Edition (10th Edition)	https://images.isbndb.com/covers/34/95/9780133593495.jpg	2014	Pearson	{"Liang, Y. Daniel"}	en	10	1344	5	5
0321832183	9780321832184	PHP Advanced and Object-Oriented Programming: Visual QuickPro Guide (Visual QuickPro Guides)	https://images.isbndb.com/covers/21/84/9780321832184.jpg	2012	Peachpit Press	{"Ullman, Larry"}	en	3	504	5	5
3110315270	9783110315271	Nonlinear Programming: An Introduction (de Gruyter Textbook)	https://images.isbndb.com/covers/52/71/9783110315271.jpg	2014	De Gruyter	{"Zörnig, Peter"}	de	Digital original360	5	5
0134543661	9780134543666	Starting Out with Python Plus MyLab Programming with Pearson eText -- Access Card Package	https://images.isbndb.com/covers/36/66/9780134543666.jpg	2017	Pearson	{"Gaddis, Tony"}en	4	722	5	5
0134774604	9780134774602	Practical Guide to Linux Commands, Editors, and Shell Programming, A	https://images.isbndb.com/covers/46/02/9780134774602.jpg	2017	Addison-Wesley Professional	{"Sobell, Mark","Helmke, Matthew"}	en	4	1232	5	5
1501000861	9781501000867	Python Programming for Beginners: An Introduction to the Python Computer Language and Computer Programming	https://images.isbndb.com/covers/08/67/9781501000867.jpg	2014	CreateSpace Independent Publishing Platform	{"Cannon, Jason"}	en	1	162	5	5
0124202284	9780124202283	An Introduction to MATLAB® Programming and Numerical Methods for Engineers	https://images.isbndb.com/covers/22/83/9780124202283.jpg	2014	Academic Press	{"Siauw, Timmy","Bayen, Alexandre"}	en	1	340	5	5
0201877589	9780201877588	Unix System Programming (2nd Edition)	https://images.isbndb.com/covers/75/88/9780201877588.jpg	1998	Pearson	{"Haviland, Keith","Haviland, Keith","Gray, Dina","Salama, Ben"}	en	350	5	5
1337117560	9781337117562	C++ Programming: Program Design Including Data Structures (MindTap Course List)	https://images.isbndb.com/covers/75/62/9781337117562.jpg	2017	Cengage Learning	{"Malik, D. S."}	en	8	1728	5	5
0735622493	9780735622494	Programming Applications for Microsoft Office Outlook 2007 (3rd Edition) (Developer Reference)	https://images.isbndb.com/covers/24/94/9780735622494.jpg	2007	Microsoft Press	{"Randy Byrne","Ryan Gregg"}	en	3	608	5	5
0071812431	9780071812436	Oracle Database 12c PL/SQL Programming	https://images.isbndb.com/covers/24/36/9780071812436.jpg	2014	McGraw-Hill Education	{"McLaughlin, Michael"}	en	1	1192	5	5
0672308517	9780672308512	Teach Yourself Database Programming With Delphi in 21 Days (Sams Teach Yourself)https://images.isbndb.com/covers/85/12/9780672308512.jpg	1995	Sams	{"Gurewich, Nathan","Gurewich, Ori"}	en	1	569	5	5
1423901886	9781423901884	Java Programming Lab Manual: From Problem Analysis To Program Design, 3rd Editiohttps://images.isbndb.com/covers/18/84/9781423901884.jpg	2007	Cengage Learning	{"Mayfield, Blayne"}	en	3	336	5	5
0471597252	9780471597254	Karel The Robot: A Gentle Introduction to the Art of Programming	https://images.isbndb.com/covers/72/54/9780471597254.jpg	1995	Wiley	{"Pattis, Richard E."}	en	2nd	160	5
148225414x	9781482254143	Discovering Computer Science: Interdisciplinary Problems, Principles, And Python Programming (chapman & Hall/crc Textbooks In Computing)	https://images.isbndb.com/covers/41/43/9781482254143.jpg2016	Chapman And Hall/crc	{"Jessen Havill"}	en	1	750	5	5
0133450864	9780133450866	Intro to Programming Using Visual Basic 2012 plus MyProgrammingLab with Pearson eText -- Access Card Package (9th Edition)	https://images.isbndb.com/covers/08/66/9780133450866.jpg	2013	Pearson	{"Schneider, David I."}	en	9	688	5	5
1937842312	9781937842314	SQL (Database Programming)	https://images.isbndb.com/covers/23/14/9781937842314.jpg	2014	Questing Vole Press	{"Fehily, Chris"}	en		408	5	5
0321902920	9780321902924	WebGL Programming Guide: Interactive 3D Graphics Programming with WebGL (OpenGL)https://images.isbndb.com/covers/29/24/9780321902924.jpg	2013	Addison-Wesley Professional	{"Matsuda / Lea, Kouichi Matsuda / Rodger Lea"}	en	1	542	5	5
1537713949	9781537713946	Elements of Programming Interviews in Python: The Insiders  Guide	https://images.isbndb.com/covers/39/46/9781537713946.jpg	2016	CreateSpace Independent Publishing Platform	{"Aziz, Adnan","Lee, Tsung-Hsien","Prakash, Amit"}	en		441	5	5
193435659X	9781934356593	Seven Languages in Seven Weeks: A Pragmatic Guide to Learning Programming Languages (Pragmatic Programmers)	https://images.isbndb.com/covers/65/93/9781934356593.jpg	2010	Pragmatic Bookshelf	{"Tate, Bruce"}	en	1	330	5	5
1466569999	9781466569997	Introduction to Scientific Programming and Simulation Using R (Chapman & Hall/CRC The R Series)	https://images.isbndb.com/covers/99/97/9781466569997.jpg	2014	Chapman and Hall/CRC	{"Jones, Owen","Maillardet, Robert","Robinson, Andrew"}	en	2	606	5	5
0137903871	9780137903870	Elements of ML Programming, ML97 Edition	https://images.isbndb.com/covers/38/70/9780137903870.jpg	1998	Pearson	{"Ullman, Jeffrey"}	en	2nd	400	5	5
1418835404	9781418835408	Java Programming: Program Design Including Data Structures	https://images.isbndb.com/covers/54/08/9781418835408.jpg	2005	Cengage Learning	{"Malik, D. S."}	en	1	1616	5	5
0133764141	9780672337123	Arduino programming in 24 hours	https://images.isbndb.com/covers/71/23/9780672337123.jpg	2014	Sams	{"Blum, Richard , 1962-"}	en		0	5	5
1316626229	9781316626221	Programming in Haskell	https://images.isbndb.com/covers/62/21/9781316626221.jpg2016	Cambridge University Press	{"Hutton, Graham"}	en	2	318	5	5
1540671321	9781540671325	Agile Software Development with C# Scrum, extreme programming, and Kanban	https://images.isbndb.com/covers/13/25/9781540671325.jpg	2016	CreateSpace Independent Publishing Platform	{"Smith, Lynn"}	en	1	284	5	5
1598634801	9781598634808	C Programming for the Absolute Beginner	https://images.isbndb.com/covers/48/08/9781598634808.jpg	2007	Cengage Learning PTR	{"Vine, Michael"}	en	2	317	5	5
013408330X	9780134083308	Fundamentals of Investing (Pearson Series in Finance)	https://images.isbndb.com/covers/33/08/9780134083308.jpg	2016	Pearson	{"Smart, Scott","Gitman, Lawrence","Joehnk, Michael"}	en	13	688	5	5
0133140512	9780133140514	Entrepreneurial Finance	https://images.isbndb.com/covers/05/14/9780133140514.jpg2013	Pearson	{"Adelman, Philip","Marks, Alan"}	en	6	512	5	5
1591845572	9781591845577	The Visual MBA, The Personal MBA, The Finance Book 3 Books Collection Set	https://images.isbndb.com/covers/55/77/9781591845577.jpg	2019	Portfolio Penguin/Penguin/FT Publishing International	{"Jason Barro","Josh Kaufman","Si Hussain, Stuart Warner"}	en		464	5	5
159941449x	9781599414492	Business Organization And Finance: Legal And Economic Principles, 11th Edition (concepts And Insights)	https://images.isbndb.com/covers/44/92/9781599414492.jpg	2010	Foundation Press{"William Klein","John Coffee Jr","Frank Partnoy"}	en	11	496	5	5
0324782918	9780324782912	Corporate Finance: Linking Theory to What Companies Do (with Thomson ONE - Business School Edition 6-Month and Smart Finance Printed Access Card) (Available Titles CourseMate)	https://images.isbndb.com/covers/29/12/9780324782912.jpg	2009	South-Western College Pub	{"Graham, John","Smart, Scott B.","Megginson, William L"}	en	3	1008	5	5
013408327X	9780134083278	Corporate Finance (4th Edition) (Pearson Series in Finance) - Standalone book	https://images.isbndb.com/covers/32/78/9780134083278.jpg	2016	Pearson	{"Berk, Jonathan","DeMarzo, Peter"}	en	4	1136	5	5
1936948001	9781936948000	Foundations in Personal Finance, College Edition	https://images.isbndb.com/covers/80/00/9781936948000.jpg	2011	Lampo Licensing, LLC	{"Dave Ramsey"}	en	College Edition	316	5
0077356381	9780077356385	Principles of Corporate Finance + S&P Market Insight	https://images.isbndb.com/covers/63/85/9780077356385.jpg	2010	McGraw-Hill/Irwin	{"Brealey, Richard","Myers, Stewart","Allen, Franklin"}	en	10	960	5	5
007786171X	9780077861711	Case Studies in Finance: Managing for Corporate Value Creation (McGraw-Hill/Irwin Series in Finance, Insurance and Real Estate (Hardcover))	https://images.isbndb.com/covers/17/11/9780077861711.jpg	2013	McGraw-Hill Education	{"Bruner, Robert","Eades, Kenneth","Schill, Michael"}	en	7	816	5	5
0324422709	9780324422702	Essentials of Managerial Finance (with Thomson ONE - Business School Edition 6-Month Printed Access Card)	https://images.isbndb.com/covers/27/02/9780324422702.jpg		South-Western College Pub	{"Besley, Scott","Brigham, Eugene F."}	en	14	834	5	5
111887370X	9781118873700	Valuation: Measuring and Managing the Value of Companies (Wiley Finance)	https://images.isbndb.com/covers/37/00/9781118873700.jpg	2015	Wiley	{"McKinsey & Company Inc.","Koller, Tim","Goedhart, Marc","Wessels, David"}	en	6	848	5	5
0808025767	9780808025764	Finance & Accounting for Nonfinancial Managers (2011)	https://images.isbndb.com/covers/57/64/9780808025764.jpg	2011	CCH Incorporated	{"Steven A. Finkler"}	en	4th ed.	352	5
144192311X	9781441923110	Stochastic Calculus for Finance II: Continuous-Time Models (Springer Finance)	https://images.isbndb.com/covers/31/10/9781441923110.jpg	2010	Springer	{"Shreve, Steven"}	en	569	5	5
0134004221	9780134004228	Financial Management: Core Concepts Plus MyLab Finance with Pearson eText -- Access Card Package (Pearson Series in Finance)	https://images.isbndb.com/covers/42/28/9780134004228.jpg	2015	Pearson	{"Brooks, Raymond"}	en	3	619	5	5
0538478152	9780538478151	Entrepreneurial Finance	https://images.isbndb.com/covers/81/51/9780538478151.jpg2011	Cengage Learning	{"Leach, J. Chris","Melicher, Ronald W."}	en	4	688	5	5
0078110289	9780078110283	School Finance: A Policy Perspective	https://images.isbndb.com/covers/02/83/9780078110283.jpg	2013	McGraw-Hill Education	{"Odden, Allan","Picus, Lawrence"}	en	5	480	5
125971778x	9781259717789	International Financial Management (the Mcgraw-hill/irwin Series In Finance, Insurance, And Real Estate)	https://images.isbndb.com/covers/77/89/9781259717789.jpg	2018	Mcgraw-hill Education	{"Cheol Eun","Bruce G. Resnick"}	en	8	576	5	5
0078034655	9780078034657	International Financial Management (Mcgraw-hill/Irwin Series in Finance, Insurance, and Real Estate)	https://images.isbndb.com/covers/46/57/9780078034657.jpg	2011	McGraw-Hill/Irwi{"Eun, Cheol","Resnick, Bruce"}	en	6	576	5	5
0136119468	9780136119463	Principles of Managerial Finance	https://images.isbndb.com/covers/94/63/9780136119463.jpg	2010	Pearson College Div	{"Gitman, Lawrence J.","Zutter, Chad J."}	en	13	796	5	5
1111838046	9781111838041	American Public School Finance	https://images.isbndb.com/covers/80/41/9781111838041.jpg	2012	Wadsworth Publishing	{"Owings, William","Kaplan, Leslie"}	en	2	384	5	5
1285052234	9781285052236	Basic Spanish for Business and Finance Enhanced Edition (World Languages)	https://images.isbndb.com/covers/22/36/9781285052236.jpg	2013	Cengage Learning	{"Jarvis, Ana","Lebredo, Raquel","Mena-Ayllon, Francisco"}	en	2	400	5	5
0134796551	9780134796550	Multinational Business Finance (Pearson Series in Finance)	https://images.isbndb.com/covers/65/50/9780134796550.jpg	2018	Pearson	{"Eiteman, David","Stonehill, Arthur","Moffett, Michael"en	15	640	5	5
1133947530	9781133947530	Corporate Finance: A Focused Approach (with Thomson ONE - Business School Edition 6-Month Printed Access Card) (Finance Titles in the Brigham Family)	https://images.isbndb.com/covers/75/30/9781133947530.jpg	2013	Cengage Learning	{"Ehrhardt, Michael C.","Brigham, Eugene F."}	en	5	840	5	5
0133740897	9780133740899	Principles of Managerial Finance, Brief Plus NEW MyLab Finance with Pearson eText -- Access Card Package (7th Edition) (Pearson Series in Finance)	https://images.isbndb.com/covers/08/99/9780133740899.jpg	2014	Pearson	{"Gitman, Lawrence J.","Zutter, Chad J."}	en	7	704	5	5
0072949317	9780072949315	Derivatives (McGraw-Hill/Irwin Series in Finance, Insurance, and Real Est)	https://images.isbndb.com/covers/93/15/9780072949315.jpg	2010	McGraw-Hill Education	{"Sundaram, Rangarajan","Das, Sanjiv"}	en	1	940	5	5
0073530581	9780073530581	Running Money: Professional Portfolio Management (Mcgraw-hill/Irwin Series in Finance, Insurance, and Real Estate)	https://images.isbndb.com/covers/05/81/9780073530581.jpg	2010	McGraw-Hill/Irwin	{"Stewart, Scott","Piros, Christopher","Heisler, Jeffrey"}	en	1	576	5
1111527369	9781111527365	Principles of Finance	https://images.isbndb.com/covers/73/65/9781111527365.jpg2011	South-Western College Pub	{"Besley, Scott","Brigham, Eugene F."}	en	5	816	5	5
0857290819	9780857290816	Mathematics for Finance: An Introduction to Financial Engineering (Springer Undergraduate Mathematics Series)	https://images.isbndb.com/covers/08/16/9780857290816.jpg	2010	Springer{"Capiński, Marek","Zastawniak, Tomasz"}	en	2nd ed. 2011	349	5	5
0470424605	9780470424605	Value: The Four Cornerstones of Corporate Finance	https://images.isbndb.com/covers/46/05/9780470424605.jpg	2010	Wiley	{"McKinsey & Company Inc.","Koller, Tim","Dobbs, Richard","Huyett, Bill"}	en	1	272	5	5
1422187306	9781422187302	HBR Guide to Finance Basics for Managers (HBR Guide Series)	https://images.isbndb.com/covers/73/02/9781422187302.jpg	2012	Harvard Business Review Press	{"Review, Harvard Business"}	en	1	192	5	5
013611945x	9780136119456	Principles Of Managerial Finance	https://images.isbndb.com/covers/94/56/9780136119456.jpg	2011	Prentice Hall	{"Lawrence J. Gitman","Chad J. Zutter"}	en	6	704	5	5
0134475569	9780134475561	Fundamentals of Corporate Finance (Berk, DeMarzo & Harford, The Corporate Finance Series)	https://images.isbndb.com/covers/55/61/9780134475561.jpg	2017	Pearson	{"Berk, Jonathan","DeMarzo, Peter","Harford, Jarrad"}	en	4	800	5	5
0470876441	9780470876442	Fundamentals of Corporate Finance	https://images.isbndb.com/covers/64/42/9780470876442.jpg	2011	Wiley	{"Parrino, Robert","Kidwell, David S.","Bates, Thomas"}	en	2	784	5
0470444657	9780470444658	Essentials of Corporate Finance	https://images.isbndb.com/covers/46/58/9780470444658.jpg	2013	Wiley	{"Parrino, Robert","Kidwell, David S.","Bates, Thomas"}	en	1	656	5	5
0077861655	9780077861650	Corporate Finance : Core Principles and Applications (Hardcover - Revised Ed.)--by Stephen A. Ross [2013 Edition] ISBN: 9780077861650	https://images.isbndb.com/covers/16/50/9780077861650.jpg1672	Stephen A. Ross	{}	en	4	720	5	5
125991965X	9781259919657	Focus on Personal Finance	https://images.isbndb.com/covers/96/57/9781259919657.jpg	2018	McGraw-Hill Education	{"Kapoor, Jack","Dlabay, Les","Hughes, Robert J.","Hart, Melissa"}	en	6	576	5	5
1118955943	9781118955949	Risk Management and Financial Institutions, Fourth Edition (Wiley Finance)	https://images.isbndb.com/covers/59/49/9781118955949.jpg	2015	John Wiley &Sons	{"Hull, John C."}	en	4	740	5	5
1260013995	9781260013993	Personal Finance	https://images.isbndb.com/covers/39/93/9781260013993.jpg2019	McGraw-Hill Education	{"Kapoor, Jack","Dlabay, Les","Hughes, Robert J.","Hart, Melissa"}	en	13	832	5	5
1118492676	9781118492673	Introduction to Finance: Markets, Investments, and Financial Management	https://images.isbndb.com/covers/26/73/9781118492673.jpg	2013	Wiley	{"Melicher, Ronald W.","Norton, Edgar A."}	en	15	608	5	5
1260153592	9781260153590	Loose Leaf for Fundamentals of Corporate Finance (Mcgraw-hill Education Series in Finance, Insurance, and Real Estate)	https://images.isbndb.com/covers/35/90/9781260153590.jpg	2018	McGraw-Hill Education	{"Ross, Stephen","Westerfield, Randolph","Jordan, Bradford"}	en	12	2016	5
1118656210	9781118656211	Investment Banking: Valuation, Leveraged Buyouts, and Mergers and Acquisitions (Wiley Finance)	https://images.isbndb.com/covers/62/11/9781118656211.jpg	2013	Wiley	{"Rosenbaum, Joshua","Pearl, Joshua"}	en	2	464	5	5
0134472136	9780134472133	Fundamentals of Multinational Finance (The Pearson Series in Finance)	https://images.isbndb.com/covers/21/33/9780134472133.jpg	2017	Pearson	{"Moffett, Michael","Stonehill, Arthur","Eiteman, David"}	en	6	608	5	5
1260565556	9781260565553	Principles of Corporate Finance	https://images.isbndb.com/covers/55/53/9781260565553.jpg	2019	McGraw-Hill Education	{"Brealey, Richard","Myers, Stewart","Allen, Franklin"}	en	13	5
0071749071	9780071749077	Corporate Finance Demystified 2/E	https://images.isbndb.com/covers/90/77/9780071749077.jpg	2011	McGraw-Hill Education	{"Adair, Troy"}	en	2	304	5	5
1259919684	9781259919688	Real Estate Finance & Investments (Real Estate Finance and Investments)	https://images.isbndb.com/covers/96/88/9781259919688.jpg	2018	McGraw-Hill Education	{"Brueggeman, William","Fisher, Jeffrey"}	en	16	832	5	5
0078958393	9780078958397	Personal Finance, Student Edition (PERSONAL FINANCE (RECORDKEEP))	https://images.isbndb.com/covers/83/97/9780078958397.jpg	2011	McGraw-Hill Education	{McGraw-Hill}	en	1	720	5	5
0133423638	9780133423631	International Finance: Theory and Policy (10th Edition) (The Pearson Series on Economics)	https://images.isbndb.com/covers/36/31/9780133423631.jpg	2014	Pearson	{"Krugman, Paul R.","Obstfeld, Maurice","Melitz, Marc"}	en	10	464	5	5
0071435360	9780071435369	Finance & Accounting for Non-Financial Managers	https://images.isbndb.com/covers/53/69/9780071435369.jpg	2004	McGraw-Hill Education	{"Weaver, Samuel","Weston, J. Fred"}	en	1	288	5	5
1292160160	9781292160160	Corporate Finance, Global Edition	https://images.isbndb.com/covers/01/60/9781292160160.jpg	2016	Pearson	{"Berk, Jonathan","DeMarzo, Peter"}	en	4	1168	5	5
1476782385	9781476782386	Get a Financial Life: Personal Finance in Your Twenties and Thirties	https://images.isbndb.com/covers/23/86/9781476782386.jpg	2017	Simon & Schuster	{"Kobliner, Beth"}	en	Reissue	352	5	5
1609302206	9781609302207	Real Estate Transactions, Cases and Materials on Land Transfer, Development and Finance, 6th Ed. (University Casebook Series)	https://images.isbndb.com/covers/22/07/9781609302207.jpg	2014	Foundation Press	{"Korngold, Gerald","Goldstein, Paul"}	en	6	1045	5	5
146524235X	9781465242358	Personal Finance: An Interactive Applications Approach	https://images.isbndb.com/covers/23/58/9781465242358.jpg	2014	Kendall Hunt Publishing	{"FRENCH  DAN","NOEL  MEGAN"}	en	2	523	5	5
0538798327	9780538798327	California Real Estate Finance	https://images.isbndb.com/covers/83/27/9780538798327.jpg	2010	South-Western Educational Pub	{"Bond, Robert J.","McKenzie, Dennis J.","Fesler, John","Boone, Rick"}	en	9	544	5	5
1259277194	9781259277191	Case Studies in Finance (The Mcgraw-hill Education Series in Finance, Insurance, and Real Estate)	https://images.isbndb.com/covers/71/91/9781259277191.jpg	2017	McGraw-Hill Education	{"Bruner, Robert","Eades, Kenneth","Schill, Michael"}	en	8	784	5	5
0077753860	9780077753863	Focus on Personal Finance with Connect Plus (The Mcgraw-hill/Irwin Series in Finance, Insurance and Real Estate)	https://images.isbndb.com/covers/38/63/9780077753863.jpg	2012	McGraw-Hill/Irwin	{"Kapoor, Jack","Dlabay, Les","Hughes, Robert J."}	en	4	539	5	5
1936948028	9781936948024	Foundations In Personal Finance, College Edition	https://images.isbndb.com/covers/80/24/9781936948024.jpg	2011	Lampo	{"Dave Ramsey"}	en		109	5	5
0615825672	9780615825670	Real Estate Finance and Investments: Risks and Opportunites	https://images.isbndb.com/covers/56/70/9780615825670.jpg	2013	Linneman Associates	{"Peter Linneman"}	en	3.1	498	5	5
1593272820	9781593272821	Eloquent JavaScript: A Modern Introduction to Programming	https://images.isbndb.com/covers/28/21/9781593272821.jpg	2011	No Starch Press	{"Haverbeke, Marijn"}	en	1	289	5
0136117015	9780136117018	Valuation (2nd Edition) (Prentice Hall Series in Finance)	https://images.isbndb.com/covers/70/18/9780136117018.jpg	2010	Prentice Hall	{"Titman, Sheridan","Martin, John D."}	en	552	5	5
1119561175	9781119561170	Introduction to Finance: Markets, Investments, and Financial Management	https://images.isbndb.com/covers/11/70/9781119561170.jpg	2019	Wiley	{"Melicher, Ronald W.","Norton, Edgar A."}	en	17	688	5	5
111830019x	9781118300190	Behavioral Finance + Ws: Understanding The Social, Cognitive, And Economic Debates	https://images.isbndb.com/covers/01/90/9781118300190.jpg	2013	Wiley, John & Sons, Incorporated{"Edwin Burton","Sunit Shah"}	en	1	256	5	5
0134830202	9780134830209	Principles of Managerial Finance, Student Value Edition Plus MyLab Finance with Pearson eText - Access Card Package (Pearson Series in Finance)	https://images.isbndb.com/covers/02/09/9780134830209.jpg	2018	Pearson	{"Zutter, Chad","Smart, Scott"}	en	15	848	5	5
0073382329	9780073382326	Personal Finance	https://images.isbndb.com/covers/23/26/9780073382326.jpg2008	McGraw-Hill/Irwin	{"Kapoor, Jack","Dlabay, Les","Hughes, Robert J."}	en	9	832	5
053875446X	9780538754460	Public Finance: A Contemporary Application of Theory to Policy	https://images.isbndb.com/covers/44/60/9780538754460.jpg	2010	South-Western College Pub	{"Hyman, David N"}	en	10	800	5	5
030733600X	9780307336002	The Wall Street Journal. Complete Personal Finance Guidebook (Wall Street Journal Guidebooks)	https://images.isbndb.com/covers/60/02/9780307336002.jpg	2006	Currency	{"Opdyke, Jeff D."}	en	First Edition	256	5	5
053875446x	9780538754460	Public Finance: A Contemporary Application Of Theory To Policy	https://images.isbndb.com/covers/44/60/9780538754460.jpg	2010	South-western College Pub	{"David N Hyman"}	en	10	800	5	5
047047436x	9780470474365	Personal Finance (wiley Pathways)	https://images.isbndb.com/covers/43/65/9780470474365.jpg	2009		{"Vickie L. Bajtelsmit","Linda G. Rastelli"}	en		0	5	5
0735546045	9780735546042	Finance & Accounting for Nonfinancial Managers	https://images.isbndb.com/covers/60/42/9780735546042.jpg	2003	Aspen Publishers	{"Steven A. Finkler"}	en		382	5	5
0132950421	9780132950428	Fundamentals of Corporate Finance with Myfinancelab Access Code (Prentice Hall Series in Finance)	https://images.isbndb.com/covers/04/28/9780132950428.jpg	2011	Prentice Hall	{}	en	2nd ed.	768	5	5
1422429865	9781422429860	Real Estate Transactions, Finance, and Development	https://images.isbndb.com/covers/98/60/9781422429860.jpg	2009	LexisNexis	{"George Lefcoe"}	en	Sixth Edition	972	5
125970968x	9781259709685	Loose Leaf For Corporate Finance	https://images.isbndb.com/covers/96/85/9781259709685.jpg	2015	Mcgraw-hill Education	{"Stephen Ross","Jeffrey Jaffe","Randolph Westerfield"}	en	11	1056	5	5
0138017492	9780138017491	Personal Finance / Journal	https://images.isbndb.com/covers/74/91/9780138017491.jpg	2010	Pearson College Div	{"Madura, Jeff"}	en	4	649	5	5
1259659216	9781259659218	Essentials of Corporate Finance + Connect:	https://images.isbndb.com/covers/92/18/9781259659218.jpg	2015	MCGRAW-HILL COMPANIES	{"Ross, Stephen"}	en	8	0	5	5
014311963x	9780143119630	Crisis Economics: A Crash Course In The Future Of Finance	https://images.isbndb.com/covers/96/30/9780143119630.jpg	2011	Penguin Books	{"Nouriel Roubini","Stephen Mihm"}	en	368	5	5
1476755744	9781476755748	Red Notice: A True Story of High Finance, Murder, and One Man s Fight for Justichttps://images.isbndb.com/covers/57/48/9781476755748.jpg	2015	Simon & Schuster	{"Browder, Bill"}	en	Reprint	416	5	5
158778713x	9781587787133	Business Organization And Finance: Legal And Economic Principles (concepts And Insights) (concepts & Insights)	https://images.isbndb.com/covers/71/33/9781587787133.jpg	2004	Foundation Press	{"William A. Klein","John C. Coffee Jr."}	en	9	437	5	5
0073525928	9780073525921	School Finance: A Policy Perspective	https://images.isbndb.com/covers/59/21/9780073525921.jpg	2007	McGraw-Hill Education	{"Odden, Allan","Picus, Lawrence"}	en	4	504	5
013502529x	9780135025291	Entrepreneurial Finance (5th Edition)	https://images.isbndb.com/covers/52/91/9780135025291.jpg	2009	Pearson	{"Philip J. Adelman","Alan M. Marks"}	en	5	456	5	5
158778713X	9781587787133	Business Organization and Finance: Legal and Economic Principles (Concepts and Insights) (Concepts & Insights)	https://images.isbndb.com/covers/71/33/9781587787133.jpg	2004	Foundation Press	{"Klein, William A.","Jr., John C. Coffee"}	en	9th	437	5	5
1936948222	9781936948222	Foundations in Personal Finance High School Edition	https://images.isbndb.com/covers/82/22/9781936948222.jpg	2014	Example Product Manufacturer	{"Dave Ramsey"}	en		0	5
007353062x	9780073530628	Fundamentals Of Corporate Finance	https://images.isbndb.com/covers/06/28/9780073530628.jpg	2007	Burr Ridge, Illinois, U.s.a.: Irwin Professional Pub	{"Stephen Ross"}	en	5
0132863472	9780132863476	Principles of Managerial Finance + New Myfinancelab With Pearson Etext	https://images.isbndb.com/covers/34/76/9780132863476.jpg	2011	Pearson College Div	{"Gitman, Lawrence J.","Zutter, Chad J."}	en	Brief	704	5	5
1560118709	9781560118701	Introduction to Local Government Finance	https://images.isbndb.com/covers/87/01/9781560118701.jpg	2016	UNC School of Government	{"Millonzi, Kara A."}	en	Third	416	5
0077861728	9780077861728	Personal Finance	https://images.isbndb.com/covers/17/28/9780077861728.jpg2016	McGraw-Hill Education	{"Walker, Robert","Walker, Kristy"}	en	2	496	5	5
144968727X	9781449687274	Health Care Finance: Basic Tools for Nonfinancial Managers	https://images.isbndb.com/covers/72/74/9781449687274.jpg	2013	Jones & Bartlett Learning	{"Baker, Judith J.","Baker, R.W."}	en	4	542	5	5
0077641876	9780077641870	LOOSE-LEAF FOR FINANCIAL MARKETS AND INSTITUTIONS (Mcgraw-hill/Irwin Series in Finance, Insurance and Real Estate)	https://images.isbndb.com/covers/18/70/9780077641870.jpg	2014	McGraw-Hill Education	{"Saunders, Anthony","Cornett, Marcia"}	en	6	768	5	5
1454833874	9781454833871	Corporate Finance (Aspen Casebook)	https://images.isbndb.com/covers/38/71/9781454833871.jpg	2013	Aspen Publishers	{"Lubben, Stephen J"}	en	5 Revised	384	5	5
0470998008	9780470998007	Market Risk Analysis, Quantitative Methods in Finance	https://images.isbndb.com/covers/80/07/9780470998007.jpg	2008	Wiley	{"Alexander, Carol"}	en	Volume I	320	5	5
1259351947	9781259351945	Connect 1 Semester Access Card for Focus on Personal Finance	https://images.isbndb.com/covers/19/45/9781259351945.jpg	2015	McGraw-Hill Education	{"Kapoor, Jack, Dlabay, Les, Hughes, Robert J."}	en	5	0	5	5
0143130528	9780143130529	The Index Card: Why Personal Finance Doesn t Have to Be Complicated	https://images.isbndb.com/covers/05/29/9780143130529.jpg	2017	Portfolio	{"Olen, Helaine","Pollack, Harold"}	en	Illustrated	256	5	5
007353062X	9780073530628	Fundamentals of Corporate Finance Standard Edition	https://images.isbndb.com/covers/06/28/9780073530628.jpg	2007	McGraw-Hill/Irwin	{"Stephen A. Ross","Randolph Westerfield","Bradford D. Jordan"}	en	8	832	5	5
0077630726	9780077630720	Personal Finance + Connect Plus	https://images.isbndb.com/covers/07/20/9780077630720.jpg	2012	McGraw-Hill/Irwin	{"Walker, Robert"}	en	1	704	5	5
0133543757	9780133543759	NEW MyLab Finance with Pearson eText -- Access Card -- for Principles of Managerial Finance	https://images.isbndb.com/covers/37/59/9780133543759.jpg	2014	Pearson	{"Gitman, Lawrence","Zutter, Chad"}	en	14	944	5	5
0133877728	9780133877724	MyLab Finance with Pearson eText -- Access Card -- for Personal Finance: Turning Money into Wealth (My Finance Lab)	https://images.isbndb.com/covers/77/24/9780133877724.jpg	2015	Pearson	{"Keown, Arthur"}	en	7	656	5	5
0470823194	9780470823194	Islamic Money and Banking: Integrating Money in Capital Theory (Wiley Finance)	https://images.isbndb.com/covers/31/94/9780470823194.jpg	2009	Wiley	{"Toutounchian, Iraj"}	en	1	350	5	5
126013976X	9781260139761	Loose Leaf for M: Finance	https://images.isbndb.com/covers/97/61/9781260139761.jpg	2018	McGraw-Hill Education	{"Cornett, Marcia","Adair, Troy","Nofsinger, John"}	en	4	464	5	5
1260394735	9781260394733	Loose Leaf for Essentials of Corporate Finance	https://images.isbndb.com/covers/47/33/9781260394733.jpg	2019	McGraw-Hill Education	{"Ross, Stephen","Westerfield, Randolph","Jordan, Bradford"}	en	10	688	5	5
1933107987	9781933107981	Study Manual for the Test of Essential Academic Skills, Version 5: Reading, Mathematics, Science, English and Language Usage	https://images.isbndb.com/covers/79/81/9781933107981.jpg	2009	Assessment Technologies Institute	{}	en	1	349	5	5
130510417X	9781305104174	Mathematics: A Practical Odyssey	https://images.isbndb.com/covers/41/74/9781305104174.jpg	2015	Cengage Learning	{"Johnson, David B.","Mowry, Thomas A."}	en	8	1024	5	5
130510417x	9781305104174	Mathematics: A Practical Odyssey	https://images.isbndb.com/covers/41/74/9781305104174.jpg		Cengage Learning	{"Johnson, David B.","Mowry, Thomas A."}	en	8	1024	5	5
014014739X	9780140147391	Journey through Genius: The Great Theorems of Mathematics	https://images.isbndb.com/covers/73/91/9780140147391.jpg	1991	Penguin Books	{"Dunham, William"}	en	1st	320	5
0470458275	9780470458273	Finite Mathematics: An Applied Approach	https://images.isbndb.com/covers/82/73/9780470458273.jpg	2011	Wiley	{"Sullivan, Michael"}	en	11	864	5	5
0840049420	9780840049421	Mathematics: A Discrete Introduction	https://images.isbndb.com/covers/94/21/9780840049421.jpg	2012	Cengage Learning	{"Scheinerman, Edward A."}	en	3	504	5	5
9810185030	9789810185039	Primary Mathematics 3B: Textbook	https://images.isbndb.com/covers/50/39/9789810185039.jpg	2003	Marshall Cavendish Education	{"Singapore Math"}	zh	US Edition	112	5
0465097677	9780465097678	How to Bake Pi: An Edible Exploration of the Mathematics of Mathematics	https://images.isbndb.com/covers/76/78/9780465097678.jpg	2016	Basic Books	{"Cheng, Eugenia"}	en	Illustrated	304	5	5
1118457447	9781118457443	Mathematics for Elementary Teachers: A Contemporary Approach	https://images.isbndb.com/covers/74/43/9781118457443.jpg	2013	Wiley	{"Musser, Gary L.","Peterson, Blake E.","Burger, William F."}	en	10	1040	5	5
1285450876	9781285450872	Basic Mathematics for College Students with Early Integers	https://images.isbndb.com/covers/08/72/9781285450872.jpg	2014	Cengage Learning	{"Tussy, Alan S.","Koenig, Diane"}	en	5	944	5	5
0132824876	9780132824873	Teaching Student-Centered Mathematics: Developmentally Appropriate Instruction for Grades 3-5 (Volume II) (2nd Edition) (Teaching Student-Centered Mathematics Series)	https://images.isbndb.com/covers/48/73/9780132824873.jpg	2013	Pearson	{"Van de Walle, John A.","Karp, Karen S.","Lovin, LouAnn H.","Bay-Williams, Jennifer M."}	en	2	464	5	5
0133116530	9780133116533	Basic Technical Mathematics with Calculus (10th Edition)	https://images.isbndb.com/covers/65/33/9780133116533.jpg	2013	Pearson	{"Washington, Allyn J."}	en	10	1152	5
1133281451	9781133281450	Mathematics for Machine Technology	https://images.isbndb.com/covers/14/50/9781133281450.jpg	2015	Cengage Learning	{"Peterson, John C.","Smith, Robert D."}	en	7	608	5	5
0325030537	9780325030531	Extending Children s Mathematics: Fractions & Decimals: Innovations In Cognitively Guided Instruction	https://images.isbndb.com/covers/05/31/9780325030531.jpg	2011	Heinemann	{"Empson, Susan B.","Levi, Linda"}	en	Illustrated	272	5	5
0321931904	9780321931900	Basic College Mathematics	https://images.isbndb.com/covers/19/00/9780321931900.jpg	2013	Pearson	{"Bittinger, Marvin","Beecher, Judith","Johnson, Barbara"}	en	12	744	5
0132613689	9780132613682	Early Childhood Mathematics	https://images.isbndb.com/covers/36/82/9780132613682.jpg	2012	Pearson	{"Sperry Smith, Susan"}	en	5	288	5	5
019870643X	9780198706434	The Foundations of Mathematics	https://images.isbndb.com/covers/64/34/9780198706434.jpg	2015	Oxford University Press	{"Stewart, Ian"}	en	2	412	5	5
1577667301	9781577667308	Discrete Mathematics	https://images.isbndb.com/covers/73/08/9781577667308.jpg2011	Waveland Pr Inc	{"Gary Chartrand","Ping Zhang"}	en	1	671	5	5
0073229725	9780073229720	Discrete Mathematics and Its Applications	https://images.isbndb.com/covers/97/20/9780073229720.jpg	2006	McGraw-Hill Education	{"Rosen, Kenneth"}	en	6	1008	5	5
012384682X	9780123846822	An Introduction to the Mathematics of Financial Derivatives	https://images.isbndb.com/covers/68/22/9780123846822.jpg	2013	Academic Press	{"Hirsa, Ali","Neftci, Salih N."}	en	454	5	5
061833291X	9780618332915	Finite Mathematics and Applied Calculus	https://images.isbndb.com/covers/29/15/9780618332915.jpg	2006	Cengage Learning	{"Frank C. Wilson"}	en	1	1056	5	5
0273760688	9780273760689	Essential Mathematics for Economic Analysis (4th Edition)	https://images.isbndb.com/covers/06/89/9780273760689.jpg	2012	Pearson	{"Sydsaeter, Knut","Hammond, Peter","Strom, Arne"}	en	4	768	5	5
061833291x	9780618332915	Finite Mathematics And Applied Calculus	https://images.isbndb.com/covers/29/15/9780618332915.jpg	2006	Cengage Learning	{"Frank C. Wilson"}	en	1	0	5	5
0024097640	9780024097644	Mathematics for Young Children	https://images.isbndb.com/covers/76/44/9780024097644.jpg	1997	Pearson	{"Shaw, Jean M.","Blake, Sally"}	en	1	273	5	5
0273763563	9780273763567	Mathematics for Economics and Business	https://images.isbndb.com/covers/35/67/9780273763567.jpg	2013	Pearson	{"Jacques, Ian"}	en	7	639	5	5
0470458364	9780470458365	Advanced Engineering Mathematics	https://images.isbndb.com/covers/83/65/9780470458365.jpg	2011	Wiley	{"Kreyszig, Erwin"}	en	10	1280	4	5
1133107427	9781133107422	Topics in Contemporary Mathematics	https://images.isbndb.com/covers/74/22/9781133107422.jpg	2013	Cengage Learning	{"Bello, Ignacio","Kaul, Anton","Britton, Jack R."}	en	10	992	5	5
0325001375	9780325001371	Children s Mathematics: Cognitively Guided Instruction	https://images.isbndb.com/covers/13/71/9780325001371.jpg	1999	Heinemann	{"Carpenter, Thomas P","Fennema, Elizabeth","Franke, Megan Loef L.","Levi, Linda","Empson, Susan B"}	en	1	112	5	5
048667620X	9780486676203	Partial Differential Equations for Scientists and Engineers (Dover Books on Mathematics)	https://images.isbndb.com/covers/62/03/9780486676203.jpg	1993	Dover Publications	{"Stanley J. Farlow"}	en	Reprint	448	5	5
0131140140	9780131140141	Business Mathematics	https://images.isbndb.com/covers/01/41/9780131140141.jpg2005	Pearson	{"Roueche, Nelda","Graves, Virginia","Tuttle, Michael"}	en	9	746	5	5
0321955064	9780321955067	Introduction to Technical Mathematics with MyLab Math Student Access Kit	https://images.isbndb.com/covers/50/67/9780321955067.jpg	2013	Pearson	{"Washington, Allyn","Triola, Mario","Reda, Ellena"}	en	5	747	5	5
0486284247	9780486284248	Concepts of Modern Mathematics (Dover Books on Mathematics)	https://images.isbndb.com/covers/42/48/9780486284248.jpg	1995	Dover Publications	{"Ian Stewart"}	en	Revised ed.	368	5	5
0321731530	9780321731531	Developmental Mathematics (8th Edition)	https://images.isbndb.com/covers/15/31/9780321731531.jpg	2010	Pearson	{"Marvin L. Bittinger","Judith A. Beecher"}	en	8	1280	5	5
0321947622	9780321947628	Finite Mathematics for Business, Economics, Life Sciences and Social Sciences Plus NEW MyLab Math with Pearson eText -- Access Card Package	https://images.isbndb.com/covers/76/28/9780321947628.jpg	2014	Pearson	{"Barnett, Raymond","Ziegler, Michael","Byleen, Karl"}	en	13	633	5	5
0134674146	9780134674148	College Mathematics for Business, Economics, Life Sciences, and Social Sciences	https://images.isbndb.com/covers/41/48/9780134674148.jpg	2018	Pearson	{"Barnett, Raymond","Ziegler, Michael","Byleen, Karl","Stocker, Christopher"}	en	14	1008	5	5
1461462703	9781461462705	Elementary Analysis: The Theory of Calculus (Undergraduate Texts in Mathematics)https://images.isbndb.com/covers/27/05/9781461462705.jpg	2013	Springer	{"Ross, Kenneth A."}	en	2nd ed. 2013	412	5	5
0021383553	9780021383559	Everyday Mathematics 4, Grade 3, Student Reference Book	https://images.isbndb.com/covers/35/59/9780021383559.jpg	2015	McGraw-Hill Education	{"Bell et al."}	en	4	344	5	5
032192326X	9780321923264	Mathematics All Around Plus NEW MyLab Math with Pearson eText -- Access Card Package (5th Edition)	https://images.isbndb.com/covers/32/64/9780321923264.jpg	2013	Pearson	{"Pirnot, Tom"}	en	5	810	5	5
039304002x	9780393040029	Mathematics: From The Birth Of Numbers	https://images.isbndb.com/covers/00/29/9780393040029.jpg	1997	W. W. Norton & Company	{"Jan Gullberg"}	en	1	1093	5	5
0131449222	9780131449220	Data and Probability Connections: Mathematics for Middle School Teachers	https://images.isbndb.com/covers/92/20/9780131449220.jpg	2006	Pearson	{"Perkowski, Debra A.","Perkowski, Michael","University of Missouri, UMO"}	en	1	416	5	5
0821536028	9780821536025	Progress in Mathematics Grade 2	https://images.isbndb.com/covers/60/25/9780821536025.jpg	2009	Sadlier-Oxford	{"Catherine LeTourneau","Alfred Posamentier"}	en		624	5	5
1305112830	9781305112834	Explorations, Mathematics for Elementary School Teachers	https://images.isbndb.com/covers/28/34/9781305112834.jpg	2015	Cengage Learning	{"Bassarear, Tom"}	en	6	352	5	5
1305585453	9781305585454	Contemporary Mathematics for Business & Consumers, Brief Edition	https://images.isbndb.com/covers/54/54/9781305585454.jpg	2016	Cengage Learning	{"Brechner, Robert","Bergeman, Geroge"}	en	8	512	5	5
0306450364	9780306450365	Basic Training in Mathematics: A Fitness Program for Science Students	https://images.isbndb.com/covers/03/65/9780306450365.jpg	1995	Springer	{"Shankar, R."}	en	1995	382	5
0073384445	9780073384443	Basic Mathematical Skills with Geometry (Hutchison Series in Mathematics)	https://images.isbndb.com/covers/44/43/9780073384443.jpg	2013	McGraw-Hill Education	{"Baratto, Stefan"}	en	9	736	5	5
0816051240	9780816051243	Encyclopedia of Mathematics (Facts on File Science Dictionary)	https://images.isbndb.com/covers/12/43/9780816051243.jpg	2005	Facts	{"Tanton, James Stuart"}	en		568	5
0486691152	9780486691152	Introductory Discrete Mathematics (Dover Books on Computer Science)	https://images.isbndb.com/covers/11/52/9780486691152.jpg	2010	Dover Publications	{"Balakrishnan, V. K ."}	en		256	5	5
0077350049	9780077350048	Beginning and Intermediate Algebra: The Language & Symbolism of Mathematics	https://images.isbndb.com/covers/00/48/9780077350048.jpg	2010	McGraw-Hill Education	{"Hall, James","Mercer, Brian"}	en	3	991	5	5
1439049572	9781439049570	Calculus Concepts: An Informal Approach to the Mathematics of Change (Textbooks Available with Cengage Youbook)	https://images.isbndb.com/covers/95/70/9781439049570.jpg	2011	Cengage Learning	{"LaTorre, Donald R.","Kenelly, John W.","Reed, Iris B.","Carpenter, Laurel R.","Harris, Cynthia R."}	en	5	744	5	5
0495810975	9780495810971	Guiding Children s Learning of Mathematics, 12th Edition	https://images.isbndb.com/covers/09/71/9780495810971.jpg	2010	Cengage Learning	{"Tipps, Steve","Johnson, Art","Kennedy, Leonard M."}	en	12	656	5	5
053495166X	9780534951665	Foundations of Higher Mathematics	https://images.isbndb.com/covers/16/65/9780534951665.jpg	1995	Cengage Learning	{"Fletcher, Peter","Patty, C. Wayne"}	en	3	336	5
053495166x	9780534951665	Foundations Of Higher Mathematics	https://images.isbndb.com/covers/16/65/9780534951665.jpg	1995	Cengage Learning	{"Peter Fletcher","C. Wayne Patty"}	en	3	336	5
038795385x	9780387953854	Algebra (graduate Texts In Mathematics)	https://images.isbndb.com/covers/38/54/9780387953854.jpg	2005	Springer	{"Lang, Serge"}	en	3	914	5	5
1111427410	9781111427412	Advanced Engineering Mathematics	https://images.isbndb.com/covers/74/12/9781111427412.jpg	2011	Cengage Learning	{"O Neil, Peter V."}	en	7	893	5	5
0486650383	9780486650388	Introduction to Analysis (Dover Books on Mathematics)	https://images.isbndb.com/covers/03/88/9780486650388.jpg	1986	Dover Publications	{"Maxwell Rosenlicht"}	en	unknown	254	5
1461426324	9781461426325	Mathematics and Its History (Undergraduate Texts in Mathematics)	https://images.isbndb.com/covers/63/25/9781461426325.jpg	2012	Springer	{"Stillwell, John"}	en	Softcover reprint of hardcover 3rd ed. 2010	684	5	5
1464193339	9781464193330	Reconceptualizing Mathematics: for Elementary School Teachers	https://images.isbndb.com/covers/33/30/9781464193330.jpg	2016	W. H. Freeman	{"Sowder, Judith","Sowder, Larry","Nickerson, Susan"}	en	Third	936	5	5
0131449230	9780131449237	Calculus Connections (Prentice Hall Series in Mathematics for Middle School Teachers)	https://images.isbndb.com/covers/92/37/9780131449237.jpg	2006	Pearson	{"Harcharras, Asma","Mitrea, Dorina","University of Missouri, UMO"}	en	1	432	5	5
1605252794	9781605252797	Applied Mathematics	https://images.isbndb.com/covers/27/97/9781605252797.jpg2010	Goodheart-Willcox	{"Phagan, R. Jesse"}	en	Fourth Edition, Workbook	196	5	5
0071635408	9780071635400	Schaum s Outline of Advanced Mathematics for Engineers and Scientists (Schaum s Outlines)	https://images.isbndb.com/covers/54/00/9780071635400.jpg	2009	McGraw-Hill Education	{"Spiegel, Murray"}	en	1	432	5	5
0321645545	9780321645548	Finite Mathematics with Applications (10th Edition) (Lial/Hungerford/Holcomb)	https://images.isbndb.com/covers/55/48/9780321645548.jpg	2010	Pearson	{"Lial, Margaret L.","Hungerford, Thomas W.","Holcomb, John P."}	en	10	704	5	5
0387978941	9780387978949	Differential Equations and Their Applications: An Introduction to Applied Mathematics (Texts in Applied Mathematics (11))	https://images.isbndb.com/covers/89/49/9780387978949.jpg	1992	Springer	{"Braun, Martin"}	en	4th	594	5	5
013062568X	9780130625687	Prentice-Hall Mathematics: Algebra 2	https://images.isbndb.com/covers/56/87/9780130625687.jpg	2004	Prentice-Hall	{"Randall I.;Bragg, Sadie Chavis;Handlin, William G. Kennedy Dan;Charles"}	en	1	998	5	5
0831130865	9780831130862	Technical Shop Mathematics	https://images.isbndb.com/covers/08/62/9780831130862.jpg	2005	Industrial Press, Inc.	{"Achatz, Thomas"}	en	Third	600	5	5
0486204731	9780486204734	Amusements In Mathematics (dover Recreational Math)	https://images.isbndb.com/covers/47/34/9780486204734.jpg	1958	Dover Publications	{"Henry E. Dudeney"}	en	Unabridged	288	5	5
0201437244	9780201437249	Chapter Zero: Fundamental Notions of Abstract Mathematics (2nd Edition)	https://images.isbndb.com/covers/72/49/9780201437249.jpg	2000	Pearson	{"Schumacher, Carol"}	en	2	256	5
0786881879	9780786881871	Five Equations that Changed the World: The Power and Poetry of Mathematics	https://images.isbndb.com/covers/18/71/9780786881871.jpg	1996	Hachette Books	{"Guillen, Michael"}	en	288	5	5
1111540462	9781111540463	Technical Mathematics	https://images.isbndb.com/covers/04/63/9781111540463.jpg2012	Cengage Learning	{"Peterson, John C."}	en	4	976	5	5
0486296725	9780486296722	Game Theory: A Nontechnical Introduction (Dover Books on Mathematics)	https://images.isbndb.com/covers/67/22/9780486296722.jpg	1997	Dover Publications	{"Davis, Morton D."}	en	Subsequent	288	5	5
0521633966	9780521633963	Markov Chains (Cambridge Series in Statistical and Probabilistic Mathematics)	https://images.isbndb.com/covers/39/63/9780521633963.jpg	1998	Cambridge University Press	{"Norris, J. R."en	1	254	5	5
0387951164	9780387951164	Differential Equations and Dynamical Systems (Texts in Applied Mathematics (7))	https://images.isbndb.com/covers/11/64/9780387951164.jpg	2006	Springer	{"Perko, Lawrence"}	en	3rd	571	5	5
0757562043	9780757562044	Modern Mathematics for Elementary Educators	https://images.isbndb.com/covers/20/44/9780757562044.jpg	2009	Kendall Hunt Publishing	{"Ruric E. Wheeler","Ed R. Wheeler"}	en	13th	742	5	5
1608406024	9781608406029	Math & YOU: The Power & Use of Mathematics	https://images.isbndb.com/covers/60/29/9781608406029.jpg	2011	Larson Texts, Inc.	{"Larson, Ron"}	en	First Edition	576	5	5
0321496906	9780321496904	Fundamental Mathematics through Applications	https://images.isbndb.com/covers/69/04/9780321496904.jpg	2007	Pearson	{"Akst, Geoffrey","Bragg, Sadie"}	en	4	384	5	5
159460729x	9781594607295	Mathematics For Veterinary Medical Technicians: A Text/ Workbook With Applications	https://images.isbndb.com/covers/72/95/9781594607295.jpg	2009	Carolina Academic Pr	{"Edward M. Stumpf","Frederick R. F..."}	en	3	0	5	5
0131008455	9780131008458	Applied Mathematics for Physical Chemistry	https://images.isbndb.com/covers/84/58/9780131008458.jpg	2003	Prentice Hall	{"Barrante, James R"}	en	3rd Revised ed.	256	5	5
0136097081	9780136097082	Mathematics for the Trades: A Guided Approach (9th Edition)	https://images.isbndb.com/covers/70/82/9780136097082.jpg	2010	Prentice Hall	{"Robert A. Carman","Hal M. Saunders"}	en	9th	864	5	5
1439816247	9781439816240	Advanced Engineering Mathematics with MATLAB, Third Edition (Advances in Applied Mathematics)	https://images.isbndb.com/covers/62/40/9781439816240.jpg	2010	CRC Press	{"Duffy, Dean G."}	en	3	1105	5	5
0321646940	9780321646941	Mathematics for Elementary Teachers	https://images.isbndb.com/covers/69/41/9780321646941.jpg	2010	Pearson Education (US)	{"Sybilla Beckmann"}	en	Third Edition	760	5	5
0471327840	9780471327844	Mathematics: An Applied Approach	https://images.isbndb.com/covers/78/44/9780471327844.jpg	2004	Wiley	{"Sullivan, Michael","Mizrahi, Abe"}	en	8	1260	5	5
0495557501	9780495557500	Precalculus: Mathematics for Calculus, Enhanced Review Edition, 5th Edition	https://images.isbndb.com/covers/75/00/9780495557500.jpg	2008	Brooks Cole	{"Stewart, James","Redlin, Lothar","Watson, Saleem"}	en	5	1072	5	5
0881339407	9780881339406	A First Course in Discrete Mathematics	https://images.isbndb.com/covers/94/06/9780881339406.jpg	1997	Waveland Pr Inc	{"John C. Molluzzo","Fred Buckley"}	en	1	507	5	5
1598571192	9781598571196	Teaching Mathematics in Early Childhood	https://images.isbndb.com/covers/11/96/9781598571196.jpg	2011	Brookes Publishing	{"Moomaw Ed.D., Sally"}	en	1	232	5	5
0821536044	9780821536049	Progress in Mathematics, Grade 4 Sadlier-Oxford	https://images.isbndb.com/covers/60/49/9780821536049.jpg	2009	Sadlier-Oxford	{"Catherine D LeTourneau","Alfred S Posamentier"}	en	500	5	5
1441970223	9781441970220	The Art of Proof: Basic Training for Deeper Mathematics (Undergraduate Texts in Mathematics)	https://images.isbndb.com/covers/02/20/9781441970220.jpg	2010	Springer	{"Matthias Beck","Ross Geoghegan"}	en	2010	203	5	5
053449501X	9780534495015	Discrete Mathematics for Computer Science (with Student Solutions Manual CD-ROM)https://images.isbndb.com/covers/50/15/9780534495015.jpg	2005	Cengage Learning	{"Haggard, Gary","Schlipf, John","Whitesides, Sue"}	en	1	624	5	5
0486241041	9780486241043	Mathematics and the Physical World (Dover Books on Mathematics)	https://images.isbndb.com/covers/10/43/9780486241043.jpg	1981	Dover Publications	{"Kline, Morris"}	en	Reissue	512	5	5
0387964126	9780387964126	Linear Algebra (Undergraduate Texts in Mathematics)	https://images.isbndb.com/covers/41/26/9780387964126.jpg	1987	Springer	{"Lang, Serge"}	en	3rd	294	5	5
0521765390	9780521765398	Probability: Theory and Examples (Cambridge Series in Statistical and Probabilistic Mathematics)	https://images.isbndb.com/covers/53/98/9780521765398.jpg	2010	Cambridge University Press	{"Durrett, Rick"}	en	4	440	5	5
0470458283	9780470458280	Student Solutions Manual to accompany Finite Mathematics: An Applied Approach, 11e	https://images.isbndb.com/covers/82/80/9780470458280.jpg	2010	Wiley	{"Sullivan, Michael"}	en	11	304	5	5
1285857488	9781285857480	Student Workbook for Tussy/Koenig s Basic Mathematics for College Students with Early Integers	https://images.isbndb.com/covers/74/80/9781285857480.jpg	2014	Cengage Learning	{"Tussy, Alan S.","Koenig, Diane"}	en	5	1	5	5
0062024477	9780062024473	Mathematics Through the Eyes of Faith (Through the Eyes of Faith Series)	https://images.isbndb.com/covers/44/73/9780062024473.jpg	2011	HarperOne	{"Howell, Russell","Bradley, James"}	en	Illustrated	288	5	5
013040103X	9780130401038	Business Mathematics Worktext	https://images.isbndb.com/covers/10/38/9780130401038.jpg	1999	Pearson	{"Highland, Esther","Peselnick, Charles"}	en	2	736	5	5
1111313598	9781111313593	Practical Problems in Mathematics for Welders (MindTap Course List)	https://images.isbndb.com/covers/35/93/9781111313593.jpg	2011	Cengage Learning	{"Chasan, Robert"}	en	240	5	5
1441971262	9781441971265	Proofs and Fundamentals: A First Course in Abstract Mathematics (Undergraduate Texts in Mathematics)	https://images.isbndb.com/covers/12/65/9781441971265.jpg	2011	Springer	{"Bloch, Ethan D."}	en	2nd ed. 2011	384	5	5
0821849743	9780821849743	Partial Differential Equations: Second Edition (Graduate Studies in Mathematics)https://images.isbndb.com/covers/97/43/9780821849743.jpg	2010	American Mathematical Society	{"Lawrence C. Evans"}	en	2	749	5	5
0495915424	9780495915423	Gardner s Art Through the Ages: A Global History	https://images.isbndb.com/covers/54/23/9780495915423.jpg	2012	Cengage Learning	{"Kleiner, Fred S."}	en	14	1216	5
0132043890	9780132043892	Dancing Through History	https://images.isbndb.com/covers/38/92/9780132043892.jpg1993	Prentice-Hall, Inc.	{"Cass, Joan"}	en	1	400	5	5
0810994429	9780810994423	Art: A World History	https://images.isbndb.com/covers/44/23/9780810994423.jpg2007	Harry N. Abrams	{"Buchholz, Elke Linda","Kaeppele, Susanne","Hille, Karoline","Stotland, Irina","Buhler, Gerhard"}	en	Illustrated	512	5	5
0131366181	9780131366183	By the People A History of the United States	https://images.isbndb.com/covers/61/83/9780131366183.jpg	2014	Pearson Education	{"James Fraser"}	en	AP Edition	955	5
1429255269	9781429255264	Earth System History	https://images.isbndb.com/covers/52/64/9781429255264.jpg2014	W. H. Freeman	{"Steven M. Stanley","John A. Luczaj"}	en	Fourth	624	5	5
0316022365	9780316022361	A Different Mirror: A History of Multicultural America	https://images.isbndb.com/covers/23/61/9780316022361.jpg	2008	Back Bay Books	{"Takaki, Ronald"}	en	Revised	529	5	5
0312648839	9780312648831	Freedom on My Mind: A History of African Americans with Documents, Vol. 1: To 1885	https://images.isbndb.com/covers/88/31/9780312648831.jpg	2012	Bedford/St. Martin s	{"Deborah Gray White","Mia Bay","Waldo E. Martin Jr."}	en	First Edition	544	5	5
0618318577	9780618318575	America Compared: American History in International Perspective, Vol. 2: Since 1865	https://images.isbndb.com/covers/85/75/9780618318575.jpg	2005	Cengage Learning	{"Guarneri, Carl J."}	en	2	464	5	5
1451173229	9781451173222	Bates  Pocket Guide to Physical Examination and History Taking	https://images.isbndb.com/covers/32/22/9781451173222.jpg	2012	Lippincott Williams & Wilkins	{"Bickley, Lynn S., M.D.","Szilagyi, Peter G., M.D."}	en	7	417	5	5
1457628937	9781457628931	America’s History, For the AP* Course (Beford Integrated Media Edition)	https://images.isbndb.com/covers/89/31/9781457628931.jpg	2014	Bedford/St. Martin s	{"Henretta, James A.","Hinderaker, Eric","Edwards, Rebecca","Self, Robert O."}	en	Eighth	1216	5	5
0190614471	9780190614478	Sustainability: A History	https://images.isbndb.com/covers/44/78/9780190614478.jpg	2016	Oxford University Press	{"Caradonna, Jeremy L."}	en	Reprint	352	5	5
0190600225	9780190600228	The Oxford History of Western Music	https://images.isbndb.com/covers/02/28/9780190600228.jpg	2018	Oxford University Press	{"Gibbs, Christopher H.","Taruskin, Richard"}	en	2	992	5	5
0230375103	9780230375109	The Secret History of Democracy	https://images.isbndb.com/covers/51/09/9780230375109.jpg	2011	Palgrave Macmillan	{"Isakhan, Benjamin","Stockwell, Stephen"}	en	2011	252	5
0131941445	9780131941441	Consider the Source: Documents in Latin American History	https://images.isbndb.com/covers/14/41/9780131941441.jpg	2006	Pearson	{"Charlip, Julie A."}	en	8th	176	5	5
0062397346	9780062397348	A People s History of the United States	https://images.isbndb.com/covers/73/48/9780062397348.jpg	2015	Harper Perennial Modern Classics	{"Zinn, Howard"}	en	Reissue	784	5
0393912647	9780393912647	America: A Narrative History (Ninth Edition) (Vol. 2)	https://images.isbndb.com/covers/26/47/9780393912647.jpg	2012	W. W. Norton & Company	{"George Brown Tindall","David Emory Shi"}	en	Ninth	1008	5	5
0132069482	9780132069489	First Americans: A History of Native Peoples, Combined Volume	https://images.isbndb.com/covers/94/89/9780132069489.jpg	2012	Pearson Higher Education	{"Townsend, Kenneth W.","Nicholas, Mark A."}	en	1	672	5	5
0805092994	9780805092998	The Sixth Extinction: An Unnatural History	https://images.isbndb.com/covers/29/98/9780805092998.jpg	2014	Henry Holt and Co.	{"Kolbert, Elizabeth"}	en	1st	336	5	5
0073382205	9780073382203	Living Theatre: A History of Theatre	https://images.isbndb.com/covers/22/03/9780073382203.jpg	2011	McGraw-Hill Education	{"Wilson, Edwin","Goldfarb President, Alvin"}	en	6	576	5	5
0465094384	9780465094387	Caliphate: The History of an Idea	https://images.isbndb.com/covers/43/87/9780465094387.jpg	2016	Basic Books	{"Kennedy, Hugh"}	en	1	338	5	5
9774160657	9789774160653	Arab Cinema: History and Cultural Identity	https://images.isbndb.com/covers/06/53/9789774160653.jpg	2007	American University in Cairo Press	{"Shafik, Viola"}	ar	Revised	288	5	5
0143038273	9780143038276	The Cold War: A New History	https://images.isbndb.com/covers/82/76/9780143038276.jpg	2006	Penguin Books	{"Gaddis, John Lewis"}	en	Illustrated	352	5	5
0240821130	9780240821139	Motion Graphic Design, Third Edition: Applied History and Aesthetics	https://images.isbndb.com/covers/11/39/9780240821139.jpg	2013	Focal Press	{"Krasner, Jon"}	en	3	540	5	5
0190240474	9780190240479	Cultures of the West: A History, Volume 2: Since 1350	https://images.isbndb.com/covers/04/79/9780190240479.jpg	2015	Oxford University Press	{"Backman, Clifford R."}	en	2	888	5	5
158005224X	9781580052245	Transgender History (Seal Studies)	https://images.isbndb.com/covers/22/45/9781580052245.jpg	2008	Seal Press	{"Stryker, Susan"}	en	First Printing	208	5	5
1442601108	9781442601109	A History of Anthropological Theory, Third Edition	https://images.isbndb.com/covers/11/09/9781442601109.jpg	2008	University of Toronto Press, Higher Education Division	{"Erickson, Paul A.","Murphy, Liam D."}	en	3	296	5	5
0205259499	9780205259496	History of Modern Art Volume II (7th Edition)	https://images.isbndb.com/covers/94/96/9780205259496.jpg	2012	Pearson	{"Arnason, H. H.","Mansfield, Elizabeth C."}	en	7	448	5
1319104932	9781319104931	Through Women s Eyes: An American History with Documents	https://images.isbndb.com/covers/49/31/9781319104931.jpg	2018	Bedford/St. Martin s	{"DuBois, Ellen Carol","Dumenil, Lynn"}	en	Fifth	848	5	5
1285783085	9781285783086	Societies, Networks, and Transitions, Volume I: To 1500: A Global History	https://images.isbndb.com/covers/30/86/9781285783086.jpg	2014	Cengage Learning	{"Lockard, Craig A."}	en	3	560	5	5
007320692x	9780073206929	The Twentieth Century And Beyond: A Global History	https://images.isbndb.com/covers/69/29/9780073206929.jpg	2007	Mcgraw-hill Companies, The	{"Richard D. Goff","Walter Moss","Janice Terry"}	en	7	0	5	5
1305585305	9781305585300	Major Problems in American History, Volume II	https://images.isbndb.com/covers/53/00/9781305585300.jpg	2016	Cengage Learning	{"Cobbs, Elizabeth","Blum, Edward J.","Gjerde, Jon"}	en	4	528	5	5
1400096235	9781400096237	The Information: A History, A Theory, A Flood	https://images.isbndb.com/covers/62/37/9781400096237.jpg	2012	Vintage	{"Gleick, James"}	en	Illustrated	544	5	5
1305091469	9781305091467	Western Civilization, A Brief History	https://images.isbndb.com/covers/14/67/9781305091467.jpg	2015	Cengage Learning	{"Perry, Marvin"}	en	11	592	5	5
0133307026	9780133307023	WORLD HISTORY 2016 STUDENT EDITION GRADE 11	https://images.isbndb.com/covers/70/23/9780133307023.jpg	2014	Savvas Learning Co	{"Savvas Learning Co"}	en		0	5	5
0190614463	9780190614461	The Race for Paradise: An Islamic History of the Crusades	https://images.isbndb.com/covers/44/61/9780190614461.jpg	2016	Oxford University Press	{"Cobb, Paul M."}	en	Reprint	360	5	5
0231028385	9780231028387	Religion in Japanese History (American Lectures on the History of Religions)	https://images.isbndb.com/covers/83/87/9780231028387.jpg	1966	Columbia University Press	{"Kitagawa, Joseph"}	en	Revised ed.	475	5	5
0078976421	9780078976421	Freiler, AP Achiever Exam Prep Guide European History, 2017, 2e, Student Edition (A/P EUROPEAN HISTORY)	https://images.isbndb.com/covers/64/21/9780078976421.jpg	2016	McGraw-Hill Education	{"Freiler, Christopher"}	en	2	416	5	5
1250062187	9781250062185	The Sixth Extinction: An Unnatural History	https://images.isbndb.com/covers/21/85/9781250062185.jpg	2015	Picador	{"Kolbert, Elizabeth"}	en	Reprint	336	5	5
0615394973	9780615394978	A Never Event: Exposing the Largest Outbreak of Hepatitis C in American Healthcare History	https://images.isbndb.com/covers/49/78/9780615394978.jpg	2014	History Examined, LLC	{"McKnight, Evelyn V.","Bennington, Travis T."}	en		360	5	5
0618690085	9780618690084	World History: Patterns of Interaction: Student Edition 2007	https://images.isbndb.com/covers/00/84/9780618690084.jpg	2007	MCDOUGAL LITTEL	{"MCDOUGAL LITTEL"}	en	Student	1376	5
1606064290	9781606064290	The Brilliant History of Color in Art	https://images.isbndb.com/covers/42/90/9781606064290.jpg	2014	J. Paul Getty Museum	{"Finlay, Victoria"}	en	1	128	5	5
0814735576	9780814735572	Sex, Love, Race: Crossing Boundaries in North American History	https://images.isbndb.com/covers/55/72/9780814735572.jpg	1999	NYU Press	{}	en		416	5	5
0393920097	9780393920093	A History of Narrative Film (Fifth Edition)	https://images.isbndb.com/covers/00/93/9780393920093.jpg	2016	W. W. Norton & Company	{"Cook, David A."}	en	Fifth	864	5	5
142140267x	9781421402673	A History Of American Higher Education, 2nd Edition	https://images.isbndb.com/covers/26/73/9781421402673.jpg		John Hopkins University Press	{"Thelin, John R."}	en	2	504	5	5
019049168X	9780190491680	[019049168X] [9780190491680] Holy Sh*t: A Brief History of Swearing Reprint Edition-Paperback	https://images.isbndb.com/covers/16/80/9780190491680.jpg	2016	Oxford University Press	{}	en	Reprint	352	5	5
0826415555	9780826415554	All about Oscar: The History and Politics of the Academy Awards	https://images.isbndb.com/covers/55/54/9780826415554.jpg	2003	Bloomsbury Academic	{"Levy, Emanuel"}	en	2	400	5	5
0133936627	9780133936629	Janson s History of Art, Volume 2 Reissued Edition (8th Edition)	https://images.isbndb.com/covers/66/29/9780133936629.jpg	2015	Pearson	{"Davies, Penelope J.E.","Hofrichter, Frima Fox","Jacobs, Joseph F.","Simon, David L.","Roberts, Ann S."}	en	8	736	5	5
0143119281	9780143119289	Harvest of Empire: A History of Latinos in America	https://images.isbndb.com/covers/92/89/9780143119289.jpg	2011	Penguin Books	{"Gonzalez, Juan"}	en	Revised ed.	416	5
013603599X	9780136035992	Forty Studies that Changed Psychology: Explorations into the History of Psychological Research	https://images.isbndb.com/covers/59/92/9780136035992.jpg	2008	Prentice Hall	{"Roger R. Hock"}	en	6th	352	5	5
0076632857	9780076632855	A History of Europe in the Modern World: AP Edition (A/P European History)	https://images.isbndb.com/covers/28/55/9780076632855.jpg	2013	Glencoe/McGraw-Hill School Pub	{"Palmer, R. R.","Colton, Joel","Kramer, Lloyd"}	en	11	1072	5	5
0199797269	9780199797264	Ethics: History, Theory, and Contemporary Issues	https://images.isbndb.com/covers/72/64/9780199797264.jpg	2011	Oxford University Press	{"Cahn, Steven M.","Markie, Peter"}	en	992	5	5
0300172605	9780300172607	Graphic Design: A New History	https://images.isbndb.com/covers/26/07/9780300172607.jpg	2012	Yale University Press	{"Eskilson, Stephen J."}	en	2nd	464	5	5
0205963048	9780205963041	A History of Psychology: Ideas & Context (5th Edition)	https://images.isbndb.com/covers/30/41/9780205963041.jpg	2013	Pearson	{"King, D. Brett","Woody, William Douglas","Viney, Wayne"}	en	5	576	5	5
013199140X	9780131991408	Outlines & Highlights for Art History, Volume Two by Marilyn Stokstad, ISBN: 9780131991408 (Paperback) - Common	https://images.isbndb.com/covers/14/08/9780131991408.jpg	2021	Cram101 Incorporated	{"By (author) Cram101 Textbook Reviews"}	en	3	130	5	5
1285870239	9781285870236	The Human Record: Sources of Global History, Volume I: To 1500	https://images.isbndb.com/covers/02/36/9781285870236.jpg	2015	Cengage Learning	{"Andrea, Alfred J.","Overfield, James H."}	en	8	480	5	5
0312610416	9780312610418	A Pocket Guide to Writing in History	https://images.isbndb.com/covers/04/18/9780312610418.jpg	2012	Bedford/St. Martin s	{"Rampolla, Mary Lynn"}	en	Seventh	176	5	5
1457699915	9781457699917	Ways of the World: A Brief Global History with Sources, Combined Volume	https://images.isbndb.com/covers/99/17/9781457699917.jpg	2015	Bedford/St. Martin s	{"Strayer, Robert W.","Nelson, Eric W."}	en	Third	1216	5	5
0077599586	9780077599584	A History of Europe in the Modern World, Volume 2	https://images.isbndb.com/covers/95/84/9780077599584.jpg	2013	McGraw-Hill Education	{"Palmer, R. R.","Colton, Joel","Kramer, Lloyd"}en	11	688	5	5
9811031835	9789811031830	The History of US-Japan Relations: From Perry to the Present	https://images.isbndb.com/covers/18/30/9789811031830.jpg	2017	Palgrave Macmillan	{}	zh	1st ed. 2017	352	5
032478662X	9780324786620	History of the American Economy, With Infotrac	https://images.isbndb.com/covers/66/20/9780324786620.jpg	2009	South-Western College Pub	{"Walton, Gary M.","Rockoff, Hugh"}	en	11	624	5	5
0076683877	9780076683871	World History And Geography Teacher Edition	https://images.isbndb.com/covers/38/71/9780076683871.jpg	2018	McGraw Hill Education	{"Spielvogel, McTighe"}	en		0	5	5
1111831068	9781111831066	The American Pageant: A History of the American People, AP Edition	https://images.isbndb.com/covers/10/66/9781111831066.jpg	2012	Cengage Learning	{"Kennedy, David M.","Cohen, Lizabeth"}	en	15	1012	5	5
0077379497	9780077379490	American History: Connecting with the Past Volume 2	https://images.isbndb.com/covers/94/90/9780077379490.jpg	2011	McGraw-Hill Education	{"Brinkley, Alan"}	en	14	576	5
0393920348	9780393920345	Give Me Liberty!: An American History (Brief Fourth Edition) (Vol. 2)	https://images.isbndb.com/covers/03/45/9780393920345.jpg	2014	W. W. Norton & Company	{"Foner, Eric"}	en	Brief Fourth	640	5	5
0077780361	9780077780364	US: A Narrative History, Volume 2: Since 1865	https://images.isbndb.com/covers/03/64/9780077780364.jpg	2014	McGraw-Hill Education	{"Davidson, James West","DeLay, Brian","Heyrman, Christine Leigh","Lytle, Mark","Stoff, Michael"}	en	7	432	5	5
039392209x	9780393922097	Worlds Together, Worlds Apart: A History Of The World: From 1000 Ce To The Present (fourth Edition) (vol. 2)	https://images.isbndb.com/covers/20/97/9780393922097.jpg		W. W. Norton & Company (edition Fourth)	{"Robert Tignor","Jeremy Adelman","Peter Brown","Benjamin Elman","Stephen Kotkin","Gyan Prakash","Brent Shaw","Stephen Aron","Xinru Liu","Suzanne Marchand","Holly Pittman","Michael Tsin"}	en	4	0	5	5
144260140x	9781442601406	An Empire Of Regions: A Brief History Of Colonial British America	https://images.isbndb.com/covers/14/06/9781442601406.jpg	2010	University Of Toronto Press, Higher Education Division	{"Eric Nellis"}	en	1	368	5	5
111177157X	9781111771577	Gardner s Art Through the Ages: A Global History: 1	https://images.isbndb.com/covers/15/77/9781111771577.jpg	2012	Cengage Learning	{"Kleiner, Fred S."}	en	14	608	5
111177157x	9781111771577	Gardner s Art Through The Ages: A Global History: 1	https://images.isbndb.com/covers/15/77/9781111771577.jpg	2012	Wadsworth Publishing	{"Fred S. Kleiner"}	en	14	608	5
0740768727	9780740768729	The Annotated Mona Lisa: A Crash Course in Art History from Prehistoric to Post-Modern (Volume 1) (Annotated Series)	https://images.isbndb.com/covers/87/29/9780740768729.jpg	2007	Andrews McMeel Publishing	{"Strickland, Carol"}	en	2	216	5	5
1442601175	9781442601178	Readings in Medieval History, Volume II: The Later Middle Ages, Fourth Edition	https://images.isbndb.com/covers/11/78/9781442601178.jpg	2010	University of Toronto Press, Higher Education Division	{"Geary, Patrick J."}	en	4	496	5	5
0134475887	9780134475882	Art History (6th Edition)	https://images.isbndb.com/covers/58/82/9780134475882.jpg	2017	Pearson	{"Stokstad, Marilyn","Cothren, Michael W."}	en	6	1248	5	5
0060083824	9780060083823	Don t Know Much About History: Everything You Need to Know About American History but Never Learned	https://images.isbndb.com/covers/38/23/9780060083823.jpg	2004	HarperCollins	{"Davis, Kenneth C."}	en	3/14/04	678	5	5
0495913170	9780495913177	Sources of World History, Volume I	https://images.isbndb.com/covers/31/77/9780495913177.jpg	2011	Cengage Learning	{"Kishlansky, Mark A."}	en	5	416	5	5
0195388909	9780195388909	The Cultures of the West, Volume One: To 1750: A History	https://images.isbndb.com/covers/89/09/9780195388909.jpg	2012	Oxford University Press	{"Backman, Clifford R."}	en	672	5	5
019068691X	9780190686918	Ancient Greece: A Political, Social, and Cultural History	https://images.isbndb.com/covers/69/18/9780190686918.jpg	2017	Oxford University Press	{"Pomeroy, Sarah B.","Burstein, Stanley M.","Donlan, Walter","Roberts, Jennifer Tolbert","Tandy, David","Tsouvala, Georgia"}	en	4	608	5
0500289832	9780500289839	Framing America: A Social History of American Art (Third Edition)	https://images.isbndb.com/covers/98/39/9780500289839.jpg	2012	Thames & Hudson	{"Pohl, Frances K."}	en	Third	616	5	5
1442275707	9781442275706	Positioning Your Museum as a Critical Community Asset: A Practical Guide (American Association for State and Local History)	https://images.isbndb.com/covers/57/06/9781442275706.jpg	2016	Rowman & Littlefield Publishers	{}	en		244	5	5
1285194802	9781285194806	Making America: A History of the United States, Volume I: To 1877	https://images.isbndb.com/covers/48/06/9781285194806.jpg	2014	Cengage Learning	{"Berkin, Carol","Miller, Christopher","Cherny, Robert","Gormly, James"}	en	7	496	5	5
155728993x	9781557289933	Arkansas: A Narrative History	https://images.isbndb.com/covers/99/33/9781557289933.jpg	2013	University Of Arkansas Press	{"Jeannie M. Whayne","Thomas A. Deblack","George Sabo Iii"}	en	2	600	5	5
1118403517	9781118403518	History of Interior Design	https://images.isbndb.com/covers/35/18/9781118403518.jpg	2013	Wiley	{"Pile, John","Gura, Judith"}	en	4	496	5	5
1305088816	9781305088818	Voyages in World History, Volume I, Brief	https://images.isbndb.com/covers/88/18/9781305088818.jpg	2015	Cengage Learning	{"Hansen, Valerie","Curtis, Kenneth R."}	en	432	5	5
0140092331	9780140092332	Sweetness and Power: The Place of Sugar in Modern History	https://images.isbndb.com/covers/23/32/9780140092332.jpg	1986	Penguin Books	{"Mintz, Sidney W."}	en	Illustrated	274	5	5
1457690888	9781457690884	A Pocket Guide to Writing in History	https://images.isbndb.com/covers/08/84/9781457690884.jpg	2015	Bedford/St. Martin s	{"Rampolla, Mary Lynn"}	en	Eighth	168	5	5
0393937690	9780393937695	Worlds Together, Worlds Apart: A History of the World: From the Beginnings of Humankind to the Present (Concise High School Edition)	https://images.isbndb.com/covers/76/95/9780393937695.jpg2015	W. W. Norton & Company	{"Pollard, Elizabeth","Rosenberg, Clifford","Tignor, Robert"}	en	Concise High School	984	5	5
0060831448	9780060831448	A Short History of the United States	https://images.isbndb.com/covers/14/48/9780060831448.jpg	2008	Harper	{"Remini, Robert V."}	en	sixth	384	5	5
039361414X	9780393614145	Give Me Liberty!: An American History	https://images.isbndb.com/covers/41/45/9780393614145.jpg	2017	W. W. Norton & Company	{"Foner, Eric"}	en	Brief Fifth	1136	5	5
0814785646	9780814785645	The New Disability History: American Perspectives (The History of Disability, 6)https://images.isbndb.com/covers/56/45/9780814785645.jpg	2001	New York University Press	{}	en	416	5	5
0495915130	9780495915133	Major Problems in American History, Volume I (Major Problems in American History Series)	https://images.isbndb.com/covers/51/33/9780495915133.jpg	2011	Cengage Learning	{"Cobbs, Elizabeth","Blum, Edward J.","Gjerde, Jon"}	en	3	480	5	5
039392291X	9780393922912	Voices of Freedom: A Documentary History (Voices of Freedom (WW Norton))	https://images.isbndb.com/covers/29/12/9780393922912.jpg	2013	W. W. Norton & Company	{"Foner, Eric"}	en	Fourth	352	5	5
0060974680	9780060974688	Europe: A History	https://images.isbndb.com/covers/46/88/9780060974688.jpg1998	Harper Perennial	{"Davies, Norman"}	en		1392	5	5
0393265943	9780393265941	America: A Narrative History (Tenth Edition) (Vol. 1)	https://images.isbndb.com/covers/59/41/9780393265941.jpg	2016	W. W. Norton & Company	{"Shi, David E.","Tindall, George Brown"}	en	Tenth	960	5	5
1305091736	9781305091733	Cengage Advantage Books: World History, Volume II	https://images.isbndb.com/covers/17/33/9781305091733.jpg	2015	Cengage Learning	{"Duiker, William J.","Spielvogel, Jackson J."}	en	8	736	5	5
006050577X	9780060505776	Coming to America: A History of Immigration and Ethnicity in American Life	https://images.isbndb.com/covers/57/76/9780060505776.jpg	2002	Harper Perennial	{"Daniels, Roger"}	en	2nd	576	5	5
\.


--
-- Data for Name: borrowals; Type: TABLE DATA; Schema: public; Owner: phwrexlbpagibu
--

COPY public.borrowals (user_id, book_isbn, date_borrowing, return_date, renewed) FROM stdin;
13572348	0199739919	2021-11-04	2021-12-04	f
13572348	020170353X	2021-10-29	2021-12-29	t
13928229	1593272820	2021-10-13	2021-11-13	f
13928229	0470458364	2021-10-15	2021-11-15	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: phwrexlbpagibu
--

COPY public.users (id, email, firstname, lastname, hash, isadmin) FROM stdin;
13572348	hugo.m.bouderlique@student.uts.edu.au	Hugo	Bouderlique	$2b$10$iN/DkAN26hIi7JcLuHBRP.LoyTTEbBFAWusvsDpVA5ce0gLsjTKbW	f
13582348	test.test@student.uts.edu.au	Test	Test	$2a$10$D0M2g6kTvWnGCqV/bVr0XeBwrWsCyvApCwHr7qSISN.3OPh409mx.	f
12948903	benjamin.colless@student.uts.edu.au	Benjamin	Colless	$2a$10$vwiI9RXi5RTgpyYxqQ/A4OZL1mXsxFG/L1apqenU4WVuu/bE7cvvO	f
1234567890	admin.mcadminson@admin.uts.edu.au	Admin	McAdminson	$2b$10$jOs7VEmcLVSOMbE60752gei7lOEGru78ePF0vqaPOdzc93CGRREXC	t
13928229	srujankarthik.kaukuntla@student.uts.edu.au	Srujan	Kaukuntla	$2a$10$fL95URE/KwqSNTS7Y9l5U.HzrzTaYvZsVuOFzLIgGPYG5XgTzlGLi	f
13602406	molly.revoltar@student.uts.edu.au	Molly	Revoltar	$2b$10$Cfp4SAM/20IIRraOiGlHC.Yo9bgl/WUKGVlvJyCSYem07v2soIbFW	f
\.


--
-- Name: borrowals borrowals_pkey; Type: CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.borrowals
    ADD CONSTRAINT borrowals_pkey PRIMARY KEY (user_id, book_isbn);


--
-- Name: users unique_id; Type: CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_id PRIMARY KEY (id);


--
-- Name: books unique_isbn; Type: CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT unique_isbn PRIMARY KEY (isbn);


--
-- Name: book_requests unique_request_isbn; Type: CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.book_requests
    ADD CONSTRAINT unique_request_isbn PRIMARY KEY (isbn);


--
-- Name: borrowals borrowals_book_isbn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.borrowals
    ADD CONSTRAINT borrowals_book_isbn_fkey FOREIGN KEY (book_isbn) REFERENCES public.books(isbn);


--
-- Name: borrowals borrowals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phwrexlbpagibu
--

ALTER TABLE ONLY public.borrowals
    ADD CONSTRAINT borrowals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: phwrexlbpagibu
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO phwrexlbpagibu;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO phwrexlbpagibu;


--
-- PostgreSQL database dump complete
--
