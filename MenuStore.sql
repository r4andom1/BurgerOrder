PGDMP                      |        	   MenuStore    16.4    16.4 /    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            E           1262    16398 	   MenuStore    DATABASE     m   CREATE DATABASE "MenuStore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "MenuStore";
                postgres    false            �            1259    16458 
   menu_items    TABLE     b   CREATE TABLE public.menu_items (
    product_id integer NOT NULL,
    menu_id integer NOT NULL
);
    DROP TABLE public.menu_items;
       public         heap    postgres    false            �            1259    16425    menus    TABLE     �   CREATE TABLE public.menus (
    menu_id integer NOT NULL,
    name character varying(30),
    description text,
    price numeric(3,2)
);
    DROP TABLE public.menus;
       public         heap    postgres    false            �            1259    16428    menus_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menus_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.menus_menu_id_seq;
       public          postgres    false    219            F           0    0    menus_menu_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.menus_menu_id_seq OWNED BY public.menus.menu_id;
          public          postgres    false    220            �            1259    16455    product_toppings    TABLE     k   CREATE TABLE public.product_toppings (
    product_id integer NOT NULL,
    topping_id integer NOT NULL
);
 $   DROP TABLE public.product_toppings;
       public         heap    postgres    false            �            1259    16400    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_type integer,
    name character varying(100),
    description text,
    price numeric(3,2),
    quantity integer,
    quantity_unit integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16399    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    216            G           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    215            �            1259    16462    ref_product_quantities    TABLE     �   CREATE TABLE public.ref_product_quantities (
    quantity_unit integer NOT NULL,
    description character varying(100) NOT NULL
);
 *   DROP TABLE public.ref_product_quantities;
       public         heap    postgres    false            �            1259    16409    ref_product_type    TABLE     e   CREATE TABLE public.ref_product_type (
    product_type_id integer NOT NULL,
    description text
);
 $   DROP TABLE public.ref_product_type;
       public         heap    postgres    false            �            1259    16408 #   ref_produt_type_product_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ref_produt_type_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.ref_produt_type_product_type_id_seq;
       public          postgres    false    218            H           0    0 #   ref_produt_type_product_type_id_seq    SEQUENCE OWNED BY     l   ALTER SEQUENCE public.ref_produt_type_product_type_id_seq OWNED BY public.ref_product_type.product_type_id;
          public          postgres    false    217            �            1259    16447    ref_topping_type    TABLE     e   CREATE TABLE public.ref_topping_type (
    topping_type_id integer NOT NULL,
    description text
);
 $   DROP TABLE public.ref_topping_type;
       public         heap    postgres    false            �            1259    16446 $   ref_topping_type_topping_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ref_topping_type_topping_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.ref_topping_type_topping_type_id_seq;
       public          postgres    false    224            I           0    0 $   ref_topping_type_topping_type_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.ref_topping_type_topping_type_id_seq OWNED BY public.ref_topping_type.topping_type_id;
          public          postgres    false    223            �            1259    16438    toppings    TABLE     �   CREATE TABLE public.toppings (
    topping_id integer NOT NULL,
    name character varying(50),
    description text,
    price numeric(3,2),
    topping_type integer
);
    DROP TABLE public.toppings;
       public         heap    postgres    false            �            1259    16437    toppings_topping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.toppings_topping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.toppings_topping_id_seq;
       public          postgres    false    222            J           0    0    toppings_topping_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.toppings_topping_id_seq OWNED BY public.toppings.topping_id;
          public          postgres    false    221            �           2604    16429    menus menu_id    DEFAULT     n   ALTER TABLE ONLY public.menus ALTER COLUMN menu_id SET DEFAULT nextval('public.menus_menu_id_seq'::regclass);
 <   ALTER TABLE public.menus ALTER COLUMN menu_id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16403    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16412     ref_product_type product_type_id    DEFAULT     �   ALTER TABLE ONLY public.ref_product_type ALTER COLUMN product_type_id SET DEFAULT nextval('public.ref_produt_type_product_type_id_seq'::regclass);
 O   ALTER TABLE public.ref_product_type ALTER COLUMN product_type_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16450     ref_topping_type topping_type_id    DEFAULT     �   ALTER TABLE ONLY public.ref_topping_type ALTER COLUMN topping_type_id SET DEFAULT nextval('public.ref_topping_type_topping_type_id_seq'::regclass);
 O   ALTER TABLE public.ref_topping_type ALTER COLUMN topping_type_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16441    toppings topping_id    DEFAULT     z   ALTER TABLE ONLY public.toppings ALTER COLUMN topping_id SET DEFAULT nextval('public.toppings_topping_id_seq'::regclass);
 B   ALTER TABLE public.toppings ALTER COLUMN topping_id DROP DEFAULT;
       public          postgres    false    222    221    222            >          0    16458 
   menu_items 
   TABLE DATA           9   COPY public.menu_items (product_id, menu_id) FROM stdin;
    public          postgres    false    226   !4       7          0    16425    menus 
   TABLE DATA           B   COPY public.menus (menu_id, name, description, price) FROM stdin;
    public          postgres    false    219   �4       =          0    16455    product_toppings 
   TABLE DATA           B   COPY public.product_toppings (product_id, topping_id) FROM stdin;
    public          postgres    false    225   B6       4          0    16400    products 
   TABLE DATA           o   COPY public.products (product_id, product_type, name, description, price, quantity, quantity_unit) FROM stdin;
    public          postgres    false    216   �6       ?          0    16462    ref_product_quantities 
   TABLE DATA           L   COPY public.ref_product_quantities (quantity_unit, description) FROM stdin;
    public          postgres    false    227   �;       6          0    16409    ref_product_type 
   TABLE DATA           H   COPY public.ref_product_type (product_type_id, description) FROM stdin;
    public          postgres    false    218   �;       <          0    16447    ref_topping_type 
   TABLE DATA           H   COPY public.ref_topping_type (topping_type_id, description) FROM stdin;
    public          postgres    false    224   <       :          0    16438    toppings 
   TABLE DATA           V   COPY public.toppings (topping_id, name, description, price, topping_type) FROM stdin;
    public          postgres    false    222   N<       K           0    0    menus_menu_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.menus_menu_id_seq', 12, true);
          public          postgres    false    220            L           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 71, true);
          public          postgres    false    215            M           0    0 #   ref_produt_type_product_type_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.ref_produt_type_product_type_id_seq', 4, true);
          public          postgres    false    217            N           0    0 $   ref_topping_type_topping_type_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.ref_topping_type_topping_type_id_seq', 4, true);
          public          postgres    false    223            O           0    0    toppings_topping_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.toppings_topping_id_seq', 30, true);
          public          postgres    false    221            �           2606    16436    menus menus_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (menu_id);
 :   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_pkey;
       public            postgres    false    219            �           2606    16407    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    216            �           2606    16418 &   ref_product_type ref_product_type_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.ref_product_type
    ADD CONSTRAINT ref_product_type_pkey PRIMARY KEY (product_type_id);
 P   ALTER TABLE ONLY public.ref_product_type DROP CONSTRAINT ref_product_type_pkey;
       public            postgres    false    218            �           2606    16454 &   ref_topping_type ref_topping_type_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.ref_topping_type
    ADD CONSTRAINT ref_topping_type_pkey PRIMARY KEY (topping_type_id);
 P   ALTER TABLE ONLY public.ref_topping_type DROP CONSTRAINT ref_topping_type_pkey;
       public            postgres    false    224            �           2606    16445    toppings toppings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_pkey PRIMARY KEY (topping_id);
 @   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_pkey;
       public            postgres    false    222            �           1259    16424    fki_o    INDEX     B   CREATE INDEX fki_o ON public.products USING btree (product_type);
    DROP INDEX public.fki_o;
       public            postgres    false    216            �           2606    16419    products product_type_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_type_fkey FOREIGN KEY (product_type) REFERENCES public.ref_product_type(product_type_id) NOT VALID;
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT product_type_fkey;
       public          postgres    false    218    3484    216            >   |   x�E��C1D�5c����_G�:R��h#!������T�+`16`LK�}��ՠRb[QU���4���[M�:���d�~��=�P��	ây���*�cb%�͢��|�o�>w���$      7   �  x�eRKO1>�_1^<�F(�h��/�����.ݴ]��0�Ҵ3�c���`��� ��Td`��L�g!�U�$���1J���P<g�n[f�Hu?$V�A����D�u�K�=0��Ĳcm���s�����̽sĎĺ�EMk�obM)�I�>{4T@�3���PEҽ8��
]gP��6$���r[�dyS#m{�^w����%����WGƣxW�ud���qi��P��:D�'��u����Ņ {�j��.�ʂld�E��9<?C�D�;#�"��#L��{p+�R������B��Z�C��L�H�{�K2b��o���F��h}���Aw���'(�Z(Ρut*e(-uy����t��#/��5��u�����z�_�C��      =   �   x�-��1�R1�J닽��:�1��Ȧ`�3+d����7;��_��=��o�%�9�N�#6s��`u���V]<���w�/� ����;�l� W�N��-�)�ɶ�E���D���������k#�      4   �  x��V�r�6]C_q��*a%R���Ǐ(I��ky&�n`��Q��﹠$��L�xÑ�{����DLč�MPN�e�Vʉj�[�"��v���LTCK��G�D�&����4���˥R���bM�Ѧ�A��R3�����h�}��	�\���ȏڬiQɵe�`���:U뮦�1�t��ĝ��F�N��"�$�9�e�� }P����_s0M�3�E�)�dJ���@�jUj[8E��#+g�}���V�U�D7
 8WD㏜J�xg]U��F�ĵ�nۓ\�C�������B�N�E�s�y��c��9���������@��� gGB��s���J<P�G�Hc<�1�@�a����¾��t�"|�����k4�n�R��/���0D]5��]��{*mh��������*�'P�M�b��8Y��t�Z��-FI�������U�6�H"8�R�߂�ȷ�]D�����@��2[v��9�O��1cNY�vk.�J~�����������n�����+z�"8�yg��Qe�P�����Q����1����"Y)Y�9A��R�-Z]la�Qہ����g�$����*r�g����H�AOk�DlK~���l�gk7�H�[��x�X�t��<��O_��pMƬ }�ׁl>yF6�W��}Q`C��ʿ@5����C]����_�B�Q����@L8��݌�����XY߶���AQ�\���}�*��>�? f��E�/. �q*}ܷK�[I(&���>O)�8��ύ��F��Ϋ����lJ[�=g����OXr�s&`W~1d�e�Ȝ*K�w��.��E�ZO�>�zQK_�����1Z��D��"���-di�:N�h�D "�����v����
<�3;"xεQ����s�%��:乯/�*�%��V��uT���0�XE%��n���*b�I��+���=��>��H�E�3���=ݣ1��48y�y�)���<�3ʣ*P4�d�4���r�	? &{?�����-:���7��Q+�K�^��X�q�$��ަ[J8a�W�X]")'�o}[c���d�����Ξ���o��qWb���"�!`�|L+���6��Y�r�tk������4���D��x���a?}����y��[�<�"��B˸�H}o�����Ȑ�6d�x*�PT���{��G�v��Ř����ّ���My���IF����      ?   #   x�3�,�LMN-�2�L��2�L/J�-����� h��      6   %   x�3�L*-JO-�2�L)����2�,�LI����� ��      <   .   x�3�t*JML�2��MM,�2��/(��K�2�N,MN����� �2	�      :   /  x�]TK��6]C���.[����;ՓL��:��L*��$�)R�O;�[��X��dW6�x����p�҈�dZϸn�9x�vb/��W�O
��"oְ]6��jx3�{���E����6��E��~�6�Tt����
�1����\wS*��z�&F�.ssb?��̋yÝ�g+ݘ��Q��ٚ�f�Ik�כX� _T�[��#���ǺZ�W���^~bױ�=[�����hq�a`�5!jF!6r�5�Fu� /����멟�J�HcYk%�h)Jt�#����Gx��@_��"�(r$�v	RG��)����޶��'6^3f���H]m7p���YG7�J:�3漕�+C�U�-�æ�N=����|��a�ޤ�N#I5�gl�g.?���VBƐ�-3Z�W��ԇ���I�n��kE#���R�R`ϊ;'�sDϦ�X��^�-��  y������.qDqvW�=��8�%7;����@���`F�6mA���p�*.S,��>d- ����]?��h��#3e�L�hhH��ҕ�z���nINT��{@r:���c�I���>���Y0V�b�|X�.�k����8��0a�8�G`_�;��h��kp��f�8��4�8t�ބ>�9��E�=����-����&�� q� K���O��<���Ʉ�ꆪ8�u\2%� R�@�P8�w�8�T�6���.L�܍Br�7��r��G%X����Uz*K��6t�#|%���?���hͥ�"~:�7�%/o�L�	^��oiXi���L%^��I����٢����q[������?����     