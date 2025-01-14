/***** "other" codes not abbreviated *****/ 

/*
   remember that "the" is stripped in kountry.ado and you have to do the same here
   for example replace NAMES_STD = "Netherlands" if NAMES_STD == "nerlands"
                                                                  --------
   a better way, though, is to use -kountryadd-
*/  

program k_other
version 8.2

replace NAMES_STD = "Afghanistan" if NAMES_STD == "afghanistan" | NAMES_STD == "afghan" | NAMES_STD == "afganistan"
replace NAMES_STD = "Albania" if NAMES_STD == "albania"
replace NAMES_STD = "Algeria" if NAMES_STD == "algeria"
replace NAMES_STD = "American Samoa" if NAMES_STD == "american samoa" | NAMES_STD == "eastern samoa" | NAMES_STD == "samoa american"
replace NAMES_STD = "Andorra" if NAMES_STD == "andorra"
replace NAMES_STD = "Angola" if NAMES_STD == "angola"
replace NAMES_STD = "Anguilla" if NAMES_STD == "anguilla"
replace NAMES_STD = "Antigua and Barbuda" if NAMES_STD == "antigua and barbuda" | NAMES_STD == "antigua barbuda" | NAMES_STD == "antigua barbuda"
replace NAMES_STD = "Argentina" if NAMES_STD == "argentina" | NAMES_STD == "argent"
replace NAMES_STD = "Armenia" if NAMES_STD == "armenia"
replace NAMES_STD = "Aruba" if NAMES_STD == "aruba"
replace NAMES_STD = "Australia" if NAMES_STD == "australia" | NAMES_STD == "austral"
replace NAMES_STD = "Austria" if NAMES_STD == "austria"
replace NAMES_STD = "Austria-Hungary" if NAMES_STD == "austriahungary"
replace NAMES_STD = "Azerbaijan" if NAMES_STD == "azerbaijan"
replace NAMES_STD = "Azores" if NAMES_STD == "azores"
replace NAMES_STD = "Baden" if NAMES_STD == "baden"
replace NAMES_STD = "Bahamas" if NAMES_STD == "bahamas"
replace NAMES_STD = "Bahrain" if NAMES_STD == "bahrain"
replace NAMES_STD = "Bangladesh" if NAMES_STD == "bangladesh" | NAMES_STD == "bngldsh"
replace NAMES_STD = "Barbados" if NAMES_STD == "barbados" | NAMES_STD == "barbado"
replace NAMES_STD = "Bavaria" if NAMES_STD == "bavaria"
replace NAMES_STD = "Belarus" if NAMES_STD == "belarus" | NAMES_STD == "byelorussia" | NAMES_STD == "belarus byelorussia"
replace NAMES_STD = "Belgium" if NAMES_STD == "belgium"
replace NAMES_STD = "Belgium-Luxembourg" if NAMES_STD == "belgiumluxembourg" | NAMES_STD == "bel_lux"
replace NAMES_STD = "Belize" if NAMES_STD == "belize"
replace NAMES_STD = "Benin" if NAMES_STD == "benin" | NAMES_STD == "dahomey" | NAMES_STD == "benin/dahomey" | NAMES_STD == "benin dahomey"
replace NAMES_STD = "Bermuda" if NAMES_STD == "bermuda"
replace NAMES_STD = "Bhutan" if NAMES_STD == "bhutan"
replace NAMES_STD = "Bolivia" if NAMES_STD == "bolivia"
replace NAMES_STD = "Bonaire" if NAMES_STD == "bonaire"
replace NAMES_STD = "Bosnia and Herzegovina" if NAMES_STD == "bosnia and herzegovina" | NAMES_STD == "bosnia herzegovina" | NAMES_STD == "bosnia/herzogovina" | NAMES_STD == "bosnia" | NAMES_STD == "bosnia/herzegovina" | NAMES_STD == "bosnia and hercegovina" | NAMES_STD == "bosnia hercegovina" | NAMES_STD == "bosnia/hercogovina" | NAMES_STD == "bosnia hercegovina" | NAMES_STD == "bosnia/hercegovina" | NAMES_STD == "bosniahercegovina" | NAMES_STD == "bosniaherzegovina" | NAMES_STD == "bosniaherzegov" | NAMES_STD == "bosniahercegov" | NAMES_STD == "bosnia herzegov" | NAMES_STD == "bosnia hercegov" | NAMES_STD == "bosniaher" 
replace NAMES_STD = "Botswana" if NAMES_STD == "botswana"
replace NAMES_STD = "Brazil" if NAMES_STD == "brazil"
replace NAMES_STD = "Brunei" if NAMES_STD == "brunei" | NAMES_STD == "brunei darussalam"
replace NAMES_STD = "Bulgaria" if NAMES_STD == "bulgaria"
replace NAMES_STD = "Burkina Faso" if NAMES_STD == "burkina faso" | NAMES_STD == "upper volta" | NAMES_STD == "burkina faso upper volta" | NAMES_STD == "upp" | NAMES_STD == "hvo" | NAMES_STD == "burkina"
replace NAMES_STD = "Burundi" if NAMES_STD == "burundi"
replace NAMES_STD = "Cambodia" if NAMES_STD == "cambodia" | NAMES_STD == "kampuchea" | NAMES_STD == "cambodia kampuchea" | NAMES_STD == "cambod" | NAMES_STD == "democratic kampuchea"
replace NAMES_STD = "Cameroon" if NAMES_STD == "cameroon" | NAMES_STD == "cameroun"
replace NAMES_STD = "Canada" if NAMES_STD == "canada"
replace NAMES_STD = "Canary Islands" if NAMES_STD == "canary islands"
replace NAMES_STD = "Cape Verde" if NAMES_STD == "cape verde"
replace NAMES_STD = "Cayman Islands" if NAMES_STD == "cayman islands" | NAMES_STD == "cayman is"
replace NAMES_STD = "Central African Republic" if NAMES_STD == "central african republic" | NAMES_STD == "c african rep" | NAMES_STD == "central african empire" | NAMES_STD == "c_africa" | NAMES_STD == "cen african rep"
replace NAMES_STD = "Chad" if NAMES_STD == "chad"
replace NAMES_STD = "Channel Islands" if NAMES_STD == "channel islands"
replace NAMES_STD = "Chile" if NAMES_STD == "chile"
replace NAMES_STD = "China" if NAMES_STD == "china" | NAMES_STD == "china mainland"
replace NAMES_STD = "Christmas Islands" if NAMES_STD == "christmas islands" | NAMES_STD == "christmas is" | NAMES_STD == "christmas island"
replace NAMES_STD = "Cocos Islands" if NAMES_STD == "cocos islands" | NAMES_STD == "cocos keeling islands" | NAMES_STD == "cocos is"
replace NAMES_STD = "Colombia" if NAMES_STD == "colombia"
replace NAMES_STD = "Comoros" if NAMES_STD == "comoros"
replace NAMES_STD = "Democratic Republic of Congo" if NAMES_STD == "democratic republic of congo" | NAMES_STD == "dem rep congo" | NAMES_STD == "congo dem r" | NAMES_STD == "zaire congo kinshasa" | NAMES_STD == "congo dr zaire" | NAMES_STD == "congo dem rep" | NAMES_STD == "zaire/dem rep of congo" | NAMES_STD == "congo droc" | NAMES_STD == "congo kinshasa" | NAMES_STD == "zaire" | NAMES_STD == "zaire democratic republic of congo" | NAMES_STD == "congo democratic republic of" | NAMES_STD == "congo democratic rep of"
replace NAMES_STD = "Congo" if NAMES_STD == "congo" | NAMES_STD == "rep of congo" | NAMES_STD == "congo rep of" | NAMES_STD == "congo brazaville" | NAMES_STD == "congo brazzaville" | NAMES_STD == "congo rep" | NAMES_STD == "congo brazzaville" | NAMES_STD == "congo brazaville" | NAMES_STD == "congo brazaville" | NAMES_STD == "congo brazzaville" | NAMES_STD == "congo republic of"  | NAMES_STD == "congo roc"
replace NAMES_STD = "Cook Islands" if NAMES_STD == "cook islands" | NAMES_STD == "cook is"
replace NAMES_STD = "Costa Rica" if NAMES_STD == "costa rica" | NAMES_STD == "costarica" | NAMES_STD == "cos_rica"
replace NAMES_STD = "Croatia" if NAMES_STD == "croatia"
replace NAMES_STD = "Cuba" if NAMES_STD == "cuba"
replace NAMES_STD = "Curacao" if NAMES_STD == "curacao"
replace NAMES_STD = "Cyprus" if NAMES_STD == "cyprus"
replace NAMES_STD = "Czech Republic" if NAMES_STD == "czech republic" | NAMES_STD == "czechrep" | NAMES_STD == "czech rep" | NAMES_STD == "czech republic "
replace NAMES_STD = "Czechoslovakia" if NAMES_STD == "czechoslovakia" | NAMES_STD == "czechoslovakia former" | NAMES_STD == "czecho"
replace NAMES_STD = "Denmark" if NAMES_STD == "denmark"
replace NAMES_STD = "Djibouti" if NAMES_STD == "djibouti"
replace NAMES_STD = "Dominica" if NAMES_STD == "dominica" | NAMES_STD == "dominica is"
replace NAMES_STD = "Dominican Republic" if NAMES_STD == "dominican republic" | NAMES_STD == "dominican rep" | NAMES_STD == "dom_rep"
replace NAMES_STD = "Easter Island" if NAMES_STD == "easter island"
replace NAMES_STD = "Ecuador" if NAMES_STD == "ecuador"
replace NAMES_STD = "Egypt" if NAMES_STD == "egypt" | NAMES_STD == "uar" | NAMES_STD == "egypt/uar" | NAMES_STD == "egypt uar" | NAMES_STD == "united arab republic" | NAMES_STD == "egypt arab rep"
replace NAMES_STD = "El Salvador" if NAMES_STD == "el salvador" | NAMES_STD == "salvador" | NAMES_STD == "salvadr"
replace NAMES_STD = "Equatorial Guinea" if NAMES_STD == "equatorial guinea" | NAMES_STD == "eq_gnea" | NAMES_STD == "guinea equatorial" | NAMES_STD == "eq guinea"
replace NAMES_STD = "Eritrea" if NAMES_STD == "eritrea"
replace NAMES_STD = "Estonia" if NAMES_STD == "estonia"
replace NAMES_STD = "Ethiopia" if NAMES_STD == "ethiopia" | NAMES_STD == "ethiopia 8993"
replace NAMES_STD = "European Union" if NAMES_STD == "european union" | NAMES_STD == "eu" | NAMES_STD == "european community"
replace NAMES_STD = "Faeroe Islands" if NAMES_STD == "faeroe islands" | NAMES_STD == "faroe islands" | NAMES_STD == "faeroe is" | NAMES_STD == "faroe is"
replace NAMES_STD = "Falkland Islands" if NAMES_STD == "falkland islands" | NAMES_STD == "falkland islands malvinas" | NAMES_STD == "malvinas" | NAMES_STD == "falkland is" | NAMES_STD == "falk_is"
replace NAMES_STD = "Fiji" if NAMES_STD == "fiji"
replace NAMES_STD = "Finland" if NAMES_STD == "finland"
replace NAMES_STD = "France" if NAMES_STD == "france"
replace NAMES_STD = "French Polynesia" if NAMES_STD == "french polynesia" | NAMES_STD == "fr polynesia"
replace NAMES_STD = "Gabon" if NAMES_STD == "gabon"
replace NAMES_STD = "Gambia" if NAMES_STD == "gambia"
replace NAMES_STD = "Georgia" if NAMES_STD == "georgia"
replace NAMES_STD = "German Democratic Republic" if NAMES_STD == "german democratic republic" | NAMES_STD == "east germany" | NAMES_STD == "german democratic rep" | NAMES_STD == "german democratic republic former" | NAMES_STD == "germany dr" | NAMES_STD == "german_e" | NAMES_STD == "germany east"
replace NAMES_STD = "Germany" if NAMES_STD == "germany"	| NAMES_STD == "prussia" | NAMES_STD == "germany/prussia" | NAMES_STD == "german federal republic" | NAMES_STD == "west germany" | NAMES_STD == "germany federal republic of" | NAMES_STD == "federal republic of germany" | NAMES_STD == "german" | NAMES_STD == "germany west"
replace NAMES_STD = "Ghana" if NAMES_STD == "ghana"
replace NAMES_STD = "Gibraltar" if NAMES_STD == "gibraltar" | NAMES_STD == "gilbraltar" | NAMES_STD == "gilbralt"
replace NAMES_STD = "Greece" if NAMES_STD == "greece"
replace NAMES_STD = "Greenland" if NAMES_STD == "greenland" | NAMES_STD == "greenld"
replace NAMES_STD = "Grenada" if NAMES_STD == "grenada" | NAMES_STD == "grenada is"
replace NAMES_STD = "Guadeloupe" if NAMES_STD == "guadeloupe" | NAMES_STD == "guadlpe"
replace NAMES_STD = "Guam" if NAMES_STD == "guam"
replace NAMES_STD = "Guatemala" if NAMES_STD == "guatemala" | NAMES_STD == "guatmala"
replace NAMES_STD = "Guinea" if NAMES_STD == "guinea"
replace NAMES_STD = "Guinea-Bissau" if NAMES_STD == "guineabissau" | NAMES_STD == "guinea bissau" | NAMES_STD == "g bissau" | NAMES_STD == "g_bissau" | NAMES_STD == "g_bisau"
replace NAMES_STD = "Guyana" if NAMES_STD == "guyana"
replace NAMES_STD = "French Guiana" if NAMES_STD == "french guiana" | NAMES_STD == "guiana" | NAMES_STD == "guyana french" | NAMES_STD == "fr_guian" | NAMES_STD == "guiana french"
replace NAMES_STD = "Haiti" if NAMES_STD == "haiti"
replace NAMES_STD = "Hanover" if NAMES_STD == "hanover"
replace NAMES_STD = "Hesse Electoral" if NAMES_STD == "hesse electoral"
replace NAMES_STD = "Hesse Grand Ducal" if NAMES_STD == "hesse grand ducal"
replace NAMES_STD = "Honduras" if NAMES_STD == "honduras" | NAMES_STD == "hondura"
replace NAMES_STD = "Hong Kong" if NAMES_STD == "hong kong" | NAMES_STD == "china hong kong special administrative region" | NAMES_STD == "hongkong" | NAMES_STD == "hong kong special administrative region of china" | NAMES_STD == "hong kong china"
replace NAMES_STD = "Hungary" if NAMES_STD == "hungary"
replace NAMES_STD = "Iceland" if NAMES_STD == "iceland"
replace NAMES_STD = "India" if NAMES_STD == "india"
replace NAMES_STD = "Indonesia" if NAMES_STD == "indonesia" | NAMES_STD == "indones"
replace NAMES_STD = "Iran" if NAMES_STD == "iran" | NAMES_STD == "persia" | NAMES_STD == "iran persia" | NAMES_STD == "iran islamic republic of" | NAMES_STD == "iran islamic republic of" | NAMES_STD == "iran islamic rep"
replace NAMES_STD = "Iraq" if NAMES_STD == "iraq"
replace NAMES_STD = "Ireland" if NAMES_STD == "ireland" | NAMES_STD == "eire"
replace NAMES_STD = "Israel" if NAMES_STD == "israel" | NAMES_STD == "israel 1989"
replace NAMES_STD = "Italy" if NAMES_STD == "italy" | NAMES_STD == "italy/sardinia"
replace NAMES_STD = "Cote d'Ivoire" if NAMES_STD == "cote d'ivoire" | NAMES_STD == "ivory coast" | NAMES_STD == "ivy_cst" | NAMES_STD == "c�te d'ivoire" | NAMES_STD == "cote d`ivoire"
replace NAMES_STD = "Jamaica" if NAMES_STD == "jamaica"
replace NAMES_STD = "Japan" if NAMES_STD == "japan"
replace NAMES_STD = "Jordan" if NAMES_STD == "jordan" | NAMES_STD == "jordon"
replace NAMES_STD = "Kazakhstan" if NAMES_STD == "kazakhstan" | NAMES_STD == "kazakstan"
replace NAMES_STD = "Kenya" if NAMES_STD == "kenya"
replace NAMES_STD = "Kyrgyz Republic" if NAMES_STD == "kyrgyz republic"	| NAMES_STD == "kyrghyz republic" | NAMES_STD == "kez" | NAMES_STD == "kirgizia" | NAMES_STD == "kirghistan" | NAMES_STD == "kyrgyzstan" | NAMES_STD == "kyrgyz rep" | NAMES_STD == "kyrgystan"
replace NAMES_STD = "Kiribati" if NAMES_STD == "kiribati" | NAMES_STD == "gilbert islands"
replace NAMES_STD = "South Korea" if NAMES_STD == "south korea" | NAMES_STD == "s korea" | NAMES_STD == "korea" | NAMES_STD == "korea republic of" | NAMES_STD == "korea_s" | NAMES_STD == "korea rep of" | NAMES_STD == "korea rep" | NAMES_STD == "korea south" | NAMES_STD == "republic of korea" | NAMES_STD == "korea south republic of" | NAMES_STD == "republic of korea seoul"
replace NAMES_STD = "North Korea" if NAMES_STD == "north korea" | NAMES_STD == "korea dem people's rep" | NAMES_STD == "democratic people's republic of korea" | NAMES_STD == "korea democratic people's republic of" | NAMES_STD == "n korea" | NAMES_STD == "korea_n" | NAMES_STD == "korea north" | NAMES_STD == "korea demo people's rep of" 
replace NAMES_STD = "Kuwait" if NAMES_STD == "kuwait"
replace NAMES_STD = "Laos" if NAMES_STD == "laos" | NAMES_STD == "lao people's democratic republic" | NAMES_STD == "lao" | NAMES_STD == "lao pdr"
replace NAMES_STD = "Latvia" if NAMES_STD == "latvia"
replace NAMES_STD = "Lebanon" if NAMES_STD == "lebanon"
replace NAMES_STD = "Leeward Islands" if NAMES_STD == "leeward islands"
replace NAMES_STD = "Lesotho" if NAMES_STD == "lesotho"
replace NAMES_STD = "Liberia" if NAMES_STD == "liberia"
replace NAMES_STD = "Libya" if NAMES_STD == "libya" | NAMES_STD == "libyan arab jamahiriya"
replace NAMES_STD = "Liechtenstein" if NAMES_STD == "liechtenstein"
replace NAMES_STD = "Lithuania" if NAMES_STD == "lithuania"
replace NAMES_STD = "Luxembourg" if NAMES_STD == "luxembourg"
replace NAMES_STD = "Macao" if NAMES_STD == "macao" | NAMES_STD == "china macao special administrative region" | NAMES_STD == "macau" | NAMES_STD == "macao special administrative region of china" | NAMES_STD == "macao china"
replace NAMES_STD = "Macedonia" if NAMES_STD == "macedonia" | NAMES_STD == "former yugoslav republic of macedonia" | NAMES_STD == "macedonia fyr" | NAMES_STD == "macedonia tfyr" 
replace NAMES_STD = "Madagascar" if NAMES_STD == "madagascar" | NAMES_STD == "malagasy" | NAMES_STD == "malagasy republic" | NAMES_STD == "madagas"
replace NAMES_STD = "Malawi" if NAMES_STD == "malawi"
replace NAMES_STD = "Malaysia" if NAMES_STD == "malaysia"
replace NAMES_STD = "Maldives" if NAMES_STD == "maldives" | NAMES_STD == "maldive islands" | NAMES_STD == "maldive is"
replace NAMES_STD = "Mali" if NAMES_STD == "mali"
replace NAMES_STD = "Malta" if NAMES_STD == "malta"
replace NAMES_STD = "Marshall Islands" if NAMES_STD == "marshall islands" | NAMES_STD == "marshall is"
replace NAMES_STD = "Martinique" if NAMES_STD == "martinique"
replace NAMES_STD = "Mauritania" if NAMES_STD == "mauritania" | NAMES_STD == "mauritn"
replace NAMES_STD = "Mauritius" if NAMES_STD == "mauritius" | NAMES_STD == "mritius"
replace NAMES_STD = "Mayotte" if NAMES_STD == "mayotte" | NAMES_STD == "may" 
replace NAMES_STD = "Meckelnburg Schwerin" if NAMES_STD == "meckelnburg schwerin"
replace NAMES_STD = "Mexico" if NAMES_STD == "mexico"
replace NAMES_STD = "Micronesia" if NAMES_STD == "micronesia" | NAMES_STD == "federated states of micronesia" | NAMES_STD == "micronesia federated states of" | NAMES_STD == "f st micronesia" | NAMES_STD == "micronesia fed sts"
replace NAMES_STD = "Modena" if NAMES_STD == "modena"
replace NAMES_STD = "Moldova" if NAMES_STD == "moldova"	 | NAMES_STD == "moldavia" | NAMES_STD == "moldova moldavia" | NAMES_STD == "republic of moldova" | NAMES_STD == "moldova republic of"
replace NAMES_STD = "Monaco" if NAMES_STD == "monaco"
replace NAMES_STD = "Mongolia" if NAMES_STD == "mongolia" | NAMES_STD == "mongola"
replace NAMES_STD = "Montenegro" if NAMES_STD == "montenegro"
replace NAMES_STD = "Montserrat" if NAMES_STD == "montserrat" | NAMES_STD == "montserrat is"
replace NAMES_STD = "Morocco" if NAMES_STD == "morocco"
replace NAMES_STD = "Mozambique" if NAMES_STD == "mozambique" | NAMES_STD == "mozambq"
replace NAMES_STD = "Myanmar" if NAMES_STD == "myanmar"	| NAMES_STD == "burma" | NAMES_STD == "bur" | NAMES_STD == "myanmar burma" | NAMES_STD == "burma myanmar" | NAMES_STD == "burma/myanmar" | NAMES_STD == "myanmar/burma" | NAMES_STD == "myanmar exburma" 
replace NAMES_STD = "Namibia" if NAMES_STD == "namibia"
replace NAMES_STD = "Nauru" if NAMES_STD == "nauru"
replace NAMES_STD = "Nepal" if NAMES_STD == "nepal"
replace NAMES_STD = "Netherlands" if NAMES_STD == "nerlands" | NAMES_STD == "holland" | NAMES_STD == "nethlds"
replace NAMES_STD = "Netherlands Antilles" if NAMES_STD == "nerlands antilles" | NAMES_STD == "nerlands ant" | NAMES_STD == "n_antil" | NAMES_STD == "neth ant" | NAMES_STD == "n_antilles" | NAMES_STD == "antilles nerlands"
replace NAMES_STD = "New Caledonia" if NAMES_STD == "new caledonia" | NAMES_STD == "new_cale" | NAMES_STD == "new cale" | NAMES_STD == "n caledonia" | NAMES_STD == "n_caledonia"
replace NAMES_STD = "New Zealand" if NAMES_STD == "new zealand" | NAMES_STD == "new_zeal"
replace NAMES_STD = "Nicaragua" if NAMES_STD == "nicaragua" | NAMES_STD == "nicaraga"
replace NAMES_STD = "Niger" if NAMES_STD == "niger"
replace NAMES_STD = "Nigeria" if NAMES_STD == "nigeria"
replace NAMES_STD = "Niue" if NAMES_STD == "niue"
replace NAMES_STD = "Norway" if NAMES_STD == "norway"
replace NAMES_STD = "Oman" if NAMES_STD == "oman"
replace NAMES_STD = "Pakistan" if NAMES_STD == "pakistan"
replace NAMES_STD = "Palau" if NAMES_STD == "palau"
replace NAMES_STD = "Palestine" if NAMES_STD == "palestine" | NAMES_STD == "west bank and gaza" | NAMES_STD == "palestinian administration areas / west bank and gaza" | NAMES_STD == "palestinian administration areas" | NAMES_STD == "palestinian territory"
replace NAMES_STD = "Panama" if NAMES_STD == "panama"
replace NAMES_STD = "Papua New Guinea" if NAMES_STD == "papua new guinea" | NAMES_STD == "papua ng" | NAMES_STD == "pap new guinea" | NAMES_STD == "p new guinea" | NAMES_STD == "new guinea" | NAMES_STD == "papua and new guinea" | NAMES_STD == "papua n g" | NAMES_STD == "papua new guin" | NAMES_STD == "new_guinea" | NAMES_STD == "new_guin" 
replace NAMES_STD = "Paraguay" if NAMES_STD == "paraguay" | NAMES_STD == "paragua"
replace NAMES_STD = "Parma" if NAMES_STD == "parma"
replace NAMES_STD = "Peru" if NAMES_STD == "peru"
replace NAMES_STD = "Philippines" if NAMES_STD == "philippines" | NAMES_STD == "phil"
replace NAMES_STD = "Poland" if NAMES_STD == "poland"
replace NAMES_STD = "Portugal" if NAMES_STD == "portugal"
replace NAMES_STD = "Puerto Rico" if NAMES_STD == "puerto rico"
replace NAMES_STD = "Qatar" if NAMES_STD == "qatar"
replace NAMES_STD = "Reunion" if NAMES_STD == "reunion" | NAMES_STD == "r�union"
replace NAMES_STD = "Romania" if NAMES_STD == "romania"	| NAMES_STD == "rumania"
replace NAMES_STD = "Russia" if NAMES_STD == "russia" | NAMES_STD == "ussr" | NAMES_STD == "russian federation" | NAMES_STD == "sun" | NAMES_STD == "russia/soviet union" | NAMES_STD == "union of soviet socialist republics former" | NAMES_STD == "union of soviet socialist republics" | NAMES_STD == "russia russian federation" | NAMES_STD == "union of soviet socialist republics ussr" | NAMES_STD == "ussr soviet union"
replace NAMES_STD = "Rwanda" if NAMES_STD == "rwanda"
replace NAMES_STD = "Saint Helena" if NAMES_STD == "saint helena" |  NAMES_STD == "st helena" | NAMES_STD == "s_helna"
replace NAMES_STD = "Saint Kitts and Nevis" if NAMES_STD == "saint kitts and nevis" | NAMES_STD == "st kittsnevis" | NAMES_STD == "st_k_nev" | NAMES_STD == "st kitts and nevis" | NAMES_STD == "saint kitts nevis" | NAMES_STD == "saint kittsnevis"
replace NAMES_STD = "Saint Lucia" if NAMES_STD == "saint lucia"	| NAMES_STD == "st lucia" | NAMES_STD == "st lucia is"
replace NAMES_STD = "Saint Pierre and Miquelon" if NAMES_STD == "saint pierre and miquelon" | NAMES_STD == "saint pierre miquelon" | NAMES_STD == "st pierre miq"
replace NAMES_STD = "Saint Vincent and the Grenadines" if NAMES_STD == "saint vincent and grenadines" | NAMES_STD == "st vincent grenadines" | NAMES_STD == "saint vincent" | NAMES_STD == "st vinc gren" | NAMES_STD == "st vinc and gren" | NAMES_STD == "st vincent and grenadines" | NAMES_STD == "saint vincent grenadines"
replace NAMES_STD = "San Marino" if NAMES_STD == "san marino"
replace NAMES_STD = "Sao Tome and Principe" if NAMES_STD == "sao tome and principe" | NAMES_STD == "sao tome principe" | NAMES_STD == "sao tomeprincipe" | NAMES_STD == "sao tome and prin" | NAMES_STD == "sao tome prin"
replace NAMES_STD = "Saudi Arabia" if NAMES_STD == "saudi arabia" | NAMES_STD == "sd_arab" | NAMES_STD == "arabia saudi"
replace NAMES_STD = "Saxony" if NAMES_STD == "saxony"
replace NAMES_STD = "Senegal" if NAMES_STD == "senegal"
replace NAMES_STD = "Seychelles" if NAMES_STD == "seychelles" | NAMES_STD == "seychel"
replace NAMES_STD = "Sierra Leone" if NAMES_STD == "sierra leone" | NAMES_STD == "sier_ln"
replace NAMES_STD = "Singapore" if NAMES_STD == "singapore" | NAMES_STD == "singapr"
replace NAMES_STD = "Slovak Republic" if NAMES_STD == "slovak republic" | NAMES_STD == "slovakia"
replace NAMES_STD = "Slovenia" if NAMES_STD == "slovenia"
replace NAMES_STD = "Solomon Islands" if NAMES_STD == "solomon islands" | NAMES_STD == "solomon is"
replace NAMES_STD = "Somalia" if NAMES_STD == "somalia"
replace NAMES_STD = "South Africa" if NAMES_STD == "south africa" | NAMES_STD == "s_africa" | NAMES_STD == "s africa"
replace NAMES_STD = "South Sudan" if NAMES_STD == "south sudan" | NAMES_STD == "republic of south sudan" | NAMES_STD == "rep of south sudan" | NAMES_STD == "rep of s sudan" | NAMES_STD == "south sudan rep of" | NAMES_STD == "south sudan republic of"
replace NAMES_STD = "Spain" if NAMES_STD == "spain"
replace NAMES_STD = "Sri Lanka" if NAMES_STD == "sri lanka" | NAMES_STD == "ceylon" | NAMES_STD == "sri lanka ceylon" | NAMES_STD == "sri_lka" | NAMES_STD == "sri lanka exceilan"
replace NAMES_STD = "Sudan" if NAMES_STD == "sudan"
replace NAMES_STD = "Suriname" if NAMES_STD == "suriname" | NAMES_STD == "surinam"
replace NAMES_STD = "Swaziland" if NAMES_STD == "swaziland"
replace NAMES_STD = "Sweden" if NAMES_STD == "sweden"
replace NAMES_STD = "Switzerland" if NAMES_STD == "switzerland" | NAMES_STD == "switzld"
replace NAMES_STD = "Syria" if NAMES_STD == "syria" | NAMES_STD == "syrian arab republic"
replace NAMES_STD = "Tajikistan" if NAMES_STD == "tajikistan" | NAMES_STD == "tadzhikistan"
replace NAMES_STD = "Taiwan" if NAMES_STD == "taiwan" | NAMES_STD == "roc" | NAMES_STD == "taipei" | NAMES_STD == "oan" | NAMES_STD == "china taiwan" | NAMES_STD == "taiwan province of china" | NAMES_STD == "formosa" | NAMES_STD == "chinataiwanformosa" | NAMES_STD == "chinese taipei" 
replace NAMES_STD = "Tanzania" if NAMES_STD == "tanzania" | NAMES_STD == "tanganyika" | NAMES_STD == "tanzania/tanganyika" | NAMES_STD == "united republic of tanzania" | NAMES_STD == "tanzania united republic of"
replace NAMES_STD = "Thailand" if NAMES_STD == "thailand"
replace NAMES_STD = "Timor" if NAMES_STD == "timor" | NAMES_STD == "east timor leste" | NAMES_STD == "timor leste" | NAMES_STD == "timorleste" | NAMES_STD == "east timor timorleste" | NAMES_STD == "timorleste east timor" | NAMES_STD == "east timor" 
replace NAMES_STD = "Togo" if NAMES_STD == "togo"
replace NAMES_STD = "Tonga" if NAMES_STD == "tonga"
replace NAMES_STD = "Trinidad and Tobago" if NAMES_STD == "trinidad and tobago"	| NAMES_STD == "trinidad tob" | NAMES_STD == "trinidad tobago" | NAMES_STD == "trinidad" | NAMES_STD == "trin and tobago" | NAMES_STD == "trin tobago"
replace NAMES_STD = "Tunisia" if NAMES_STD == "tunisia"
replace NAMES_STD = "Turkey" if NAMES_STD == "turkey" | NAMES_STD == "ottoman empire" | NAMES_STD == "turkey/ottoman empire"
replace NAMES_STD = "Turkmenistan" if NAMES_STD == "turkmenistan" | NAMES_STD == "turkmenia" | NAMES_STD == "turkmenist"
replace NAMES_STD = "Turks and Caicos Islands" if NAMES_STD == "turks and caicos islands" | NAMES_STD == "turks caicos islands" | NAMES_STD == "turks caicos" | NAMES_STD == "turks and caicos" | NAMES_STD == "turks caic is"
replace NAMES_STD = "Tuscany" if NAMES_STD == "tuscany"
replace NAMES_STD = "Tuvalu" if NAMES_STD == "tuvalu"
replace NAMES_STD = "Two Sicilies" if NAMES_STD == "two sicilies"
replace NAMES_STD = "Uganda" if NAMES_STD == "uganda"
replace NAMES_STD = "Ukraine" if NAMES_STD == "ukraine"
replace NAMES_STD = "United Arab Emirates" if NAMES_STD == "united arab emirates" | NAMES_STD == "unit arab em" | NAMES_STD == "united arab emerates" | NAMES_STD == "united ae" | NAMES_STD == "united a e" | NAMES_STD == "arab emirates" | NAMES_STD == "arab_em" | NAMES_STD == "uae" | NAMES_STD == "united arab em"
replace NAMES_STD = "United Kingdom" if NAMES_STD == "united kingdom" | NAMES_STD == "uk" | NAMES_STD == "great britain" | NAMES_STD == "britain" | NAMES_STD == "ukingdom"
replace NAMES_STD = "United States" if NAMES_STD == "united states" | NAMES_STD == "usa" | NAMES_STD == "us" | NAMES_STD == "united states of america"
replace NAMES_STD = "Uruguay" if NAMES_STD == "uruguay"
replace NAMES_STD = "Uzbekistan" if NAMES_STD == "uzbekistan"
replace NAMES_STD = "Vanuatu" if NAMES_STD == "vanuatu" | NAMES_STD == "new hebrides"
replace NAMES_STD = "Vatican" if NAMES_STD == "vatican" | NAMES_STD == "papal states" | NAMES_STD == "holy see" | NAMES_STD == "vatican city" | NAMES_STD == "holy see vatican city state" | NAMES_STD == "vatican city state holy see"
replace NAMES_STD = "Venezuela" if NAMES_STD == "venezuela" | NAMES_STD == "venez"| NAMES_STD == "venezuela rb"
replace NAMES_STD = "Vietnam" if NAMES_STD == "vietnam" | NAMES_STD == "vnmn" | NAMES_STD == "vietnam democratic rep" | NAMES_STD == "viet nam" | NAMES_STD == "vietnam" | NAMES_STD == "north vietnam" | NAMES_STD == "democratic republic of vietnam"
replace NAMES_STD = "Republic of Vietnam" if NAMES_STD == "republic of vietnam" | NAMES_STD == "south vietnam" | NAMES_STD == "vietnam republic of" | NAMES_STD == "south vietnam" | NAMES_STD == "republic of	south vietnam"
replace NAMES_STD = "British Virgin Islands" if NAMES_STD == "british virgin islands" | NAMES_STD == "virgin islands uk" | NAMES_STD == "virgin islands british" | NAMES_STD == "br virgin is"
replace NAMES_STD = "United States Virgin Islands" if NAMES_STD == "united states virgin islands" | NAMES_STD == "virgin islands us" | NAMES_STD == "us virgin islands"
replace NAMES_STD = "Wallis and Futuna" if NAMES_STD == "wallis and futuna" | NAMES_STD == "wallis futuna" | NAMES_STD == "wallis and futuna islands" | NAMES_STD == "wallis futuna islands"
replace NAMES_STD = "Western Sahara" if NAMES_STD == "western sahara"
replace NAMES_STD = "Samoa" if NAMES_STD == "western samoa" | NAMES_STD == "samoa"
replace NAMES_STD = "Wuerttemburg" if NAMES_STD == "wuerttemburg"
replace NAMES_STD = "Yemen" if NAMES_STD == "yemen" | NAMES_STD == "yemen rep"
replace NAMES_STD = "Yemen Arab Republic" if NAMES_STD == "yemen arab republic"	| NAMES_STD == "yemen arab republic former" | NAMES_STD == "yemen sanaa" | NAMES_STD == "north yemen" | NAMES_STD == "arab republic of yemen" | NAMES_STD == "yemen ar" | NAMES_STD == "yemen a r" | NAMES_STD == "yemen_n" | NAMES_STD == "yemen north" | NAMES_STD == "yemen north" | NAMES_STD == "yemen n"
replace NAMES_STD = "Yemen People's Republic" if NAMES_STD == "yemen people's republic" | NAMES_STD == "democratic yemen former" | NAMES_STD == "yemen aden" | NAMES_STD == "south yemen" | NAMES_STD == "sourn yemen" | NAMES_STD == "yemen people's republic of" | NAMES_STD == "yemen p r" | NAMES_STD == "yemen pr" | NAMES_STD == "yemen_s" | NAMES_STD == "democratic yemen" | NAMES_STD == "yemen south" | NAMES_STD == "yemen south" | NAMES_STD == "yemen s"
replace NAMES_STD = "Yugoslavia" if NAMES_STD == "yugoslavia" | NAMES_STD == "yugoslavia/serbia" | NAMES_STD == "serbia" | NAMES_STD == "serbia and montenegro" | NAMES_STD == "yugoslavia former socialist federal republic" | NAMES_STD == "yugoslavia8992"  | NAMES_STD == "yugoslav" | NAMES_STD == "serbia montenegro" | NAMES_STD == "socialist federal republic of yugoslavia" | NAMES_STD == "federal republic of yugoslavia"
replace NAMES_STD = "Zambia" if NAMES_STD == "zambia"
replace NAMES_STD = "Zanzibar" if NAMES_STD == "zanzibar"
replace NAMES_STD = "Zimbabwe" if NAMES_STD == "zimbabwe" | NAMES_STD == "rhodesia" | NAMES_STD == "zimbabwe rhodesia"

end
exit
