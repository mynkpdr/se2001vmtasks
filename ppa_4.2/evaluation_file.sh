#!/bin/bash

err(){
  echo "Error: $*"
  exit 1
}

req=( "mktemp" "diff" "basename" "col" "find" "pushd" "popd" )
executable="pincode.sh"
for i in "${req[@]}"; do
  command -v "$i" > /dev/null 2>&1 || err "$i is not installed"
done

ppa=$(basename "$PWD")
ppa_path="/opt/se2001/$ppa"

[[ -d "$ppa_path" ]] || err "PPA not found at $ppa_path"

test_type="$1"
test_type=${test_type:-"public"}
test_type=${test_type%/}

cat >script.sh <<EOF
#!/bin/bash

rand_dir=\$(mktemp -d XXXXXX)
pushd "\$rand_dir" > /dev/null || exit 1

echo \
'Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Aluru B.O,515415,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Amidyaya S.O,515822,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ammaladinne S.O,515445,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Anantapur Collectorate S.O,515001,SO,Non Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ankampalli B.O,515741,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Anumpalli B.O,515775,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Appecharla B.O,515455,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Araveedu B.O,515465,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Atmakur(ATP) S.O,515751,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Avuladatla B.O,515867,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Aydukallu B.O,515763,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ayyagarlapalli B.O,515767,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ayyavaripalli B.O,515722,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,B.T.Project B.O,515863,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bandlapalli B.O,515425,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Basinepalli B.O,515402,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bavarampalli B.O,515761,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bhattuvanipalli B.O,515787,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bhogasamudram Project S.O,515413,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bollanaguddem B.O,515870,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bommanahal B.O,515871,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bondaladinne B.O,515411,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Brahmanapalli B.O,515408,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Brahmanapalli B.O,515401,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Budagavi B.O,515812,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Bukkarayasamudram S.O,515701,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chadam B.O,515865,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chalivemula B.O,515414,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chayapuram B.O,515842,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chinnavadugur B.O,515405,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chitrachedu B.O,515611,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Chiyyedu B.O,515721,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Cholasamudram B.O,515711,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Dasampalli B.O,515765,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Dosaludiki B.O,515803,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Gadehothur B.O,515832,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Gandhibazar S.O (Ananthapur),515005,SO,Non Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Guntakal H.O,515801,HO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Herial S.O,515872,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Kallur R.S. S.O,515774,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Narasapuram East B.O,515435,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Sri Venkateswara Puram S.O,515003,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Adavibudugur B.O,517425,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Adilakshmambapuram B.O,517403,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Agraharam B.O,517280,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Akanambattu B.O,517124,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Alappalle B.O,517415,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Amudala B.O,517421,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Angallu B.O,517326,BO,Delivery,Madanapalle,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Annagaripalle B.O,517390,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Appinapalle B.O,517432,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Aradigunta B.O,517247,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Arimakulapalle B.O,517167,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Arimanipenta B.O,517401,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Arugonda S.O,517129,SO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Badikayalapalle B.O,517370,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bairupalle B.O,517424,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Balireddigaripalle B.O,517351,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bandapalle B.O,517127,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bandrevu B.O,517418,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bangarupalem S.O,517416,SO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bisanatham B.O,517426,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bodaguttapalle B.O,517422,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Bommasamudram B.O,517132,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Booragamanda B.O,517123,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Boyanapalle B.O,517423,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Chalamangalam B.O,517408,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Charala B.O,517257,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Cheelapalle B.O,517419,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Chembakur S.O,517417,SO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Chennamagudipalle B.O,517002,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Cherlopalle B.O,517004,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Chinnamreddikandriga B.O,517126,BO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Chittoor Division,Chinnatippasamudram S.O,517319,SO,Delivery,Chittoor,Andhra Pradesh
Andhra Pradesh Circle,Visakhapatnam Region,Vizianagaram Division,Konada B.O,535213,BO,Delivery,VIZIANAGARAM,Andhra Pradesh
Andhra Pradesh Circle,Visakhapatnam Region,Vizianagaram Division,Kondatamarapalli B.O,509324,BO,Delivery,VIZIANAGARAM,Andhra Pradesh
Andhra Pradesh Circle,Visakhapatnam Region,Vizianagaram Division,Vizianagaram City S.O,535001,SO,Delivery,VIZIANAGARAM,Andhra Pradesh
Bihar Circle,NA,AurangabadBihar Division,Adai BO,824207,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Adarchak BO,824221,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Agnoor BO,824143,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Akauna BO,824203,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Akauni BO,824113,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Akhoini Regania BO,824103,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Akouna BO,824211,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Amarut BO,824220,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Amas SO,824219,SO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Amba SO,824111,SO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Amilauna BO,824124,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Angra BO,824116,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Angrahi BO,824115,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Anjan BO,824217,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Ankora RS BO,824303,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Ankupa BO,824123,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Apiroo BO,824120,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Ararua BO,824202,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Arthua BO,824125,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Aurangabad BH HO,824101,HO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Balia BO,824205,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Bara BO,824301,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Bara BO,824210,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Barabanadih BO,824302,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Barachatti SO,824201,SO,Delivery,GAYA,Bihar
Bihar Circle,NA,AurangabadBihar Division,Barahi BO,824122,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Barpa BO,824114,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Barun SO AurangabadBH,824112,SO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Baxar BO,824129,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Belaon BO,824127,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Beri BO,824208,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Bhartholi BO,824121,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Bijauli BO,824102,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,AurangabadBihar Division,Imamganj SO,824206,SO,Delivery,GAYA,Bihar
Bihar Circle,NA,Bhojpur Division,Agiaon Bazar SO,802202,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Agiaon SO,802201,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Agrsanda Behara BO,802156,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Ahirauli BO,802116,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Akarua BO,802155,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Akhagaon SO,802352,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Akhauripur Gola BO,802114,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Allipur BO,802161,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Amrainawada BO,802154,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Amsari BO,802126,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Anaith SO,802302,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Andhari BO,802222,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Arak SO,802111,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Ariaon BO,802119,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Arrah Chowk SO,802301,SO,Non Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Asha Parari BO,802135,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Ashni Jaitpur BO,802210,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Atimi BO,802129,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Atrauna BO,802123,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Ayer BO,802203,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Babhangawan BO,802163,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Babhaniaon BO,802158,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bachari BO,802207,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Baga BO,802164,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bagen BO,802134,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Bahoranpur BO,802166,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bakhorapur BO,802311,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Balua BO,802130,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Balua High School BO,802351,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bampali BO,802312,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Banahi BO,802183,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bankat BO,802206,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Banni BO,802128,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Bariswan BO,802165,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Barka Dhakaich BO,802133,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Barka Singhanpura BO,802120,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Barkagaon  BO,802209,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Barkarajpur SO,802113,SO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Barki Nainijor BO,802112,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Baruhi BO,802208,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Baulipur BO,802152,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bhakura BO,802205,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Bikaram English BO,802117,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Birampur BO,802314,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Boksa BO,802103,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Buxar HO,802101,HO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Buxar Jail SO,802102,SO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Chanawath BO,802125,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Chandi BO,802223,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Chaturbhujibaraon BO,802159,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Chaugai SO,802115,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Chhotka Sasaram BO,802157,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Daulatpur BO,802313,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Deoria BO,802122,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Derhgaon BO,802204,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Dhandihan BO,802160,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Dulahpur SO,802118,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Dumraon Textiles SO,802136,SO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Ekauna Dubauli BO,802131,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Girdhar Baraon BO,802127,BO,Delivery,BUXAR,Bihar
Bihar Circle,NA,Bhojpur Division,Kawara BO,802162,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Bhojpur Division,Mahulighat BO,802316,BO,Delivery,BHOJPUR,Bihar
Bihar Circle,NA,Gaya Division,Abgila BO,804423,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Agni BO,804403,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Aiara BO,804426,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Aima Chouki BO,824233,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Aira BO,804421,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Akamba BO,824232,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Akbarpur BO,804401,BO,Delivery,AURANGABAD,Bihar
Bihar Circle,NA,Gaya Division,Alinagarpali BO,804418,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Alipur BO,823003,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Allahganj BO,804405,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Amain BO,804425,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Amwan BO,824231,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Anandpur BO,804419,BO,Delivery,ARWAL,Bihar
Bihar Circle,NA,Gaya Division,APColony SO Gaya,823001,SO,Non Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Arkdhibariya BO,824236,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Asc CentreN Gaya SO,823005,SO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Atiawan BO,804432,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Atri SO,823311,SO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Babhana BO,804417,BO,Non Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bagadaha BO,823004,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Baidrabad SO,804402,SO,Delivery,ARWAL,Bihar
Bihar Circle,NA,Gaya Division,Baiju Bigha BO,824237,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bairagi SO,823002,SO,Non Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bambhai BO,804428,BO,Delivery,JEHANABAD,Bihar
Bihar Circle,NA,Gaya Division,Bandeya BO,804422,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bara Rahimbigha BO,804404,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bargaon BO,824235,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Bauri Beldari BO,804407,BO,Delivery,JEHANABAD,Bihar
Bihar Circle,NA,Gaya Division,Budhoul BO,824118,BO,Delivery,GAYA,Bihar
Bihar Circle,NA,Gaya Division,Charh BO,804427,BO,Delivery,JEHANABAD,Bihar
Bihar Circle,NA,Gaya Division,Dhana Dehri BO,804429,BO,Delivery,GAYA,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Asli Kothia BO,851204,BO,Delivery,KHAGARIA,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Badalpura BO,851129,BO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Badia BO,851213,BO,Delivery,KHAGARIA,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Bagras BO,848201,BO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Bakhadda BO,851217,BO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Ballia Bazar BO,851211,BO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Bandehra BO,851212,BO,Delivery,KHAGARIA,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Barauni Oil Refinery SO,851114,SO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Barauni Urvark Nagar SO,851115,SO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,BDeorhi SO,851113,SO,Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Begusarai Court SO,851101,SO,Non Delivery,BEGUSARAI,Bihar
Bihar Circle,"East Region, Bhagalpur",Begusarai Division,Belanawada BO,852161,BO,Delivery,KHAGARIA,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bagahi BO,845103,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Baishakhawa BO,845307,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bakhari Pachrukhia BO,845106,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bakharia BO,845454,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bakulahar Math BO,845449,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bakuli BO,845105,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Balua Thori Bazar BO,845404,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bargajwa BO,845451,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bariarwa BO,845453,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bastha BO,845306,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Bhitaha BO,845104,BO,Delivery,WEST CHAMPARAN,Bihar
Bihar Circle,Muzaffarpur Region,West Champaran Division,Champapur Gonauli BO,845107,BO,Delivery,WEST CHAMPARAN,Bihar
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Andikurumbalur B.O,621717,BO,Delivery,PERAMBALUR,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Annamangalam S.O,621102,SO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Anukkur B.O,621219,BO,Delivery,PERAMBALUR,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Arachi B.O,621214,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Aranarai B.O,621220,BO,Non Delivery,PERAMBALUR,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Arangoor B.O,621215,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Arasalur B.O,621203,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Ayikudi B.O,621115,BO,Delivery,PERAMBALUR,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Ayilur B.O,621113,BO,Delivery,PERAMBALUR,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Ayyampalayam S.O,621202,SO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Baderpettai B.O,621001,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Bikshandarkoil S.O,621216,SO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Bommanapadi B.O,621104,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Central Region, Trichirapalli",Srirangam Division,Chinnapallipalayam B.O,621207,BO,Delivery,TIRUCHIRAPPALLI,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Gobichettipalayam East SO,638452,SO,Non Delivery,ERODE,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Gobichettipalayam South SO,638476,SO,Delivery,ERODE,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Greynagar BO,638056,BO,Delivery,ERODE,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Ingur BO,638052,BO,Delivery,ERODE,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Kadirampatti BO,638107,BO,Delivery,ERODE,Tamil Nadu
Tamilnadu Circle,"Western Region, Coimbatore",Erode Division,Kalbhavi BO,638314,BO,Delivery,ERODE,Tamil Nadu' > Pincode_info.csv

read pin
pin="\$pin" bash "../\$(dirname "\${BASH_SOURCE[0]}")/$executable" 2>&1 < /dev/null

popd > /dev/null || exit 1
[[ -d "\$rand_dir" ]] && rm "\${rand_dir?}" -rf
EOF
chmod u+x script.sh

if [[ $test_type == "private" ]]; then
  redir="/dev/null"
else
  redir="/dev/stdout"
fi
echo "${test_type^} Test Cases:"
if [[ ! -d "$ppa_path/$test_type" ]]; then
  err "No $test_type test cases found"
fi
tc=0
passed=0
IFS=$'\n'
for test_path in $(find "$ppa_path/$test_type" -type d -name "test_case_*" | sort ); do
  ((tc++))
  echo -n "Test Case $tc: "
  input_path="$test_path/input.txt"
  output_path="$test_path/output.txt"
  if [[ ! -f "$output_path" ]]; then
    echo "Output file for $input_path not found at $output_path"
    continue
  fi
  if diff --color=always <( ./script.sh < "$input_path" | col) <( col < "$output_path" ) &>$redir ; then
    echo "Passed!"
    ((passed++))
  else
    echo "Failed :("
  fi
done
if [[ $tc -eq 0 ]]; then
  err "No $test_type test cases found"
fi
if [[ $passed -eq $tc ]]; then
  echo "All $test_type test cases passed!"
else
  echo "$passed/$tc $test_type test cases passed"
  exit 1
fi
