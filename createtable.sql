-- Database: testing


       
CREATE TABLE public.user_details
(
	  user_id integer NOT NULL,
	  username character varying(255) DEFAULT NULL::character varying,
	  first_name character varying(50) DEFAULT NULL::character varying,
	  last_name character varying(50) DEFAULT NULL::character varying,
	  gender character varying(10) DEFAULT NULL::character varying,
	  password character varying(50) DEFAULT NULL::character varying,
	  status smallint,
	  CONSTRAINT user_details_pkey PRIMARY KEY (user_id)
)
WITH (
	  OIDS=FALSE
);
ALTER TABLE public.user_details
  OWNER TO postgres;

