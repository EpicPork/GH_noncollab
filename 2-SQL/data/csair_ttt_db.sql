PGDMP         1            	    {           csair    15.4 (Homebrew)    15.4 +    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    16388    csair    DATABASE     g   CREATE DATABASE csair WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE csair;
                csair    false            �            1259    16401    games    TABLE     �   CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    board_size integer NOT NULL,
    outcome character varying(10)
);
    DROP TABLE public.games;
       public         heap    csair    false            �            1259    16400    games_game_id_seq    SEQUENCE     �   CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.games_game_id_seq;
       public          csair    false    215            R           0    0    games_game_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;
          public          csair    false    214            �            1259    16424    leaderboard    TABLE     _   CREATE TABLE public.leaderboard (
    user_id integer,
    wins integer,
    losses integer
);
    DROP TABLE public.leaderboard;
       public         heap    csair    false            �            1259    16413    moves    TABLE     �   CREATE TABLE public.moves (
    move_id integer NOT NULL,
    game_id integer,
    player character varying(10),
    position_x integer,
    position_y integer
);
    DROP TABLE public.moves;
       public         heap    csair    false            �            1259    16412    moves_move_id_seq    SEQUENCE     �   CREATE SEQUENCE public.moves_move_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.moves_move_id_seq;
       public          csair    false    217            S           0    0    moves_move_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.moves_move_id_seq OWNED BY public.moves.move_id;
          public          csair    false    216            �            1259    16467    player    TABLE     �   CREATE TABLE public.player (
    player_id integer NOT NULL,
    user_id integer,
    player_name character varying(255) NOT NULL,
    player_symbol character(1) NOT NULL
);
    DROP TABLE public.player;
       public         heap    csair    false            �            1259    16466    player_player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.player_player_id_seq;
       public          csair    false    224            T           0    0    player_player_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;
          public          csair    false    223            �            1259    16432    playerstats    TABLE     k   CREATE TABLE public.playerstats (
    user_id integer,
    total_wins integer,
    total_losses integer
);
    DROP TABLE public.playerstats;
       public         heap    csair    false            �            1259    16440    trainingdata    TABLE     �   CREATE TABLE public.trainingdata (
    game_id integer,
    player character varying(10),
    position_x integer,
    position_y integer
);
     DROP TABLE public.trainingdata;
       public         heap    csair    false            �            1259    16456    useraccount    TABLE     �   CREATE TABLE public.useraccount (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public.useraccount;
       public         heap    csair    false            �            1259    16455    useraccount_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.useraccount_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.useraccount_user_id_seq;
       public          csair    false    222            U           0    0    useraccount_user_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.useraccount_user_id_seq OWNED BY public.useraccount.user_id;
          public          csair    false    221            �           2604    16404    games game_id    DEFAULT     n   ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);
 <   ALTER TABLE public.games ALTER COLUMN game_id DROP DEFAULT;
       public          csair    false    214    215    215            �           2604    16416    moves move_id    DEFAULT     n   ALTER TABLE ONLY public.moves ALTER COLUMN move_id SET DEFAULT nextval('public.moves_move_id_seq'::regclass);
 <   ALTER TABLE public.moves ALTER COLUMN move_id DROP DEFAULT;
       public          csair    false    217    216    217            �           2604    16470    player player_id    DEFAULT     t   ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);
 ?   ALTER TABLE public.player ALTER COLUMN player_id DROP DEFAULT;
       public          csair    false    224    223    224            �           2604    16459    useraccount user_id    DEFAULT     z   ALTER TABLE ONLY public.useraccount ALTER COLUMN user_id SET DEFAULT nextval('public.useraccount_user_id_seq'::regclass);
 B   ALTER TABLE public.useraccount ALTER COLUMN user_id DROP DEFAULT;
       public          csair    false    222    221    222            B          0    16401    games 
   TABLE DATA           F   COPY public.games (game_id, user_id, board_size, outcome) FROM stdin;
    public          csair    false    215   z.       E          0    16424    leaderboard 
   TABLE DATA           <   COPY public.leaderboard (user_id, wins, losses) FROM stdin;
    public          csair    false    218   �.       D          0    16413    moves 
   TABLE DATA           Q   COPY public.moves (move_id, game_id, player, position_x, position_y) FROM stdin;
    public          csair    false    217   �.       K          0    16467    player 
   TABLE DATA           P   COPY public.player (player_id, user_id, player_name, player_symbol) FROM stdin;
    public          csair    false    224   �.       F          0    16432    playerstats 
   TABLE DATA           H   COPY public.playerstats (user_id, total_wins, total_losses) FROM stdin;
    public          csair    false    219   �.       G          0    16440    trainingdata 
   TABLE DATA           O   COPY public.trainingdata (game_id, player, position_x, position_y) FROM stdin;
    public          csair    false    220   /       I          0    16456    useraccount 
   TABLE DATA           I   COPY public.useraccount (user_id, username, password, email) FROM stdin;
    public          csair    false    222   (/       V           0    0    games_game_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);
          public          csair    false    214            W           0    0    moves_move_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.moves_move_id_seq', 1, false);
          public          csair    false    216            X           0    0    player_player_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.player_player_id_seq', 1, false);
          public          csair    false    223            Y           0    0    useraccount_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.useraccount_user_id_seq', 1, false);
          public          csair    false    221            �           2606    16406    games games_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
 :   ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
       public            csair    false    215            �           2606    16418    moves moves_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (move_id);
 :   ALTER TABLE ONLY public.moves DROP CONSTRAINT moves_pkey;
       public            csair    false    217            �           2606    16472    player player_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            csair    false    224            �           2606    16465 !   useraccount useraccount_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.useraccount
    ADD CONSTRAINT useraccount_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.useraccount DROP CONSTRAINT useraccount_email_key;
       public            csair    false    222            �           2606    16461    useraccount useraccount_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.useraccount
    ADD CONSTRAINT useraccount_pkey PRIMARY KEY (user_id);
 F   ALTER TABLE ONLY public.useraccount DROP CONSTRAINT useraccount_pkey;
       public            csair    false    222            �           2606    16463 $   useraccount useraccount_username_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.useraccount
    ADD CONSTRAINT useraccount_username_key UNIQUE (username);
 N   ALTER TABLE ONLY public.useraccount DROP CONSTRAINT useraccount_username_key;
       public            csair    false    222            �           2606    16419    moves moves_game_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(game_id);
 B   ALTER TABLE ONLY public.moves DROP CONSTRAINT moves_game_id_fkey;
       public          csair    false    215    217    3493            �           2606    16473    player player_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.useraccount(user_id);
 D   ALTER TABLE ONLY public.player DROP CONSTRAINT player_user_id_fkey;
       public          csair    false    222    224    3499            �           2606    16443 &   trainingdata trainingdata_game_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trainingdata
    ADD CONSTRAINT trainingdata_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(game_id);
 P   ALTER TABLE ONLY public.trainingdata DROP CONSTRAINT trainingdata_game_id_fkey;
       public          csair    false    220    3493    215            B      x������ � �      E      x������ � �      D      x������ � �      K      x������ � �      F      x������ � �      G      x������ � �      I      x������ � �     