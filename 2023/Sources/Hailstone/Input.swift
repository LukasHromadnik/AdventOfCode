let mainInput = """
342948424011438, 174891902666380, 342806081991021 @ -59, -15, -33
293706396323705, 260477020213330, 361057996757008 @ -31, 22, -178
349281020720534, 232777231877012, 244513365239874 @ -154, 120, 24
282727593834978, 383059564665621, 130695782953488 @ -34, -153, 316
297811030268616, 250609132799222, 271517844969369 @ -23, -36, 18
312403651749014, 149654087398484, 314855536486601 @ -22, -12, 7
284340282896044, 300700871786494, 276696543855989 @ -12, -62, -17
313396881902120, 183836443891534, 476373434417657 @ -39, 30, -238
300028824620199, 168040902112289, 403949423844675 @ -107, 627, -603
361838822025676, 138556487715742, 262611366334245 @ -100, 84, 39
281483560575756, 353940107898038, 212028914019389 @ -44, -17, 68
328999079845728, 472905419289562, 266989186848617 @ -71, -351, 20
214267488744084, 289674523547664, 212868973578459 @ 248, 361, 48
501066324421320, 517794882904074, 555269433273201 @ -399, -445, -516
419781390262384, 311811208272517, 305823655282774 @ -136, -165, 10
110408618992014, 51861200257248, 156474138523869 @ 178, 88, 163
278750333521380, 37649672543326, 169662975156141 @ 7, 190, 156
222194369523004, 324421990028698, 153526500620333 @ 68, -180, 167
284928168298764, 556549912438962, 426332859431589 @ -52, -723, -661
263482116499836, 157447433806158, 311556163554885 @ 26, -12, 7
316114452133068, 233726115874110, 296680146270597 @ -60, 28, -38
251265922681956, 425448881178465, 292622003840493 @ 116, -259, -701
213080189537386, 350593361766942, 321560260032357 @ 177, -46, -261
404255684237874, 486829397175027, 452932638007134 @ -298, -419, -462
224919047748317, 266660935900932, 180573080928780 @ 89, -16, 150
277023260825236, 349997710241134, 209974720582949 @ -19, -48, 83
333358378272756, 307716752595606, 314296897484637 @ -101, -69, -88
275805993680161, 341773798982403, 225704632183182 @ -15, -25, 36
319019089063167, 291358365389478, 219637871777033 @ -143, 122, 55
268616722855500, 393769872165630, 212865501059301 @ 9, -193, 80
288505868595154, 403240139966762, 215227128666494 @ -70, -194, 56
261502975177164, 364949116956252, 259205877385389 @ 28, -127, -33
290463009852724, 260621593893974, 412518225172831 @ -12, -54, -175
271743925128080, 380916407309682, 196147978480802 @ -88, 254, 130
161183726712564, 171103723953082, 379848595287804 @ 148, 22, -96
328695541012650, 296419802874288, 214487083104213 @ -154, 72, 75
33766873588506, 10147852255826, 110670611361270 @ 274, 166, 216
240482246147265, 364070725712532, 419252692908840 @ 129, 24, -946
336505984575173, 64289463650464, 337031335064757 @ -49, 88, -21
270855901994649, 277072380568965, 308377560195230 @ 13, -43, -56
271073867402889, 245466723760017, 199530891260674 @ -17, 575, 110
299682044336604, 168972124728030, 330392708897949 @ -12, -14, -17
259254329691783, 105534393612485, 237241585576767 @ 31, 145, 69
450299696482836, 265168977107850, 297254544309057 @ -158, -125, 24
315738396109014, 446668268656172, 292581877152844 @ -122, -336, -142
266537007821834, 406943454640141, 337215477626202 @ 18, -243, -156
220853959569492, 296830916835630, 107758639561041 @ 202, 278, 504
309891298024168, 357982344327308, 347856036137697 @ -70, -143, -183
446369062376265, 225317127702388, 366426618295361 @ -203, -32, -89
196747454292700, 214226691394686, 179460612120785 @ 144, 98, 154
158599732956196, 258267187198206, 265072429348655 @ 144, -94, 46
271789071299063, 57499096460635, 334441407240711 @ 15, 183, -51
169903234767054, 81202100249352, 64839296689499 @ 187, 317, 352
239322029849899, 252940687420637, 466534220820159 @ 65, 7, -327
256208232623064, 424565790671106, 325745895457785 @ 53, -267, -486
362681123354754, 201285462120102, 217555997287359 @ -118, 42, 93
196910834878134, 203234994413384, 155857611317190 @ 118, 28, 180
270580853767392, 369799724142174, 200944672857633 @ -98, 530, 65
291890419393188, 252776724905226, 258264365848529 @ -14, -43, 38
259542591129234, 356293207547652, 209300543631219 @ 61, 931, -88
151176781080299, 163210571373817, 318422959249425 @ 213, 159, -81
275873638050808, 315970722696318, 226680407923821 @ -21, 98, 21
271305760316864, 554065444800382, 447227127159244 @ 8, -542, -388
265555887185659, 407977842511876, 187965357907177 @ -7, -108, 199
274558089108474, 363169168534213, 281189036929047 @ -62, 165, -459
294060907232410, 425201412943124, 257020239286043 @ -193, -263, -286
231462059651716, 176507329950854, 320848009227629 @ 74, 100, -67
290919645841512, 264123863570640, 270307643500779 @ -16, -40, 13
360586774975362, 317234148450027, 234490532818122 @ -190, -41, 40
272713447104312, 354428211494166, 247931710507405 @ -11, -28, -55
356171901142898, 433408273279939, 483607143718121 @ -306, -303, -889
159032916841464, 251316594091461, 57406687503357 @ 128, -113, 259
284112542333804, 380530262814942, 232100516516869 @ -171, 137, -188
262276631215964, 346969082918822, 225391240275509 @ 26, -75, 49
241582422193717, 75160629176872, 440310792024632 @ 59, 264, -256
280287697703503, 382237882284892, 248240985710786 @ -49, -96, -88
291143910860820, 284573509679676, 180012394496973 @ -156, 608, 227
200913288818598, 118171401887514, 119576366410503 @ 174, 462, 309
257384209651426, 413231686272182, 198999873565733 @ 87, -66, 91
260846916305324, 410138139241722, 209559114840789 @ 36, -61, -33
287053364697414, 372889945858077, 465045056802534 @ -22, -177, -402
238854982177074, 163706746445952, 330684534144789 @ 51, -17, -13
170939942566904, 346878788145822, 240345170501989 @ 161, -166, 59
265384713751614, 456193269319422, 300494647634934 @ 10, -414, -358
244208461906824, 338861790868458, 263298976715217 @ 113, 155, -204
279472360454370, 460626123309463, 234882844700649 @ -170, -639, -297
271817168372204, 196520448123822, 304328267302469 @ 14, 29, -23
249230942113938, 299649392827368, 310912685332107 @ 101, 481, -556
278697925073152, 382805651313266, 210542643563803 @ -138, 156, -10
260482245832166, 292322427454989, 252395716142300 @ 30, -19, 14
271409482279950, 257820482097530, 273187593061401 @ 7, 76, -39
295004451420666, 247020065741884, 274936078074747 @ -53, 153, -66
221412878745246, 303522400160512, 178605495806647 @ 145, 79, 176
275310161735154, 204387384713432, 163891713130409 @ 7, 55, 173
241763558022300, 304171650520958, 240431950243093 @ 61, -78, 50
319986714792300, 364056013367934, 460699050361665 @ -204, -30, -924
255092450227896, 326895558317016, 320459959611012 @ 72, 412, -726
346539654457518, 277080781928211, 186585519320430 @ -114, -33, 140
263247260225822, 157353469945903, 314505207624324 @ 26, 25, -12
277389855301164, 54453768092022, 286526839540509 @ 8, 185, 10
275079990460569, 470096670307203, 214610044069527 @ -7, -393, 77
253628211658752, 416996393165671, 204859473789388 @ 64, -233, 86
330387298266420, 141571782140322, 362279687596038 @ -44, 14, -50
273687527182448, 362291497336412, 236186576268769 @ -6, -101, 13
176960699913432, 367695708633450, 312050887654089 @ 171, -183, -72
126850242306144, 300151803658326, 205052288862741 @ 223, -100, 111
334106999644010, 311959925921863, 501084963009455 @ -66, -135, -271
261629842048192, 426115891027176, 190866657337107 @ 26, -247, 216
269098916383672, 409702589850094, 243470740474519 @ -46, -102, -332
292991649464476, 284202703158206, 154909070531165 @ -54, 90, 232
348602136371040, 333674042429152, 341931235496369 @ -128, -116, -137
270792073737882, 445552496731794, 50967506821683 @ 5, -328, 484
225869589002166, 161773952189676, 401875214091117 @ 69, 21, -113
314951469370804, 221285992532604, 553343778103193 @ -112, 257, -811
327966529390410, 223971661816386, 257255268989043 @ -61, -12, 42
317533174566222, 43259300968174, 506406542411019 @ -29, 106, -192
318944291656739, 212282208954851, 253222575036977 @ -147, 373, -49
236519671652001, 175980837146685, 235628883434607 @ 55, -13, 81
367157273182402, 320883957239892, 389610704946557 @ -75, -181, -65
323823647933460, 242204820009596, 285053586577995 @ -80, 37, -30
189777694914900, 389738601536829, 300369149440957 @ 100, -247, 19
262237657020774, 413387532248292, 205469120987289 @ 15, -17, -31
99412867737504, 109724009885022, 138307239566589 @ 333, 314, 233
199907303620206, 267801093934968, 173967568925970 @ 182, 116, 180
407488891725152, 306838694650066, 433920953801265 @ -225, -75, -288
203656416802596, 237374782607400, 307638537057831 @ 100, -48, -15
272013731820782, 457255494949362, 448068602955503 @ 17, -316, -140
235954524614304, 98163167732566, 314288839429065 @ 58, 102, -15
442872544486089, 448938575959077, 430334582925549 @ -177, -309, -141
263913058276896, 261089019580848, 340165911273963 @ 24, -8, -115
350446805751903, 472154120191686, 331089302809923 @ -119, -358, -99
311321421639435, 318594611239089, 140535245090415 @ -73, -63, 237
160056213820008, 330702569141282, 185197476509707 @ 142, -176, 136
256682727564165, 417120930001983, 205963220906091 @ 115, -79, -43
287109951055677, 483033455438610, 184769906067993 @ -83, -522, 175
263885327462250, 141119285945178, 349236513085413 @ 25, 76, -69
273535004519096, 378715092740020, 210738646075701 @ -34, -29, 51
259183220660284, 377555195640862, 287700343901605 @ 33, -176, -73
185940249613610, 187432160234922, 237762764752050 @ 122, 14, 72
251319674504884, 291624400970056, 247682470201309 @ 48, -17, 23
223161944733584, 338260926679042, 365726439981109 @ 87, -147, -137
236177336694054, 291107757532482, 236563398741939 @ 70, -58, 57
235421445158664, 273523243811322, 265526364161409 @ 83, 41, -22
403599226549140, 200374603414806, 280014275724501 @ -170, 32, 7
220047850985900, 181661446568606, 357179273493061 @ 74, -12, -55
310078239917314, 72047351819521, 161791776227001 @ -22, 81, 159
254480478886640, 341032713602710, 232625522365989 @ 75, 300, -117
403836829908684, 379662532448262, 347106100900077 @ -132, -231, -46
304209282203708, 324493171635021, 229558309735291 @ -84, -13, 37
262217138508936, 378042901419026, 228427207881801 @ 19, 351, -276
271117289691348, 204255789681262, 88604928555339 @ 16, -6, 258
328270291725789, 299390701950597, 295616279652159 @ -49, -137, 9
230336910269507, 268958730851052, 213489221180603 @ 69, -76, 101
280112674348344, 240850771020612, 269562731244819 @ -6, 57, -10
350966250147849, 288856679819914, 319458458228277 @ -77, -122, -21
259665921764368, 416583338778591, 222484714619053 @ 56, -103, -269
254214389781898, 175571759147988, 339413995290115 @ 35, -43, -14
308915952118648, 286834670074928, 251436032088763 @ -70, 7, 10
247990927749792, 345785196675250, 227254689240133 @ 67, -47, 35
223506952864780, 417641788583230, 223813982723301 @ 87, -269, 81
292637653438257, 61577981570853, 374139285418257 @ -5, 103, -65
284733980387214, 298355371864972, 319256721583809 @ -5, -101, -51
261502975177164, 125175896363398, 83361267097403 @ 28, 118, 274
271586353665294, 399016901386587, 196464970467129 @ -106, 107, 127
188137700583895, 249629414212456, 231116182111902 @ 201, 136, 42
232912287051316, 280042524097490, 193036746649581 @ 74, -47, 129
263964146375944, 286896653139602, 226651617110809 @ 21, 117, 38
263715303039372, 394667434458366, 229766524117845 @ 16, -102, -56
383021791661900, 247692465926990, 455683899690909 @ -148, -24, -252
311670418028467, 176930163659784, 184429710401064 @ -33, 20, 138
265815590620992, 324008870499393, 231626275010852 @ 16, 5, 26
191992048193570, 251385882561088, 189912776855611 @ 170, 76, 137
306002189937164, 130242786962222, 293855162679909 @ -16, 9, 27
279954884629539, 419753669358972, 257579302218159 @ -43, -252, -111
354102018681072, 389474681807985, 195967699223496 @ -88, -237, 124
324306093653676, 56132411825130, 438383519867601 @ -44, 141, -154
281533703028395, 399106364130073, 275763556455438 @ -61, -155, -228
238176836886564, 309214851995622, 260798503323909 @ 79, -25, -17
203189213816204, 446916977154238, 310061274626917 @ 98, -308, -13
393099081464502, 250849599507246, 353143158077460 @ -126, -78, -60
214318856173828, 142957360331313, 394770751943194 @ 84, 53, -112
271277858726692, 213329859454138, 188903560506593 @ -18, 727, 160
344941275970737, 309097907455994, 425448717163035 @ -53, -170, -99
279888530293238, 248519505198909, 190276947387177 @ -6, 47, 135
157014900772730, 311156295460336, 394646036950961 @ 141, -159, -91
286945948906260, 298290929551094, 270396390813505 @ -38, 52, -68
189720127471503, 33263967068002, 318484708601682 @ 97, 94, 6
245812751601052, 347068850779814, 197107058656781 @ 74, -47, 122
280130333349524, 367161372275282, 198858928432309 @ -150, 301, 103
187778454146124, 40614503086374, 163589932375941 @ 108, 135, 159
342873906050137, 400554432274475, 349934777894917 @ -91, -245, -101
259623216231446, 102451617930149, 367824030900247 @ 30, 61, -59
302674476428492, 308751318155678, 304105952245157 @ -28, -123, -23
306083765461093, 329855652113459, 193483945469313 @ -135, 75, 135
222861561619734, 186436936718994, 247429153504095 @ 118, 278, 5
271871492342376, 454602039830210, 109270234270313 @ -29, -429, 604
245344511925900, 297404983192638, 198409200390885 @ 87, 193, 117
278239230434962, 348405646687548, 193019044020999 @ -106, 356, 153
270797799177100, 217713475513674, 175271686340057 @ 12, 77, 160
262740822837189, 312644730856547, 259896197501184 @ 25, -5, -30
298593236083596, 366386336617060, 103267600804945 @ -68, -125, 365
208822321730157, 42265003067504, 238084126406189 @ 79, 88, 83
108118685355512, 219797964373938, 105546235007649 @ 255, 23, 258
330634765891935, 219190602847191, 231832817202474 @ -41, -77, 88
202159945112220, 140116732196522, 305561521958973 @ 100, 64, -9
223050588845952, 245483193435022, 254052175047633 @ 175, 414, -96
503630118029934, 378079828125717, 434082636655869 @ -274, -223, -173
298555830226564, 191451522696062, 287545461710939 @ -12, -30, 25
324159958913852, 248450966769244, 342728258499239 @ -60, -33, -82
314517762779097, 349440957183984, 205228421198903 @ -185, 32, 89
266212298651504, 171460733313258, 380429582339169 @ 23, -13, -72
317994050937080, 301051660781246, 198845392941501 @ -135, 82, 117
311941891479614, 255545512928432, 229357266604569 @ -37, -63, 81
237364476752480, 322552819789503, 488152126395023 @ 56, -163, -215
258668906790414, 230205007939722, 385703859289909 @ 31, -76, -77
243134377350144, 260648329165182, 272339626471077 @ 63, 34, -21
267683532435975, 281682703245099, 268080089056959 @ 15, 23, -27
377281621527968, 502432868669034, 249641254149725 @ -99, -367, 65
247338277249146, 144008136640224, 432415032369663 @ 50, 156, -243
266554903796825, 263319558740455, 301413059675744 @ 21, -57, -22
233914720514284, 37181431982612, 370054691441124 @ 60, 168, -78
325826459785859, 169375752559272, 130522378213044 @ -39, -16, 192
203810720469702, 325280408675604, 334959042069411 @ 114, -132, -83
230133339384240, 450453480564866, 124520745013781 @ 61, -309, 199
273011542414888, 371235623860286, 218651111095253 @ -33, 18, 7
230532729819509, 34346941945857, 397654044835509 @ 65, 185, -117
265086426496914, 407619968770722, 197495929145784 @ -26, 30, 112
335995530793047, 136137539631348, 335634805086802 @ -53, 32, -28
271122781780368, 418306553470866, 221147200816995 @ -30, -224, -24
309831078858084, 225611759552358, 285367490254929 @ -62, 92, -42
249987450822323, 60978825223067, 315464448651347 @ 41, 129, -11
292039278974688, 400721711934870, 210700008378585 @ -75, -192, 76
245591024236514, 44793538323744, 316423837913597 @ 53, 317, -65
351840907973192, 286555588535230, 186322275187189 @ -145, -14, 143
169609428182772, 194351341889262, 188958018402477 @ 181, 104, 136
355169805132444, 258428387260130, 443421952388813 @ -92, -68, -193
210008330355016, 293537801988098, 345420318873657 @ 81, -147, -30
369164942037654, 292217970322268, 294174413047019 @ -77, -153, 28
291449335745664, 159904393244847, 258322374675159 @ -8, 37, 49
333894297675593, 205433073591445, 144117732295597 @ -93, 87, 211
145162270009864, 269486019837482, 261539440527649 @ 213, -33, 20
244401372200244, 267938373107822, 299893815094669 @ 61, 24, -76
345401432572404, 180206204039472, 307158673938909 @ -124, 164, -77
298063340880298, 395243527392880, 188730721630429 @ -154, -120, 163
265136068398132, 334129371267054, 230271159877725 @ 19, -52, 40
214101022607742, 262682961019245, 347915589183915 @ 134, 85, -215
233000498698324, 295849690267910, 490748652807373 @ 63, -123, -238
391624177635684, 196230504907722, 532912406524419 @ -140, 14, -311
313006105065504, 185319692135382, 288814113874389 @ -66, 158, -45
264402427025394, 408486928864494, 258041049232503 @ 13, -182, -194
219645571453581, 313369414869886, 66692959569850 @ 121, -30, 412
261002987774010, 405423711999420, 185932906438239 @ 34, -8, 253
327289072454519, 257256772432737, 224237084384299 @ -63, -49, 85
322824447417817, 368284700764508, 266896048352700 @ -153, -108, -84
175226642885726, 75479445324584, 344414123132473 @ 125, 111, -43
243362424470832, 96013032062802, 360030923196897 @ 46, 44, -39
268816654099483, 205855027832507, 260594437434693 @ 17, 49, 27
248222360711726, 189929340942145, 200672029917979 @ 62, 325, 113
230330300063038, 404953371024588, 369414629010453 @ 119, -217, -381
237343193624924, 280788778457342, 204724483115941 @ 113, 234, 95
242405010417864, 264892954218222, 292937860806384 @ 56, -46, -18
332498850236224, 325138662783306, 231249677582881 @ -112, -82, 55
263639040914889, 38401786921122, 342730458917784 @ 25, 262, -82
218474904166732, 245384336413117, 125500724228881 @ 156, 259, 335
297918707108537, 311318793877292, 327615715474673 @ -31, -96, -89
360711958483584, 92323556857830, 489171391321989 @ -67, 36, -157
272553443681276, 306343987185483, 278263172057735 @ 12, -109, 5
307390018325084, 51786575316802, 441202715916329 @ -24, 141, -154
299422099286625, 304679214588956, 257063590423806 @ -155, 312, -168
350506680018778, 148976385996532, 524425623601957 @ -85, 69, -293
192054885922170, 276076344099294, 363577553775924 @ 130, -62, -122
263413926289070, 165834017125147, 351553006904295 @ 26, -11, -39
309122230994010, 227530714896650, 306365841338999 @ -35, -20, -22
263366029857872, 320532623531158, 214464986306635 @ 24, -54, 85
238607732164250, 225455404876368, 136361495912221 @ 75, 131, 247
413936643962610, 281473579789059, 407691624810468 @ -230, -37, -234
328911602444460, 295912496898814, 118122568361397 @ -98, -38, 270
293695444608048, 278857379054622, 271632174818709 @ -15, -86, 23
304917059711901, 362391013629467, 218011157144142 @ -113, -71, 54
268531497790177, 280351863537766, 367367379355770 @ 17, -54, -144
289924894096818, 83518548641551, 93645414862190 @ -50, 661, 406
119152761400388, 47885734911542, 96624246682991 @ 200, 174, 244
276016057564979, 311069225432842, 225792131615539 @ -13, 46, 41
354528137387199, 161057576685552, 368556959826324 @ -109, 108, -130
93373025092734, 31560033367062, 342613634383029 @ 194, 106, -21
180450881366312, 172434592874152, 128712793734571 @ 134, 49, 212
266515704941168, 395680134387674, 211259294201051 @ -18, 16, -10
308228606199117, 279871657566006, 251530416102198 @ -65, 10, 14
285839604735704, 361878798692930, 205927992085477 @ -57, -53, 91
318217364028339, 119238583096722, 346285719265734 @ -27, 14, -22
285645040710510, 311141908633782, 371632819892253 @ -9, -106, -145
213174469458839, 267586830247745, 64760105506427 @ 203, 297, 601
260746874212976, 125393308372834, 401669328134857 @ 29, 115, -148
316579685215169, 161169142659017, 86612546763899 @ -55, 117, 289
168450263357382, 287130874518513, 302507684816934 @ 226, 15, -102
306465314173414, 183275273448682, 314027746942129 @ -97, 396, -203
114471038738714, 253351731991702, 109747065682459 @ 273, 6, 268
249007845691836, 314051108063382, 270695482961433 @ 64, 44, -90
392931560877804, 236558028127398, 272702483022501 @ -152, -23, 19
324247104297256, 140462149447589, 198417128132543 @ -48, 63, 121
"""