<map version="0.8.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1160937967718" ID="Freemind_Link_49516585" MODIFIED="1160947811984" TEXT="C">
<font BOLD="true" NAME="Dialog" SIZE="20"/>
<node CREATED="1160951008906" FOLDED="true" HGAP="106" ID="_" MODIFIED="1165772409453" POSITION="right" TEXT="variables" VSHIFT="16">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163430233251" FOLDED="true" ID="Freemind_Link_52409269" MODIFIED="1163605059550" TEXT="declaration:">
<node CREATED="1163605000052" ID="Freemind_Link_358958623" MODIFIED="1163605016908" TEXT="name"/>
<node CREATED="1163605019594" ID="Freemind_Link_1274679131" MODIFIED="1163605030162" TEXT="type of variable"/>
<node CREATED="1163605033458" ID="Freemind_Link_1461115454" MODIFIED="1163605037205" TEXT="*no memory allocated"/>
<node CREATED="1163638231393" FOLDED="true" ID="Freemind_Link_1963646023" MODIFIED="1165774474687" TEXT="extern declaration">
<node CREATED="1163638615293" ID="Freemind_Link_1743574924" MODIFIED="1163638922714" TEXT="extern &lt;type&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163638647415" ID="Freemind_Link_1706348460" LINK="#Freemind_Link_1453561893" MODIFIED="1163638682390" TEXT="only for variables in file scope"/>
<node CREATED="1163638274169" ID="Freemind_Link_1154000193" MODIFIED="1163638316978" TEXT="informs that the variable is defined in other compilation unit"/>
<node CREATED="1163638833606" ID="Freemind_Link_1567900034" MODIFIED="1163638885708" TEXT="incomplete type is allowed"/>
</node>
</node>
<node CREATED="1163430242188" FOLDED="true" ID="Freemind_Link_87400589" MODIFIED="1163605052155" TEXT="definition:&#xa;">
<node CREATED="1163605000052" ID="Freemind_Link_884201214" MODIFIED="1163605016908" TEXT="name"/>
<node CREATED="1163605019594" ID="Freemind_Link_147044717" MODIFIED="1163605030162" TEXT="type of variable"/>
<node CREATED="1163605085713" ID="Freemind_Link_955343677" MODIFIED="1163605093015" TEXT="*memory is allocated"/>
</node>
<node CREATED="1163431360115" FOLDED="true" ID="Freemind_Link_1202704753" MODIFIED="1163431362368" TEXT="const">
<node CREATED="1163699539214" ID="Freemind_Link_718297277" MODIFIED="1163699563748" TEXT="const int x = 33;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163699565992" ID="Freemind_Link_203476847" MODIFIED="1163699619267" TEXT="variable x value cannot be changed"/>
<node CREATED="1163699653334" ID="Freemind_Link_742113329" LINK="#Freemind_Link_1120917461" MODIFIED="1163699729704" TEXT="uses of const with pointers"/>
</node>
<node CREATED="1163700137239" ID="Freemind_Link_1396314011" MODIFIED="1163700143265" TEXT="volatile"/>
<node CREATED="1163625665292" FOLDED="true" ID="Freemind_Link_1123476240" MODIFIED="1163625676012" TEXT="internal variable">
<node CREATED="1163625705522" ID="Freemind_Link_1743028862" MODIFIED="1163625795326" TEXT="inside function"/>
</node>
<node CREATED="1163625679566" FOLDED="true" ID="Freemind_Link_163442425" MODIFIED="1163625691309" TEXT="external variable">
<node CREATED="1163625732632" ID="Freemind_Link_1412219730" MODIFIED="1163625747559" TEXT="declared outside any function"/>
</node>
<node CREATED="1163630328555" FOLDED="true" ID="Freemind_Link_1485397179" MODIFIED="1163630333985" TEXT="scope">
<node CREATED="1163630341509" FOLDED="true" ID="Freemind_Link_1116368792" MODIFIED="1163630365505" TEXT="block scope">
<node CREATED="1163630425573" ID="Freemind_Link_852294731" MODIFIED="1163630663280" TEXT="var in the beginning of a block"/>
<node CREATED="1163630437315" ID="Freemind_Link_332402738" MODIFIED="1163630674987" TEXT="var in the parameter list of a function declaration"/>
<node CREATED="1163630770793" ID="Freemind_Link_469658822" MODIFIED="1163630819297" TEXT="var visible in the block (can be hidden in inner block)"/>
</node>
<node CREATED="1163630347763" FOLDED="true" ID="Freemind_Link_1453561893" MODIFIED="1163630352142" TEXT="file scope">
<node CREATED="1163630701534" ID="Freemind_Link_272591608" MODIFIED="1163630738678" TEXT="var outside any block or function parameter list"/>
<node CREATED="1163630834086" FOLDED="true" ID="Freemind_Link_579392420" MODIFIED="1163630909041" TEXT="var visible">
<node CREATED="1163630897214" ID="Freemind_Link_652001817" MODIFIED="1163630905426" TEXT="from declaration"/>
<node CREATED="1163630906919" ID="Freemind_Link_294255701" MODIFIED="1163630940904" TEXT="to the end of the compilation unit"/>
<node CREATED="1163630954979" ID="Freemind_Link_1817928889" MODIFIED="1163630965424" TEXT="can be hidden in inner block"/>
</node>
</node>
<node CREATED="1163630353587" FOLDED="true" ID="Freemind_Link_134876426" MODIFIED="1163632401868" TEXT="function scope">
<font NAME="SansSerif" SIZE="10"/>
<node CREATED="1163631126481" ID="Freemind_Link_1461583178" MODIFIED="1163632430105" TEXT="only labels have this scope">
<font NAME="SansSerif" SIZE="9"/>
</node>
<node CREATED="1163631192059" ID="Freemind_Link_259571447" MODIFIED="1163632430101" TEXT="label_name : &lt;any-statement&gt;">
<font NAME="Monospaced" SIZE="9"/>
</node>
</node>
<node CREATED="1163630367962" FOLDED="true" ID="Freemind_Link_447462333" MODIFIED="1163632404301" TEXT="function prototype scope">
<font NAME="SansSerif" SIZE="10"/>
<node CREATED="1163631254932" ID="Freemind_Link_184337520" MODIFIED="1163632419851" TEXT="parameters in function prototype&apos;s declaration" VSHIFT="2">
<font NAME="SansSerif" SIZE="9"/>
</node>
</node>
</node>
<node CREATED="1163627094886" FOLDED="true" ID="Freemind_Link_1843710845" MODIFIED="1163630071066" TEXT="storage classes">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163628058973" FOLDED="true" ID="Freemind_Link_1979710134" MODIFIED="1163630249192" TEXT="automatic variables" VSHIFT="-1">
<node CREATED="1163628336934" ID="Freemind_Link_877182200" MODIFIED="1163628775128" TEXT="auto &lt;type&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163628205026" ID="Freemind_Link_1688677846" MODIFIED="1163628223855" TEXT="declared at the beginning of a block"/>
<node CREATED="1163628226495" ID="Freemind_Link_1654999278" MODIFIED="1163628246766" TEXT="private to the block"/>
<node CREATED="1163628280147" ID="Freemind_Link_305821822" MODIFIED="1163628300698" TEXT="not automatically initialized"/>
<node CREATED="1163628308332" ID="Freemind_Link_119860584" MODIFIED="1163628323044" TEXT="allocated on the stack"/>
<node COLOR="#ff0000" CREATED="1163628420728" ID="Freemind_Link_1727196989" MODIFIED="1163630212269" TEXT="variables with block scope have auto as default" VSHIFT="-1">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1163628499245" FOLDED="true" HGAP="21" ID="Freemind_Link_870326231" MODIFIED="1163640402360" TEXT="Register variables" VSHIFT="14">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1163628654234" ID="Freemind_Link_843788694" MODIFIED="1163628716401" TEXT="register &lt;type&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163640412429" ID="Freemind_Link_854895047" MODIFIED="1163640427252" TEXT="similar to automatic variables"/>
<node CREATED="1163628591518" ID="Freemind_Link_1146273983" MODIFIED="1163628640681" TEXT="may be stored in a register"/>
<node CREATED="1163628952181" ID="Freemind_Link_1596674489" MODIFIED="1163628994751" TEXT="cannot get address (&amp; operator)"/>
</node>
<node CREATED="1163628066997" FOLDED="true" ID="Freemind_Link_1295891882" MODIFIED="1163636728055" TEXT="static variables" VSHIFT="20">
<node CREATED="1163629250319" ID="Freemind_Link_1328711151" MODIFIED="1163629271618" TEXT="static &lt;type&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163629120953" ID="Freemind_Link_1609410543" MODIFIED="1163629155725" TEXT="exist throughout the duration of the programme"/>
<node CREATED="1163629173291" FOLDED="true" ID="Freemind_Link_1898515496" MODIFIED="1163629957095" TEXT="can be declared everywere">
<node CREATED="1163629219850" ID="Freemind_Link_985209319" MODIFIED="1163629240526" TEXT="inside a block"/>
<node CREATED="1163629226570" ID="Freemind_Link_561054446" MODIFIED="1163629235105" TEXT="outside of a block"/>
</node>
<node CREATED="1163629440738" FOLDED="true" ID="Freemind_Link_1058652905" MODIFIED="1163629526586" TEXT="initialised">
<node CREATED="1163629528141" ID="Freemind_Link_1096221667" MODIFIED="1163629532807" TEXT="only once"/>
<node CREATED="1163629501289" ID="Freemind_Link_266367778" MODIFIED="1163629538092" TEXT="by a constant" VSHIFT="5"/>
<node CREATED="1163629571601" ID="Freemind_Link_1784923375" MODIFIED="1163629736237" TEXT="automatically by 0 (or NULL)"/>
</node>
<node COLOR="#ff0000" CREATED="1163629756533" ID="Freemind_Link_1867261355" MODIFIED="1163629930133" TEXT="variables declared outside any block have static storage class by default">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
</node>
</node>
</node>
<node CREATED="1163636367620" FOLDED="true" HGAP="161" ID="Freemind_Link_1415416589" MODIFIED="1165772493109" POSITION="right" TEXT="Program Structure" VSHIFT="8">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163636523250" FOLDED="true" ID="Freemind_Link_748804338" MODIFIED="1163637592765" TEXT="compilation unit">
<node CREATED="1163636972242" ID="Freemind_Link_834168834" MODIFIED="1163639236082" TEXT="independent file with code">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1163636107647" FOLDED="true" HGAP="22" ID="Freemind_Link_1650120901" MODIFIED="1163636734415" TEXT="linkage" VSHIFT="17">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163636689904" FOLDED="true" ID="Freemind_Link_475642289" MODIFIED="1163638562266" TEXT="external">
<node CREATED="1163636900397" ID="Freemind_Link_767673132" MODIFIED="1163639541756" TEXT="public = visible for other compilation units">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1163637324696" FOLDED="true" ID="Freemind_Link_663441748" MODIFIED="1163639561642" TEXT="public variables">
<node CREATED="1163639562920" ID="Freemind_Link_1347603467" MODIFIED="1163639631334" TEXT="must be in file scope"/>
<node COLOR="#ff0000" CREATED="1163637401697" ID="Freemind_Link_1209493987" MODIFIED="1163639219036" TEXT="external linkage by default">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1163638491326" ID="Freemind_Link_1849526706" MODIFIED="1163638506738" TEXT="must be defined only once"/>
<node COLOR="#006699" CREATED="1163638509130" ID="Freemind_Link_1584518358" LINK="#Freemind_Link_1963646023" MODIFIED="1165774474687" TEXT="must be declared in other units with &quot;extern&quot; keyword">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1163639115585" FOLDED="true" ID="Freemind_Link_1159532405" MODIFIED="1163639888074" TEXT="public functions" VSHIFT="4">
<node COLOR="#ff0000" CREATED="1163637401697" ID="Freemind_Link_982556155" MODIFIED="1163637434114" TEXT="external linkage by default">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1163639861223" ID="Freemind_Link_389876564" MODIFIED="1163639920010" TEXT="&quot;extern&quot; keyword is optional"/>
</node>
</node>
<node CREATED="1163636695853" FOLDED="true" HGAP="21" ID="Freemind_Link_383825783" MODIFIED="1163639390302" TEXT="internal" VSHIFT="26">
<node CREATED="1163636912642" ID="Freemind_Link_975616097" MODIFIED="1163639649171" TEXT="private = invisible for other compilation units">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1163637324696" FOLDED="true" ID="Freemind_Link_505013206" MODIFIED="1163639618518" TEXT="private variables">
<node CREATED="1163639562920" ID="Freemind_Link_992543198" MODIFIED="1163639600413" TEXT="from file scope"/>
<node COLOR="#ff0000" CREATED="1163637470069" ID="Freemind_Link_16212497" MODIFIED="1163639415187" TEXT="with static keyword">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1163637529597" ID="Freemind_Link_630099561" MODIFIED="1163637562055" TEXT="static &lt;type&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1163639115585" FOLDED="true" ID="Freemind_Link_1592516252" MODIFIED="1163639513048" TEXT="private functions">
<node COLOR="#ff0000" CREATED="1163637470069" ID="Freemind_Link_1436328576" MODIFIED="1163639422166" TEXT="with static keyword">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1163639435252" ID="Freemind_Link_101713576" MODIFIED="1163639487979" TEXT="static &lt;type&gt; func_name(&lt;params&gt;) {...};">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1163640088873" FOLDED="true" ID="Freemind_Link_1255561124" MODIFIED="1163640567484" TEXT="header files contain:">
<node CREATED="1163640131195" ID="Freemind_Link_926877923" MODIFIED="1163640150940" TEXT="function prototypes (declarations)"/>
<node CREATED="1163640152873" ID="Freemind_Link_1289724094" MODIFIED="1163640180359" TEXT="constants &amp; macro definitions"/>
<node CREATED="1163640183667" ID="Freemind_Link_1349832884" MODIFIED="1163640190117" TEXT="type definitions"/>
<node CREATED="1163640191931" ID="Freemind_Link_1900744809" MODIFIED="1163640197347" TEXT="global variables"/>
</node>
</node>
<node CREATED="1160951047906" FOLDED="true" HGAP="56" ID="Freemind_Link_1612661436" MODIFIED="1165855787625" POSITION="left" TEXT="statements" VSHIFT="-13">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164392170687" FOLDED="true" HGAP="31" ID="Freemind_Link_1241581795" MODIFIED="1164392335656" TEXT="typedef" VSHIFT="-17">
<edge WIDTH="thin"/>
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164392271203" ID="Freemind_Link_1875464359" MODIFIED="1164392291562" TEXT="use for making new type names"/>
<node CREATED="1164392379078" ID="Freemind_Link_216714824" MODIFIED="1164392465593" TEXT="typedef &lt;type-description&gt; &lt;new-type&gt;;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164392537312" FOLDED="true" ID="Freemind_Link_1992993451" MODIFIED="1164392555515" TEXT="Examples" VSHIFT="11">
<node CREATED="1164392572328" FOLDED="true" ID="Freemind_Link_915211803" MODIFIED="1164392595546" TEXT="create new type: student">
<node CREATED="1164392470046" HGAP="41" ID="Freemind_Link_1368033008" MODIFIED="1164392685718" TEXT="typedef struct &#xa;{&#xa;   char name[80];&#xa;   int id;&#xa;} student;" VSHIFT="-43">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164392633390" FOLDED="true" HGAP="28" ID="Freemind_Link_1226313162" MODIFIED="1164392694718" TEXT="create string80 type" VSHIFT="6">
<node CREATED="1164392653078" HGAP="28" ID="Freemind_Link_282000489" MODIFIED="1164392689156" TEXT="typedef char string80[80];" VSHIFT="1">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1164425681671" FOLDED="true" ID="Freemind_Link_1689294254" MODIFIED="1164426263187" TEXT="enums" VSHIFT="13">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164425694000" ID="Freemind_Link_1305949342" MODIFIED="1164425736328" TEXT="specifies the possible values of an object from a predefined list"/>
<node CREATED="1164425825250" ID="Freemind_Link_1737749011" MODIFIED="1164426035765" TEXT="enum &lt;type-name&gt; { &lt;enum-constants&gt; } [&lt;enum-variable&gt;];">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164425754671" HGAP="21" ID="Freemind_Link_399775730" MODIFIED="1164426255484" TEXT="compatible with signed int type" VSHIFT="-2"/>
</node>
<node CREATED="1164474310593" FOLDED="true" ID="Freemind_Link_1141129029" MODIFIED="1165855783281" TEXT="sizeof" VSHIFT="20">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164474282453" ID="Freemind_Link_1955771373" MODIFIED="1164474328906" TEXT="gets size of specified type"/>
<node CREATED="1160952071328" ID="Freemind_Link_1268931748" MODIFIED="1164463086921" TEXT="int sizeof(&lt;type-name or expression&gt;);" VSHIFT="5">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1160951122031" FOLDED="true" HGAP="181" ID="Freemind_Link_1375742953" MODIFIED="1165772507671" POSITION="right" TEXT="functions" VSHIFT="9">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163435360792" FOLDED="true" ID="Freemind_Link_1990192681" MODIFIED="1163640026205" TEXT="function prototype = function declaration">
<node CREATED="1163639765129" ID="Freemind_Link_1566737615" MODIFIED="1163639798346" TEXT="&lt;type&gt; func_name (&lt;params&gt;);"/>
</node>
<node CREATED="1163639938007" FOLDED="true" ID="Freemind_Link_1548454781" MODIFIED="1163639954772" TEXT="function definition">
<node CREATED="1163639961393" ID="Freemind_Link_616869943" MODIFIED="1163639998223" TEXT="&lt;type&gt; func_name (&lt;params&gt;)  { &lt;func_body&gt; };"/>
</node>
<node COLOR="#006699" CREATED="1163698544752" FOLDED="true" ID="Freemind_Link_119097805" MODIFIED="1163698579475" TEXT="passing arguments">
<node CREATED="1163698559522" ID="Freemind_Link_1547345089" MODIFIED="1163698604418" TEXT="call by value is default"/>
<node CREATED="1163698592079" ID="Freemind_Link_238520832" MODIFIED="1163698758651" TEXT="call by reference with pointers"/>
</node>
<node CREATED="1163710334333" ID="Freemind_Link_268139590" LINK="#Freemind_Link_415918997" MODIFIED="1163710347275" TEXT="pointers to functions"/>
</node>
<node CREATED="1160951129015" FOLDED="true" HGAP="135" ID="Freemind_Link_825101701" MODIFIED="1165772752734" POSITION="left" TEXT="preprocessor" VSHIFT="-21">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163603471713" ID="Freemind_Link_1774491543" MODIFIED="1163628851895" TEXT="#include &lt;filename&gt;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603682350" ID="Freemind_Link_576423923" MODIFIED="1163628851897" TEXT="#include &quot;filename&quot;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603482061" ID="Freemind_Link_1273076728" MODIFIED="1163628851898" TEXT="#define &lt;ident&gt; &lt;replacement-list&gt;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603574679" ID="Freemind_Link_1997597572" MODIFIED="1163628851900" TEXT="#define &lt;ident&gt;(&lt;argument-list&gt;) &lt;replacement-list&gt;" VSHIFT="-9">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603486545" ID="Freemind_Link_1113951262" MODIFIED="1163628851902" TEXT="#undef &lt;ident&gt;" VSHIFT="1">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603876086" ID="Freemind_Link_1413239343" MODIFIED="1163628851905" TEXT="#if &lt;constant-expression&gt;" VSHIFT="12">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603844356" ID="Freemind_Link_1324635896" MODIFIED="1163628851907" TEXT="#ifdef &lt;ident&gt;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163603915552" ID="Freemind_Link_1105727276" MODIFIED="1163628851908" TEXT="#ifndef &lt;ident&gt;">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1160951145968" FOLDED="true" HGAP="204" ID="Freemind_Link_892087201" MODIFIED="1165772758875" POSITION="left" TEXT="pointers" VSHIFT="-9">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163697975780" ID="Freemind_Link_325074994" MODIFIED="1163698010839" TEXT="&lt;type&gt; *ptr_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163698016935" ID="Freemind_Link_1198987095" MODIFIED="1163698054633" TEXT="&amp; = address operator"/>
<node CREATED="1163698092952" ID="Freemind_Link_631770949" MODIFIED="1163698141194" TEXT="* = dereferencing or indirection operator "/>
<node CREATED="1163698348760" ID="Freemind_Link_1046395617" MODIFIED="1163698453058" TEXT="can cast pointers (e.g. char* to int*)"/>
<node COLOR="#006699" CREATED="1163699703432" FOLDED="true" ID="Freemind_Link_1120917461" MODIFIED="1163711645575" TEXT="const">
<node CREATED="1163699823092" FOLDED="true" ID="Freemind_Link_1619333177" MODIFIED="1163699835240" TEXT="pointer to a constant integer">
<node CREATED="1163699739639" ID="Freemind_Link_1808530850" MODIFIED="1163700562772" TEXT="const int *x;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163699841705" ID="Freemind_Link_780141787" MODIFIED="1163699874011" TEXT="the value in *x cannot be changed"/>
</node>
<node CREATED="1163699897512" FOLDED="true" ID="Freemind_Link_1475365121" MODIFIED="1163699917927" TEXT="a constant pointer">
<node CREATED="1163699922734" ID="Freemind_Link_1603383617" MODIFIED="1163700562769" TEXT="int *const x;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163699947995" ID="Freemind_Link_1152578140" MODIFIED="1163700005326" TEXT="the address stored in pointer x cannot be changed"/>
</node>
<node CREATED="1163700033033" FOLDED="true" ID="Freemind_Link_1700937685" MODIFIED="1163700054999" TEXT="a const pointer to a const integer">
<node CREATED="1163700010139" ID="Freemind_Link_48387855" MODIFIED="1163700562766" TEXT="const int *const x;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163700067235" ID="Freemind_Link_1607753546" MODIFIED="1163700108402" TEXT="neither the pointer nor the integer can be modified"/>
</node>
</node>
<node COLOR="#006699" CREATED="1163700301790" FOLDED="true" ID="Freemind_Link_306179898" MODIFIED="1163711641832" TEXT="equivalence between pointers &amp; array identifiers">
<node CREATED="1163700381559" ID="Freemind_Link_1130998095" MODIFIED="1163700674143" TEXT="int arr[10];&#xa;int* ptr = &amp;arr[0]; //or ptr = arr;&#xa;*(ptr+i) == a[i];&#xa;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163705495295" ID="Freemind_Link_401264557" MODIFIED="1163705531137" TEXT="operator [] can be used for arrays &amp; pointers "/>
<node CREATED="1163706243959" ID="Freemind_Link_1948230020" MODIFIED="1163706274625" TEXT="&quot;int *x&quot; = &quot;int x[]&quot;"/>
</node>
<node CREATED="1163709534339" FOLDED="true" ID="Freemind_Link_965922552" MODIFIED="1163709547975" TEXT="pointer addition">
<node CREATED="1163709549372" ID="Freemind_Link_1671910882" MODIFIED="1163709674030" TEXT="if pointer p is a pointer to type t, then&#xa;p+i = p + i*sizeof(t)  (bytes)"/>
</node>
<node CREATED="1163709747076" FOLDED="true" ID="Freemind_Link_1806266259" MODIFIED="1163709774827" TEXT="subtracting pointer with other pointer">
<node CREATED="1163709797547" ID="Freemind_Link_765630781" MODIFIED="1163709952681" TEXT="int *a=0xF000, *b=a+4;&#xa;b-a = 4 (int)"/>
</node>
<node CREATED="1163710016314" FOLDED="true" ID="Freemind_Link_1004194395" MODIFIED="1163711687856" TEXT="NULL pointers" VSHIFT="8">
<node CREATED="1163710033166" ID="Freemind_Link_185785972" MODIFIED="1163710071862" TEXT="#define NULL 0&#xa;in &lt;stdio.h&gt; or &lt;stdlib.h&gt;"/>
</node>
<node CREATED="1163710205101" FOLDED="true" ID="Freemind_Link_1757990255" MODIFIED="1163711685944" TEXT="void* pointers" VSHIFT="12">
<node CREATED="1163710545474" ID="Freemind_Link_1928246807" MODIFIED="1163710560071" TEXT="can point to any type of data"/>
<node CREATED="1163710562163" ID="Freemind_Link_1437119760" MODIFIED="1163710724396" TEXT="should be casted to specific type before using"/>
</node>
<node COLOR="#006699" CREATED="1163710318232" FOLDED="true" ID="Freemind_Link_415918997" MODIFIED="1163711683675" TEXT="pointers to functions" VSHIFT="12">
<node CREATED="1163710649768" ID="Freemind_Link_502564876" MODIFIED="1163710708856" TEXT="&lt;type&gt; (*ptr_name)(&lt;params&gt;);">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1163711165829" ID="Freemind_Link_1986151111" MODIFIED="1163711230600" TEXT="function names are pointers to the function code"/>
<node CREATED="1163710864514" FOLDED="true" ID="Freemind_Link_1045435542" MODIFIED="1163710877994" TEXT="examples">
<node CREATED="1163710979613" FOLDED="true" ID="Freemind_Link_1902050898" MODIFIED="1163710993791" TEXT="pointer to float value">
<node CREATED="1163710914869" ID="Freemind_Link_1366827865" MODIFIED="1163711095709" TEXT="float *ptr;">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1163711017891" FOLDED="true" ID="Freemind_Link_206376533" MODIFIED="1163711048155" TEXT="function returning a pointer to float value">
<node CREATED="1163710925050" ID="Freemind_Link_1934360148" MODIFIED="1163711095706" TEXT="float* fun();">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1163711060626" FOLDED="true" ID="Freemind_Link_363747962" MODIFIED="1163711079953" TEXT="pointer to a function returning a float value">
<node CREATED="1163710879216" ID="Freemind_Link_238890618" MODIFIED="1163711095702" TEXT="float (*fun_ptr)();">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1163711795088" FOLDED="true" ID="Freemind_Link_1291536107" MODIFIED="1163711818372" TEXT="calling the function">
<node CREATED="1163711819937" ID="Freemind_Link_1152650972" MODIFIED="1163711847595" TEXT="result = (*fun_ptr)(3,4);"/>
</node>
</node>
<node CREATED="1164389580453" ID="Freemind_Link_1515785401" LINK="#Freemind_Link_16990362" MODIFIED="1164389600640" TEXT="pointers to structures"/>
</node>
<node CREATED="1160951232296" FOLDED="true" HGAP="223" ID="Freemind_Link_781340941" MODIFIED="1165772765296" POSITION="left" TEXT="Dynamic Memory" VSHIFT="2">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1160952060281" FOLDED="true" ID="Freemind_Link_243644004" MODIFIED="1164474254562" TEXT="allocate raw memory">
<edge WIDTH="thin"/>
<node CREATED="1160952287250" ID="Freemind_Link_1778933837" MODIFIED="1163628895056" TEXT="int* array = (int*) malloc(count * sizeof(int));">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164474124312" FOLDED="true" ID="Freemind_Link_1664943479" MODIFIED="1164474134968" TEXT="allocate and zero fill">
<node CREATED="1164463636984" ID="Freemind_Link_958461501" MODIFIED="1164474362250" TEXT="void* calloc(int numberOfObj, int sizeOfObj);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164474380734" FOLDED="true" ID="Freemind_Link_203551936" MODIFIED="1164474381921" TEXT="Release memory">
<node CREATED="1164463289500" ID="Freemind_Link_501872044" MODIFIED="1164474407625" TEXT="void free(&lt;pointer&gt;);">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164463359390" ID="Freemind_Link_1333076517" MODIFIED="1164474424890" TEXT="free(NULL) does nothing">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="help"/>
</node>
</node>
<node CREATED="1164474191593" FOLDED="true" ID="Freemind_Link_1811770560" MODIFIED="1164474193796" TEXT="Change size of existing allocation">
<node CREATED="1164474166921" ID="Freemind_Link_491723414" MODIFIED="1164474496937" TEXT="void *realloc(void *ptr, size_t newSize);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node COLOR="#669900" CREATED="1164474640937" FOLDED="true" ID="Freemind_Link_848978127" MODIFIED="1164474876156" TEXT="allocating dynamic memory on stack">
<font NAME="SansSerif" SIZE="10"/>
<node COLOR="#669900" CREATED="1164474671312" ID="Freemind_Link_1821495034" MODIFIED="1164474872843" TEXT="nonstandard (not POSIX, not portable)">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#669900" CREATED="1164474766593" ID="Freemind_Link_1800190626" MODIFIED="1164474877484" TEXT="void *alloca(size_t size);">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
</node>
<node CREATED="1160951139890" FOLDED="true" HGAP="161" ID="Freemind_Link_757504046" MODIFIED="1165772726484" POSITION="left" TEXT="arrays" VSHIFT="10">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163605545398" FOLDED="true" ID="Freemind_Link_1029782231" MODIFIED="1163628827477" TEXT="&lt;completed-type&gt; &lt;ident&gt; [&lt;const-size&gt;];">
<font NAME="Monospaced" SIZE="12"/>
<node CREATED="1163605601525" ID="Freemind_Link_1473965416" MODIFIED="1163605641034" TEXT="completed-type is a type whose size is known from the compiler"/>
</node>
<node CREATED="1163614337959" FOLDED="true" ID="Freemind_Link_1027614392" MODIFIED="1163614354299" TEXT="incomplete array declaration">
<node CREATED="1163614308718" HGAP="26" ID="Freemind_Link_1021111690" MODIFIED="1163614359984" TEXT="&lt;completed-type&gt; array-name[];" VSHIFT="5"/>
</node>
<node CREATED="1163614620405" FOLDED="true" ID="Freemind_Link_1919382773" MODIFIED="1163629007912" TEXT="arrays of arrays">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1163614679541" FOLDED="true" ID="Freemind_Link_51514214" MODIFIED="1163614690137" TEXT="row major order">
<node CREATED="1163614692754" ID="Freemind_Link_1607254831" MODIFIED="1163614719458" TEXT="array are stored row after row"/>
</node>
<node CREATED="1163707545451" FOLDED="true" ID="Freemind_Link_640909646" MODIFIED="1163708186359" TEXT="array of 2 arrays of 3 doubles">
<node CREATED="1163707706776" ID="Freemind_Link_691524784" MODIFIED="1163708249809" TEXT="double a[2][3] = double (*a)[3]">
<edge WIDTH="thin"/>
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1163707798123" FOLDED="true" ID="Freemind_Link_1556872469" MODIFIED="1163708285969" TEXT="array of 3 pointers to doubles">
<node CREATED="1163707684507" ID="Freemind_Link_1144813157" MODIFIED="1163708264781" TEXT="double *a[3] = (double *) a[3]">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1164468617453" FOLDED="true" ID="Freemind_Link_1858614483" MODIFIED="1164468752468" TEXT="modifying offset of a 1D array" VSHIFT="9">
<node CREATED="1164468652046" ID="Freemind_Link_1390043375" MODIFIED="1164468842078" TEXT="int arr[4], *arrFrom1;&#xa;arrFrom1 = arr - 1;&#xa;// arrFrom1[1] == arr[0], ..., &#xa;// arrFrom1[4] == arr[3]">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164469088328" FOLDED="true" ID="Freemind_Link_1046428338" MODIFIED="1164469307406" TEXT="Matrices" VSHIFT="10">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164473799734" FOLDED="true" ID="Freemind_Link_467657523" MODIFIED="1164473813218" TEXT="fixed-size array">
<node CREATED="1164473816234" ID="Freemind_Link_169082018" MODIFIED="1164473854687" TEXT="int a[5][9];"/>
</node>
<node CREATED="1164469215765" FOLDED="true" ID="Freemind_Link_729998086" MODIFIED="1164469301953" TEXT="pointer to array of pointers,&#xa;with the array elements pointing &#xa;to the first element in the rows of each matrix">
<node CREATED="1164469313421" ID="Freemind_Link_354286784" MODIFIED="1164469719609" TEXT="m--&gt; |r1|--&gt;[a11 a12 a13]&#xa;      |r2|--&gt;[a21 a22 a23]&#xa;      |r3|--&gt;[a31 a32 a33]">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1160951158625" FOLDED="true" HGAP="134" ID="Freemind_Link_719963732" MODIFIED="1165855765437" POSITION="left" TEXT="structures" VSHIFT="50">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164387313171" ID="Freemind_Link_168442146" MODIFIED="1164387381281" TEXT="compound type that contains a group of related data items"/>
<node CREATED="1164387408531" FOLDED="true" ID="Freemind_Link_1793166233" MODIFIED="1164387438562" TEXT="syntax">
<node CREATED="1164387439796" ID="Freemind_Link_1565600356" MODIFIED="1164388231062" TEXT="struct [&lt;struct-name&gt;] &#xa;{&#xa;   &lt;members-declarations&gt;&#xa;};">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164388330218" FOLDED="true" ID="Freemind_Link_1306880686" MODIFIED="1164388350406" TEXT="declaration of a variable of structured type">
<node CREATED="1164388364968" ID="Freemind_Link_432269333" MODIFIED="1164388392968" TEXT="struct &lt;struct-name&gt; var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164388500000" ID="Freemind_Link_1852220949" MODIFIED="1164388560406" TEXT="struct [&lt;struct-name&gt;]&#xa;{&#xa;   &lt;members-declarations&gt;&#xa;} var_name;">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1164388598328" FOLDED="true" ID="Freemind_Link_394475779" MODIFIED="1164388605906" TEXT="initialisation">
<node CREATED="1164388617906" ID="Freemind_Link_887741352" MODIFIED="1164388648578" TEXT="struct point p1 = { 0, 1 };">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164388702046" FOLDED="true" ID="Freemind_Link_1727535298" MODIFIED="1164389074031" TEXT="dot = structure reference">
<node CREATED="1164388727296" ID="Freemind_Link_1946988031" MODIFIED="1164388739187" TEXT="point.x">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node COLOR="#ff0000" CREATED="1164388770890" ID="Freemind_Link_896647373" MODIFIED="1164388839390" TEXT="structures are passed to functions by value">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1164388901625" FOLDED="true" ID="Freemind_Link_16990362" MODIFIED="1164392062187" TEXT="pointers to structures" VSHIFT="8">
<node CREATED="1164388955312" ID="Freemind_Link_1077697501" MODIFIED="1164389023453" TEXT="struct point *pointPtr;&#xa;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164389025406" FOLDED="true" ID="Freemind_Link_1884976117" MODIFIED="1164389053515" TEXT="-&gt; = member reference operator">
<node CREATED="1164389081765" ID="Freemind_Link_1770400797" MODIFIED="1164389118578" TEXT="pointPtr-&gt;x">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164389099546" ID="Freemind_Link_240991790" MODIFIED="1164389118562" TEXT="(*pointPtr).x">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164389178453" ID="Freemind_Link_1651651586" MODIFIED="1164389208609" TEXT="use for large structures which need to be passed as parameters"/>
</node>
<node CREATED="1164391851218" FOLDED="true" ID="Freemind_Link_1030630639" MODIFIED="1164392044468" TEXT="unions" VSHIFT="14">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164391857578" ID="Freemind_Link_603936249" MODIFIED="1164391915203" TEXT="similar to structures but only one of the members can hold data at any time"/>
<node CREATED="1164391922250" FOLDED="true" ID="Freemind_Link_437691790" MODIFIED="1164392088031" TEXT="union symbol&#xa;{&#xa;   char name[4];&#xa;   int value;&#xa;};">
<font NAME="Monospaced" SIZE="12"/>
<node CREATED="1164391982093" HGAP="46" ID="Freemind_Link_1282124139" MODIFIED="1164392053000" TEXT="can hold either an array of 4 characters or an int" VSHIFT="28"/>
</node>
</node>
</node>
<node CREATED="1164385017359" FOLDED="true" HGAP="111" ID="Freemind_Link_1868632223" MODIFIED="1165772511875" POSITION="right" TEXT="strings" VSHIFT="22">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164385191031" ID="Freemind_Link_1290443282" MODIFIED="1164385236515" TEXT="array of char values terminated with a null byte &apos;\0&apos;"/>
<node COLOR="#006699" CREATED="1164385451625" FOLDED="true" ID="Freemind_Link_608409372" MODIFIED="1164385761859" TEXT="string literals">
<node CREATED="1164385458203" ID="Freemind_Link_56725660" MODIFIED="1164385821765" TEXT="#define TITLE &quot;prog name&quot;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164385481765" ID="Freemind_Link_1505182874" MODIFIED="1164385494046" TEXT="stored in programs&apos;s global data segment"/>
<node CREATED="1164385540046" ID="Freemind_Link_1335814769" MODIFIED="1164385551734" TEXT="seen as address to the first character"/>
</node>
<node COLOR="#006699" CREATED="1164385709593" FOLDED="true" ID="Freemind_Link_1511351654" MODIFIED="1164385762968" TEXT="string variables">
<node CREATED="1164385764562" ID="Freemind_Link_898065752" MODIFIED="1164385817359" TEXT="char strVar[128];">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164386023593" ID="Freemind_Link_1820810691" MODIFIED="1164386101218" TEXT="need to be initialised"/>
</node>
<node COLOR="#006699" CREATED="1164386103765" FOLDED="true" ID="Freemind_Link_1272398735" MODIFIED="1164386113843" TEXT="string pointers">
<node CREATED="1164386159312" ID="Freemind_Link_858867107" MODIFIED="1164386177906" TEXT="char *strPointer;">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164386130671" ID="Freemind_Link_1566837714" MODIFIED="1164386152359" TEXT="point to the first character of a string"/>
</node>
<node CREATED="1164386392750" FOLDED="true" ID="Freemind_Link_391679725" MODIFIED="1164386440578" TEXT="Operations on strings">
<node CREATED="1164386464656" ID="Freemind_Link_164751896" MODIFIED="1164386469796" TEXT="&lt;string.h&gt;"/>
<node CREATED="1164386473093" FOLDED="true" ID="Freemind_Link_1797221240" MODIFIED="1164386594562" TEXT="writing to stdout">
<node CREATED="1164386491546" ID="Freemind_Link_1149985930" MODIFIED="1164386822343" TEXT="puts(char*);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164386543718" FOLDED="true" ID="Freemind_Link_1395886906" MODIFIED="1164386602625" TEXT="reading from stdin">
<node CREATED="1164386578375" ID="Freemind_Link_766048544" MODIFIED="1164386822343" TEXT="gets(char*);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164386666000" FOLDED="true" ID="Freemind_Link_1566482080" MODIFIED="1164386733328" TEXT="copying c1=c2">
<node CREATED="1164386693328" ID="Freemind_Link_325536178" MODIFIED="1164386822343" TEXT="strcpy(char* c1, char* c2);">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164386758312" ID="Freemind_Link_1151887129" MODIFIED="1164386817656" TEXT="strncpy(char* dest, char* source, int numOfChar);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
<node CREATED="1164386864718" FOLDED="true" ID="Freemind_Link_1614637017" MODIFIED="1164386868343" TEXT="comparison">
<node CREATED="1164386876906" FOLDED="true" ID="Freemind_Link_1853880793" MODIFIED="1164387023984" TEXT="strcmp(char* s1, char* s2)">
<font NAME="Monospaced" SIZE="12"/>
<node CREATED="1164386897906" ID="Freemind_Link_1820536343" MODIFIED="1164386985062" TEXT="==0, strings are equal"/>
<node CREATED="1164386942281" ID="Freemind_Link_327793847" MODIFIED="1164386966265" TEXT="&gt;0, if s1 &gt; s2"/>
<node CREATED="1164386992921" ID="Freemind_Link_530272240" MODIFIED="1164387008125" TEXT="&lt;0, if s1 &lt; s2"/>
</node>
</node>
<node CREATED="1164387033906" FOLDED="true" ID="Freemind_Link_1986096648" MODIFIED="1164387037671" TEXT="length">
<node CREATED="1164387039750" ID="Freemind_Link_926237725" MODIFIED="1164387068406" TEXT="int strlen(char* s);">
<font NAME="Monospaced" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1160951243734" FOLDED="true" HGAP="78" ID="Freemind_Link_739441469" MODIFIED="1165772560703" POSITION="right" TEXT="input/output" VSHIFT="26">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1164474976843" FOLDED="true" ID="Freemind_Link_1131571683" MODIFIED="1165772531703" TEXT="&lt;stdio.h&gt;">
<node CREATED="1164474956640" FOLDED="true" ID="Freemind_Link_813673288" MODIFIED="1165772589593" TEXT="stdin" VSHIFT="-8">
<node CREATED="1163625502085" FOLDED="true" ID="Freemind_Link_1598209646" MODIFIED="1163625508412" TEXT="scanf">
<node CREATED="1163625510331" ID="Freemind_Link_538168613" MODIFIED="1163625531895" TEXT="int %d "/>
<node CREATED="1163625534845" ID="Freemind_Link_4946928" MODIFIED="1163625541817" TEXT="double %lf"/>
<node CREATED="1163625586179" ID="Freemind_Link_1126903471" MODIFIED="1163625591362" TEXT="float %f"/>
<node CREATED="1164479709359" ID="Freemind_Link_294958874" MODIFIED="1164479733656" TEXT="int scanf(const char* format, ...);"/>
</node>
</node>
<node CREATED="1164474965000" FOLDED="true" ID="Freemind_Link_1531739739" MODIFIED="1164474967687" TEXT="stdout">
<node CREATED="1164475025109" FOLDED="true" ID="Freemind_Link_157859061" MODIFIED="1164475027562" TEXT="printf">
<node CREATED="1164475041437" ID="Freemind_Link_1729312864" MODIFIED="1164475071109" TEXT="int printf(const char* format, &lt;args&gt;);">
<font NAME="Monospaced" SIZE="12"/>
</node>
<node CREATED="1164475087984" FOLDED="true" HGAP="69" ID="Freemind_Link_574292220" MODIFIED="1165772582593" TEXT="format" VSHIFT="4">
<node CREATED="1164475116484" FOLDED="true" ID="Freemind_Link_449760635" MODIFIED="1164475126406" TEXT="%">
<node CREATED="1164475127593" ID="Freemind_Link_21131878" MODIFIED="1164475147875" TEXT="%- left adjustment"/>
<node CREATED="1164475150000" ID="Freemind_Link_1867564239" MODIFIED="1164475166968" TEXT="%+ numbers always with sign"/>
<node CREATED="1164475170593" ID="Freemind_Link_1040139665" MODIFIED="1164475208015" TEXT="%[SPACE] space prefix if not a sign"/>
</node>
</node>
<node CREATED="1164475314468" FOLDED="true" ID="Freemind_Link_878797687" MODIFIED="1165772579390" TEXT="conversion specification" VSHIFT="10">
<node CREATED="1164475360812" ID="Freemind_Link_1429827165" MODIFIED="1164475392890" TEXT="%d %i  = int (decimal)"/>
<node CREATED="1164475395250" ID="Freemind_Link_881377305" MODIFIED="1164475644578" TEXT="%o = unsigned int (octal)"/>
<node CREATED="1164475406671" ID="Freemind_Link_1186447071" MODIFIED="1164475655765" TEXT="%x %X = unsigned int (hexadecimal)"/>
<node CREATED="1164475590906" ID="Freemind_Link_249864454" MODIFIED="1164475633093" TEXT="%u = unsigned int (decimal)"/>
<node CREATED="1164475670656" ID="Freemind_Link_757174580" MODIFIED="1164475687312" TEXT="%c = unsigned char"/>
<node CREATED="1164475697515" ID="Freemind_Link_999388582" MODIFIED="1164475741718" TEXT="%s = string (char* array ending with \0)"/>
<node CREATED="1164475748609" ID="Freemind_Link_1705074567" MODIFIED="1164476254453" TEXT="%f = double (decimal), form [-]mmm.ddd"/>
<node CREATED="1164476187843" ID="Freemind_Link_198679275" MODIFIED="1164476291390" TEXT="%e %E = double (decimal), form [-]m.dddexx"/>
<node CREATED="1164476308187" ID="Freemind_Link_1198737643" MODIFIED="1164476363421" TEXT="%g %G = double (decimal), like %e or %f depending on the exponent"/>
<node CREATED="1164476371906" ID="Freemind_Link_1271377020" MODIFIED="1164476393031" TEXT="%p = void* (for pointers)"/>
</node>
</node>
</node>
<node CREATED="1164474968984" HGAP="36" ID="Freemind_Link_1583294696" MODIFIED="1165799316078" TEXT="stderr" VSHIFT="-30"/>
<node CREATED="1165799009093" FOLDED="true" HGAP="26" ID="Freemind_Link_1194084515" MODIFIED="1165799306796" TEXT="file access" VSHIFT="-8">
<node CREATED="1165799024156" FOLDED="true" ID="Freemind_Link_1063001859" MODIFIED="1165799150625" TEXT="FILE* fopen(char* filename, char* mode);">
<font NAME="Monospaced" SIZE="12"/>
<node CREATED="1165799075687" FOLDED="true" ID="Freemind_Link_1747945645" MODIFIED="1165799078562" TEXT="modes">
<node CREATED="1165799079421" ID="Freemind_Link_239011777" MODIFIED="1165799095375" TEXT="open for reading = &quot;r&quot;"/>
<node CREATED="1165799097281" ID="Freemind_Link_1875300682" MODIFIED="1165799110125" TEXT="open for writing = &quot;w&quot;"/>
<node CREATED="1165799114062" ID="Freemind_Link_594043291" MODIFIED="1165799138171" TEXT="binary files - add &quot;b&quot; to end of mode string"/>
</node>
</node>
<node CREATED="1165799172468" ID="Freemind_Link_1099905422" MODIFIED="1165799190937" TEXT="void fclose(FILE* file);"/>
<node CREATED="1165799199234" FOLDED="true" ID="Freemind_Link_1440019812" MODIFIED="1165799261859" TEXT="int fscanf(FILE* stream, format, ...);">
<node COLOR="#ff0000" CREATED="1165799270140" ID="Freemind_Link_1557161165" MODIFIED="1165799288796" TEXT="&lt;stdlib.h&gt; needed">
<icon BUILTIN="help"/>
</node>
</node>
<node CREATED="1165799344875" FOLDED="true" ID="Freemind_Link_1516100127" MODIFIED="1165799361078" TEXT="int fgetc(FILE* stream)">
<node CREATED="1165799362218" ID="Freemind_Link_1243642537" MODIFIED="1165799369890" TEXT="reads one char"/>
</node>
<node CREATED="1165799394500" ID="Freemind_Link_1003069692" MODIFIED="1165799479921" TEXT="char* fgets()"/>
<node CREATED="1165799481546" ID="Freemind_Link_1586274211" MODIFIED="1165799520828" TEXT="fprintf(FILE* stream, format,...);"/>
</node>
</node>
</node>
<node CREATED="1160951273109" HGAP="44" ID="Freemind_Link_1269543780" MODIFIED="1165772455359" POSITION="left" TEXT="Abstract Data Structures" VSHIFT="31">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1160951361781" HGAP="33" ID="Freemind_Link_1217987255" MODIFIED="1165772461671" POSITION="left" TEXT="The Standard Library" VSHIFT="29">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1160951349750" ID="Freemind_Link_1305905318" MODIFIED="1165772463593" POSITION="left" TEXT="Make" VSHIFT="24">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</map>
