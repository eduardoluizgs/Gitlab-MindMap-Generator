<map version="0.8.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1218286166140" ID="Freemind_Link_835465344" MODIFIED="1237238573109" TEXT="An Overview of Application Whitelisting">
<font NAME="SansSerif" SIZE="18"/>
<node CREATED="1205670818796" ID="Freemind_Link_802744332" MODIFIED="1237238199937" POSITION="right" TEXT="Topics">
<node CREATED="1236944487375" FOLDED="true" ID="Freemind_Link_1334498435" MODIFIED="1236987402281" TEXT="Intro">
<node CREATED="1236450100625" ID="Freemind_Link_745128589" MODIFIED="1236450118031" TEXT="not a new solutions but evidence that it&apos;s time has come">
<node CREATED="1236451350562" ID="Freemind_Link_250506720" MODIFIED="1236451367250" TEXT="resurgence of interest, like virtualization"/>
<node CREATED="1236451411875" ID="Freemind_Link_107285896" MODIFIED="1236451413078" TEXT="Whitelisting, the concept of which dates back to the mainframe days of locked-down and controlled applications, lets only approved and authorized applications run on user machines."/>
<node CREATED="1236450152062" ID="Freemind_Link_744816436" MODIFIED="1236450153250" TEXT="Rather than track and quarantine harmful bits, whitelisting involves barring all but approved executables from running on a given machine."/>
</node>
<node CREATED="1236452119156" ID="Freemind_Link_1958520646" MODIFIED="1236452120265" TEXT="The idea is simple &#x2013; signatures of known bad stuff is a blacklist, signatures of known good stuff is a whitelist. Blacklisting has been the preferred method for AV over the last decade. Blacklisting has the benefit of near-zero false positives &#x2013; something customers expect. Blacklisting also keeps the customers coming back &#x2013; new malware means new signatures &#x2013; perfect for recurring revenue models for vendor&#x2019;s balance sheet."/>
<node CREATED="1236448739625" ID="Freemind_Link_405797818" MODIFIED="1236448751828" TEXT="John T quote of 2008">
<node CREATED="1236451603921" ID="Freemind_Link_1839246043" LINK="http://www.darkreading.com/security/management/showArticle.jhtml?articleID=211201314" MODIFIED="1236451603921" TEXT="darkreading.com &gt; Security &gt; Management &gt; ShowArticle ? ..."/>
<node CREATED="1236451652531" ID="Freemind_Link_1575343149" MODIFIED="1236451654046" TEXT="The number of exposed records has tripled in the last year,&#x201d; Thompson said. He called for the creation of a federal law that requires companies to disclose details on their security breaches in a timely fashion. &#x201c;If ever there was a cry for change in public policy, it&#x2019;s now.&quot;  The Symantec research also indicates that, for the first time, there are more malicious applications (65 percent) being spread across the Web than legitimate applications. &#x201c;I don&#x2019;t usually make predictions, but if the growth of malware continues at this pace, I predict that technologies such as whitelisting will become more critical.&quot; "/>
</node>
<node CREATED="1236450035046" ID="Freemind_Link_1024656652" MODIFIED="1236450052968" TEXT="conventional solutions reached limits, like firewalls">
<node CREATED="1236448683859" ID="Freemind_Link_1529423899" MODIFIED="1236944508937" TEXT="AV is the definitive blacklisting solution"/>
<node CREATED="1236945935562" FOLDED="true" ID="Freemind_Link_807640173" MODIFIED="1236961055671" TEXT="but the solution reached an inflection point">
<node CREATED="1236945978906" ID="Freemind_Link_965873480" MODIFIED="1236945992265" TEXT="who said that?"/>
</node>
<node CREATED="1236945950843" ID="Freemind_Link_955844087" MODIFIED="1236945963453" TEXT="point of diminishing returns"/>
</node>
<node CREATED="1236448321640" ID="Freemind_Link_193806780" MODIFIED="1236945876750" TEXT="complaints are more than grumblings"/>
<node CREATED="1236448339390" ID="Freemind_Link_207301111" MODIFIED="1236945896671" TEXT="essentially days are numbered as front line defense"/>
<node CREATED="1236451462125" ID="Freemind_Link_1956677940" MODIFIED="1236451468328" TEXT="erosion of trust"/>
<node CREATED="1236945898140" ID="Freemind_Link_1471040760" MODIFIED="1236946784234" TEXT="BL always be present"/>
<node CREATED="1236985528406" ID="Freemind_Link_462221014" MODIFIED="1236985553312" TEXT="tries to evaluate if software is bad"/>
</node>
<node CREATED="1236448283859" FOLDED="true" ID="_" MODIFIED="1236987407281" TEXT="Blacklisting limitations">
<node CREATED="1236944438796" FOLDED="true" ID="Freemind_Link_771243359" MODIFIED="1236944447000" TEXT="why is malware growing?">
<node CREATED="1236946314750" ID="Freemind_Link_533659316" MODIFIED="1236946335703" TEXT="more money behind malware development"/>
<node CREATED="1236984211625" FOLDED="true" ID="Freemind_Link_395241137" MODIFIED="1236984275718" TEXT="from mass distribution of a small number of threats  &#xa;to micro distribution of millions of distinct threats ">
<node CREATED="1236984342781" ID="Freemind_Link_1775840922" MODIFIED="1236984426218" TEXT="facilitated by malware server generating new strains every few mins"/>
<node CREATED="1236984318687" FOLDED="true" ID="Freemind_Link_789723727" MODIFIED="1236984371015" TEXT="We now know of over 1.8M distinct malware strains &#xa;We&#x2019;re collecting 10,000s of new strains per day">
<node CREATED="1236984427312" ID="Freemind_Link_1511808376" MODIFIED="1236984435000" TEXT="malware exceeds goodware"/>
<node CREATED="1236984435937" ID="Freemind_Link_1057484267" MODIFIED="1236984442515" TEXT="passed inflection point">
<node CREATED="1236986550078" ID="Freemind_Link_948158106" MODIFIED="1236986556234" TEXT="Bit9 ppt"/>
<node CREATED="1236986558593" ID="Freemind_Link_736662845" MODIFIED="1236986569218" TEXT="future of AV"/>
</node>
</node>
<node CREATED="1236986862828" FOLDED="true" ID="Freemind_Link_1184546729" MODIFIED="1236986874984" TEXT="Stealthiness is increasingly a dominant design goal &#xa;70-80% of malware samples are packed, in many cases through multiple layers of packing ">
<node CREATED="1236986923062" FOLDED="true" ID="Freemind_Link_816375087" MODIFIED="1236986931890" TEXT="leads to packing problem">
<node CREATED="1236986950968" ID="Freemind_Link_590826347" MODIFIED="1236987002656" TEXT="Common attacker tactic: take a known malware binary and pack it with 10 layers of potentially different/proprietary packers &#xa;&#xa;Symantec knows about 1145 families of packers, each of which can have multiple versions, e.g. UPX or ASPack, and can recognize/unpack about 100 of them &#xa;&#xa;Malware signature size keeps growing and no end in sight &#xa;&#xa;Possible solutions: &#xa;&#x9; Just-in-time AV scanning &#xa;&#x9;White-listing vs. Blacklisting &#xa;&#x9;Behaviour blocking "/>
<node CREATED="1236987526687" ID="Freemind_Link_897449915" MODIFIED="1236987548015" TEXT="multiple layers of pecking addas dimensions to sig files"/>
</node>
</node>
</node>
<node CREATED="1236946338765" FOLDED="true" ID="Freemind_Link_907013776" MODIFIED="1236946362343" TEXT="better method for capturing and recording">
<node CREATED="1236946393500" ID="Freemind_Link_943485775" MODIFIED="1236946397406" TEXT="Today, new malware can be automatically collected, without human intervention. The slow trickle of malware turned into a flood as honeypot technology emerged. Sensor grids can obtain new malware samples with efficiency - they automatically &#x2018;drive by&#x2019; (aka spidering) malicious websites to get infections and leave open ports on the &#x2018;Net so automated scanners will exploit them. In parallel to the automated collection efforts, cybercrime has risen to epic levels."/>
</node>
<node CREATED="1236946412218" FOLDED="true" ID="Freemind_Link_659343082" MODIFIED="1236946426953" TEXT="entry barrier falling">
<node CREATED="1236946472828" ID="Freemind_Link_1868102046" MODIFIED="1236946475359" TEXT="Finally, the barrier to entry has dropped for the cyber criminal. Cyber weapon toolkits have become commonly available. Anti-detection technology is standard fare. New variants of a malware program can be auto-generated. A safe bet is to expect thousands of new malware to hit the Internet per day."/>
<node CREATED="1236946493484" ID="Freemind_Link_1398691505" MODIFIED="1236946500781" TEXT="malware toolkits"/>
<node CREATED="1236946501640" ID="Freemind_Link_73750617" MODIFIED="1236946554093" TEXT="anti-detection technology available"/>
<node CREATED="1236946513468" ID="Freemind_Link_199013912" MODIFIED="1236946546093" TEXT="auto-generate and release variants"/>
</node>
<node CREATED="1236946291968" FOLDED="true" ID="Freemind_Link_30416551" MODIFIED="1236946308015" TEXT="figures">
<node CREATED="1236448556984" ID="Freemind_Link_1744464661" MODIFIED="1236448595578" TEXT="1m altogther, 2/3 created in 2008"/>
<node CREATED="1236945793437" ID="Freemind_Link_207634763" MODIFIED="1236945801390" TEXT="graphs?"/>
<node CREATED="1236452614593" LINK="http://www.avertlabs.com/research/blog/index.php/2008/07/01/the-end-of-exponential-malware-growth/" MODIFIED="1236452614593" TEXT="avertlabs.com &gt; Research &gt; Blog &gt; Index.php &gt; 2008 &gt; 07 &gt; 01 &gt; The-end-of-exponential-malware-growth"/>
</node>
</node>
<node CREATED="1236944401734" FOLDED="true" ID="Freemind_Link_541069005" MODIFIED="1236945780593" TEXT="the signature scan method">
<node CREATED="1237016332125" ID="Freemind_Link_165411537" MODIFIED="1237016336093" TEXT="Scanning">
<node CREATED="1236985334718" ID="Freemind_Link_431884332" MODIFIED="1236985343312" TEXT="basic modes">
<node CREATED="1236985345062" ID="Freemind_Link_1373241144" MODIFIED="1236985350828" TEXT="on-access scan"/>
<node CREATED="1236985351843" ID="Freemind_Link_1734235806" MODIFIED="1236985355750" TEXT="disk scan"/>
<node CREATED="1236985382343" ID="Freemind_Link_1123911553" MODIFIED="1236985389453" TEXT="only as good as the DB"/>
</node>
<node CREATED="1236452092062" ID="Freemind_Link_1113006279" MODIFIED="1237017849359" TEXT="Perfect for detecting known malware, known insecure software, known intellectual property.   "/>
<node CREATED="1237016285125" FOLDED="true" ID="Freemind_Link_168438901" MODIFIED="1237016288187" TEXT="They are the cash cow of the anti-virus companies.">
<node CREATED="1236451006406" ID="Freemind_Link_953008795" MODIFIED="1236451017062" TEXT="good revenue model"/>
</node>
</node>
<node CREATED="1236448345656" ID="Freemind_Link_939141090" MODIFIED="1236448375156" TEXT="pattern-matching approach not adapted to changes in malware">
<node CREATED="1236984535296" FOLDED="true" ID="Freemind_Link_693157060" MODIFIED="1236984552312" TEXT="A few years ago, a single classic signature could protect 10,000s of users &#xa;Today a single classic signature typically protects &lt; 20 users ">
<node CREATED="1236984594609" ID="Freemind_Link_164103484" MODIFIED="1236984622953" TEXT="producing more signatures but less effective than say 10 years ago"/>
</node>
<node CREATED="1236448439515" FOLDED="true" ID="Freemind_Link_521481766" MODIFIED="1236448611281" TEXT="matching every malware signature against every file is archaic, not feasible">
<node CREATED="1236448485515" ID="Freemind_Link_1057917012" MODIFIED="1236448496843" TEXT="but what is the alternative?"/>
<node CREATED="1236448617062" ID="Freemind_Link_721219403" MODIFIED="1236448638125" TEXT="not feasible to process, and can only increase"/>
<node CREATED="1236448512046" ID="Freemind_Link_1358932050" MODIFIED="1236448526125" TEXT="mention the Kaspersky patent"/>
<node CREATED="1236449184015" FOLDED="true" ID="Freemind_Link_1698088881" MODIFIED="1236449196921" TEXT="Norton risk based as well">
<node CREATED="1236449198656" ID="Freemind_Link_964699878" MODIFIED="1236449200390" TEXT="Tom Powledge, vice president of consumer product management at Symantec, told me the new products are lighter and faster in part because they&apos;ve jettisoned the multiple copies of the signature database found in previous versions. They&apos;re also not scanning each and every file. Instead, the 2009 products will be building a trust index--that is, the app will declaring certain files (say photos or MP3s) clean and then not scan them again unless the files change. He showed me a graphic where roughly 70 percent of a given machine is trusted, and only that last 30 percent is actively scanned."/>
</node>
</node>
<node CREATED="1236978880312" FOLDED="true" ID="Freemind_Link_758858181" MODIFIED="1236978892375" TEXT="what fraction of malware goes undetected?">
<node CREATED="1236452218750" ID="Freemind_Link_1756975748" MODIFIED="1236452220031" TEXT="The flaw in blacklisting has been exposed &#x2013; it cannot address new and unknown malware threats. Figures range, but a safe claim is that 80% of all new malware goes undetected. This isn&#x2019;t just a minor flaw; it&#x2019;s a gross misstep in technology. Blacklisting is, and always has been, snake oil. "/>
<node CREATED="1236984576500" ID="Freemind_Link_1017691446" MODIFIED="1236984583562" TEXT="65% another figure"/>
</node>
<node CREATED="1236984649953" ID="Freemind_Link_390645279" MODIFIED="1236984663500" TEXT="fingerprinting model needs to be augmented or replaced"/>
</node>
<node CREATED="1237018029843" ID="Freemind_Link_1895447135" MODIFIED="1237018033234" TEXT="terms">
<node CREATED="1237018035656" ID="Freemind_Link_194667861" MODIFIED="1237018038843" TEXT="scan"/>
<node CREATED="1237018039718" ID="Freemind_Link_1884744056" MODIFIED="1237018053328" TEXT="fingerprinting"/>
<node CREATED="1237018054765" ID="Freemind_Link_1456012686" MODIFIED="1237018059718" TEXT="pattern-matching"/>
</node>
<node CREATED="1237016147625" ID="Freemind_Link_1234548716" MODIFIED="1237016199546" TEXT="Cost">
<node CREATED="1236450387296" ID="Freemind_Link_522142904" MODIFIED="1236450388781" TEXT="Even for systems with enough resources to shoulder scanning over&#xad;head, as well as the connectivity and availability to receive frequent anti-virus signature updates, these security products are reactive in nature and lack potency regarding new or tightly tar&#xad;geted threats not yet included in the anti-virus vendors&#x2019; signature databases."/>
<node CREATED="1236450343734" ID="Freemind_Link_797391591" MODIFIED="1236450344984" TEXT="there&#x2019;s considerable system overhead associated with scanning, and the fre&#xad;quent signature updates required to keep anti-virus applications in good working order can be difficult to main&#xad;tain."/>
</node>
</node>
<node CREATED="1236984946640" FOLDED="true" ID="Freemind_Link_621247485" MODIFIED="1236984954250" TEXT="Long Tail">
<node CREATED="1236985082484" ID="Freemind_Link_868627113" MODIFIED="1236985103093" TEXT="LT distribution of number of users vs. files"/>
<node CREATED="1236984956234" ID="Freemind_Link_344473354" MODIFIED="1236985208359" TEXT="BL good at protecting when one signature protects many users"/>
<node CREATED="1236985221515" ID="Freemind_Link_40178551" MODIFIED="1236985237171" TEXT="new malware reducing the coverage ratio"/>
<node CREATED="1236984971625" ID="Freemind_Link_135396681" MODIFIED="1236984998000" TEXT="when the head cover most applications used by many users"/>
<node CREATED="1236985001187" ID="Freemind_Link_163769079" MODIFIED="1236985029265" TEXT="BL not good for the tail, which is where new malware is attacking"/>
<node CREATED="1236985262812" ID="Freemind_Link_1496823101" MODIFIED="1236985278156" TEXT="also plan to rely on reputation system in the tail"/>
<node CREATED="1236987119031" ID="Freemind_Link_955897326" MODIFIED="1236987187890" TEXT="false positive rate going up"/>
<node CREATED="1237048325515" ID="Freemind_Link_1950440521" MODIFIED="1237048346171" TEXT="how comprehensive can BL be or remain"/>
</node>
<node CREATED="1236448667140" FOLDED="true" ID="Freemind_Link_218287754" MODIFIED="1236987395843" TEXT="Need new or alternate strategy">
<node CREATED="1236450589968" ID="Freemind_Link_1352635498" MODIFIED="1236450591500" TEXT="Application whitelisting offers organizations an anti-malware option that can be more flexible than total lockdown yet more comprehen&#xad;sive than the blacklisting approach embodied by anti-virus."/>
<node CREATED="1236984696000" ID="Freemind_Link_188699729" MODIFIED="1236984710937" TEXT="Symantec&#x2019;s top security architects believe &#xa;&#xa;a hybrid whitelisting and reputation-based antivirus approach will become the only effective means of  securing enterprise &amp; consumer endpoints"/>
<node CREATED="1236985687171" FOLDED="true" ID="Freemind_Link_1304448739" MODIFIED="1236985709156" TEXT="WL">
<node CREATED="1236985652312" FOLDED="true" ID="Freemind_Link_849900157" MODIFIED="1236985679640" TEXT="Tracking Applications &#xa;Only Listed Applications Run &#xa;Listed Applications are &#x2018;Good&#x2019;  ">
<node CREATED="1236985715968" ID="Freemind_Link_313101240" MODIFIED="1236985734796" TEXT="not good but not known to be bad"/>
<node CREATED="1236985762890" FOLDED="true" ID="Freemind_Link_1590964758" MODIFIED="1236985767156" TEXT="define good">
<node CREATED="1236985769375" ID="Freemind_Link_1136012676" MODIFIED="1236985780875" TEXT="Trusted Source &#xa;Signed Binary &#xa;Mega-whitelist Database">
<node CREATED="1236985788390" ID="Freemind_Link_1199498107" MODIFIED="1236985799750" TEXT="still not getting away from DBs!"/>
</node>
</node>
</node>
<node CREATED="1236986097140" FOLDED="true" ID="Freemind_Link_1127295291" MODIFIED="1236986110703" TEXT="No zero-day threats &#xa;No chronic signature updating &#xa;No paying for chronic signature updating ">
<node CREATED="1236986126187" ID="Freemind_Link_228711827" MODIFIED="1237048031937" TEXT="does not eliminate zero day threat !"/>
</node>
<node CREATED="1236986176828" ID="Freemind_Link_556377274" MODIFIED="1236986189406" TEXT="Blocks malware and unlicensed/ unauthorized software from installing and executing &#xa;Eliminates reactive security patching &#xa;Eliminates unplanned or unmanaged configuration drift "/>
</node>
</node>
</node>
<node CREATED="1236449416906" FOLDED="true" ID="Freemind_Link_505345934" MODIFIED="1237238531921" TEXT="Whitelisting management">
<node CREATED="1236448954140" ID="Freemind_Link_963186225" MODIFIED="1236448979406" TEXT="is it easier to manager DB of good apps as opposed to 1m malware and growing?"/>
<node CREATED="1236449433750" ID="Freemind_Link_412439327" MODIFIED="1236449436062" TEXT="Compiling the initial whitelist requires detailed reviews of users&apos; tasks and the applications they need to complete them. The growing complexity of business processes and applications makes maintaining the list a lot of work."/>
<node CREATED="1236449537343" ID="Freemind_Link_1105408319" MODIFIED="1236449538781" TEXT="To make application whitelists a success in your organization, you need not only senior management buy-in, but also a way of letting users quickly and easily request permission to run a new application."/>
<node CREATED="1236449627656" ID="Freemind_Link_1457675914" MODIFIED="1236449628781" TEXT="A more draconian step would be to allow systems to only install software that is digitally signed and downloaded from a trusted repository."/>
<node CREATED="1236450711406" ID="Freemind_Link_1702751947" MODIFIED="1236450712718" TEXT="At this point, administra&#xad;tors also can add other appli&#xad;cations to their whitelist policies and, in most cases, determine separate allowed application policies for dif&#xad;ferent sets of users based on group information in Active Directory. Certain applica&#xad;tion whitelisting products, such as those from Bit9 and CA, also offer administrators guidance in deciding which applications to include in their whitelists. Both ven&#xad;dors maintain databases of scanned applications, along with trust ratings based on the vendors&#x2019; analysis."/>
<node CREATED="1236450730750" ID="Freemind_Link_1000643861" MODIFIED="1236450732281" TEXT="Of course, once released into the wild, desktop PCs very quickly diverge from the golden image. Even the most conservatively managed machines pick up large numbers of operating system and application updates, and more lib&#xad;erally managed clients can rack up new applications at a rapid pace."/>
<node CREATED="1236451904312" ID="Freemind_Link_1545396887" MODIFIED="1236451906203" TEXT="And displaying a pop-up that asks you to decide whether an unknown app is okay to run ensures that you&apos;ll eventually make the wrong call and break your software or even your system. Most antivirus companies rightly make every effort to minimize the number of alerts that ask us to make a decision; an overreliance on whitelists could roll back those improvements."/>
<node CREATED="1236985833421" FOLDED="true" ID="Freemind_Link_57708640" MODIFIED="1236985872875" TEXT="how to handle the non-standard stuff">
<node CREATED="1236985851937" ID="Freemind_Link_338911" MODIFIED="1236985865187" TEXT="Recently Released Applications &#xa;Proprietary Applications &#xa;Miscellaneous dlls, drivers, etc. "/>
</node>
<node CREATED="1236985957687" FOLDED="true" ID="Freemind_Link_975474851" MODIFIED="1236985959062" TEXT="Security  - IT Operations Balancing Act ">
<node CREATED="1236985974625" ID="Freemind_Link_1042074626" MODIFIED="1236985986640" TEXT="Frequent Patching &#xa;Image Management &#xa;Preventing UNAUTHORIZED change &amp; rapidly allowing AUTHORIZED change "/>
</node>
<node CREATED="1236986021984" FOLDED="true" ID="Freemind_Link_1121674047" MODIFIED="1236986023250" TEXT="Application Whitelisting must Allow Authorized Change ">
<node CREATED="1236986035390" ID="Freemind_Link_166486243" MODIFIED="1236986047375" TEXT="Periodic Application and Operating System &#xa;Updates Applications Available from Internal Server &#xa;Ad-hoc Application Installation by Authorized Users "/>
</node>
</node>
<node CREATED="1236449650765" FOLDED="true" ID="Freemind_Link_428074989" MODIFIED="1236987382984" TEXT="Limits">
<node CREATED="1236449657250" FOLDED="true" ID="Freemind_Link_1461002965" MODIFIED="1236449673296" TEXT="not safe computing">
<node CREATED="1236449708390" ID="Freemind_Link_1635712490" MODIFIED="1236449710468" TEXT="Whitelists, however, cannot fix an allowed program that has a vulnerability. Even in a whitelist environment, a typical buffer-overflow attack, for example, can still run malicious executables, because the system thinks it&apos;s the whitelisted, but vulnerable program running the code. "/>
</node>
<node CREATED="1236449738218" FOLDED="true" ID="Freemind_Link_1504423433" MODIFIED="1236449742781" TEXT="granularity">
<node CREATED="1236449745875" ID="Freemind_Link_1669749667" MODIFIED="1236449757546" TEXT="selective user install and run"/>
<node CREATED="1236449760796" ID="Freemind_Link_376913020" MODIFIED="1236449761812" TEXT="A simple &quot;Yes&quot; or &quot;No&quot; decision either allows the program to run or not, whereas it may be appropriate for some users to use a certain program, but only access certain features."/>
</node>
<node CREATED="1236450436453" ID="Freemind_Link_1103433227" MODIFIED="1236450437859" TEXT="Ideally, perhaps, business comput&#xad;ers would operate like stateless appli&#xad;ances, with administrators maintaining tight control over all system functions and permissions. However, the total lockdown model doesn&#x2019;t mesh well with the realities of today&#x2019;s Windows client environment. "/>
<node CREATED="1236450472515" ID="Freemind_Link_237337359" MODIFIED="1236450473562" TEXT="For better or worse, the Windows software ecosystem is organized around the assumption that regular users also will be administering their machines, installing updates from various sources and pulling down plug-ins and exten&#xad;sions to run on their browsers. "/>
<node CREATED="1236452002765" FOLDED="true" ID="Freemind_Link_1220945704" MODIFIED="1236452004015" TEXT="Changing the approach by antivirus software of fighting viruses to whitelisting would involve antivirus software having a list of only those programs which are known to not contain viruses or malware. The software would only allow programs to run on your computer that are known to be free of viruses and malware.">
<node CREATED="1236452007046" ID="Freemind_Link_881684339" MODIFIED="1236452010453" TEXT="no no no"/>
</node>
<node CREATED="1237049242734" FOLDED="true" ID="Freemind_Link_733626152" MODIFIED="1237049251984" TEXT="technical issues">
<node CREATED="1236452328500" LINK="http://fasthorizon.blogspot.com/2008/06/whitelisting-is-next-snake-oil.html" MODIFIED="1236452328500" TEXT="fasthorizon.blogspot.com &gt; 2008 &gt; 06 &gt; Whitelisting-is-next-snake-oil"/>
<node CREATED="1236452048265" ID="Freemind_Link_661225360" MODIFIED="1237049325562" TEXT="is this snake oil?Whitelists are based upon files on disk. A whitelist, in current industry terms, means a list of the MD5 sums for files ON DISK. Please understand that files on disk are not the same as files in memory. And all that matters is memory. &#xa;&#xa;When a file is LOADED into memory, it CHANGES. This means on-disk MD5 sums do not map to memory. There are several reasons memory is different:  &#xa;&#xa;1) Memory contains much more data than the on disk file&#xa;2) Memory contains thread stacks &#xa;3) Memory contains allocated heaps&#xa;4) Memory contains data downloaded from the Internet &#xa;5) Memory contains secondary or tertiary files that were opened and read &#xa;6) Memory contains data that is calculated at runtime &#xa;7) Memory contains data that is entered by a user  &#xa;&#xa;All of the above are not represented by the file on disk. So, none of the above are represented by the whitelist MD5 sum. Yet, when the file hash on disk passes for white-listed, the running in-memory file is considered whitelisted by proxy. This is where the whole model breaks down. In memory, there are millions of bytes of information that are calculated at runtime &#x2013; they are different every time the program is executed, the DLL is loaded, or the EXE is launched. These bytes are part of the process, but unlike the file on disk they change every time the program is executed. Therefore, they cannot be whitelisted or checksummed. This data can change every minute, every second of the program&#x2019;s lifetime. None of this dynamic data can be hashed with MD5. &#xa;&#xa;None of this dynamic data is represented by the bytes on disk. So, none of it can be whitelisted."/>
<node CREATED="1236452386109" ID="Freemind_Link_1615657703" MODIFIED="1236452387375" TEXT="For malware authors, the whitelist is a boon. It means that a malware author only needs to inject subversive code into another process that is whitelisted. Since the whitelist doesn&#x2019;t and cannot account for dynamic runtime data, the malware author knows his injected code is invisible to the whitelist. And, since the process is whitelisted on disk, he can be assured his malware code will also be whitelisted by proxy. So, in effect, whitelisting is actually WORSE than blacklisting. In the extreme, the malware may actually inject into the desktop firewall or resident virus scanner directly as a means of obtaining this blanket of trust.">
<node CREATED="1236452417640" ID="Freemind_Link_1058575835" MODIFIED="1236452425937" TEXT="just see the art at the end"/>
</node>
</node>
</node>
<node CREATED="1236451505078" FOLDED="true" ID="Freemind_Link_1048021637" MODIFIED="1236987388625" TEXT="Strategy">
<node CREATED="1236448890296" FOLDED="true" ID="Freemind_Link_1757977255" MODIFIED="1236448902328" TEXT="interest from big players">
<node CREATED="1236448930921" ID="Freemind_Link_140288078" MODIFIED="1236448932781" TEXT="What&apos;s interesting is that the big guys Google (Green Border Technologies), Microsoft (Winternals Software&apos;s Protection Manager, and now Symantec have started paying attention to whitelisting. "/>
<node CREATED="1236450949328" ID="Freemind_Link_1858303186" MODIFIED="1236450952250" TEXT="Patchlink, AppSense, Bit9, SignaCert, CA et al)Patchlink, AppSense, Bit9, SignaCert, CA et al)"/>
<node CREATED="1236962418171" FOLDED="true" ID="Freemind_Link_1610937904" MODIFIED="1236962456421" TEXT="Patchlink and SecureWave">
<node CREATED="1236451075421" ID="Freemind_Link_1548784789" MODIFIED="1236451077078" TEXT="If you speak to the management of either Patchlink or SecureWave they&apos;ll provide you with a series of reasons why the merger between the two makes sense, in terms of growth goals, customer base, geographical coverage, corporate culture, etc."/>
</node>
<node CREATED="1236986618171" ID="Freemind_Link_1160331093" MODIFIED="1236986634468" TEXT="all have something to say in bit9 ppt"/>
<node CREATED="1236946084515" ID="Freemind_Link_564059354" MODIFIED="1236946094156" TEXT="gradual introduction"/>
<node CREATED="1236946043250" FOLDED="true" ID="Freemind_Link_1059546545" MODIFIED="1236946066828" TEXT="how to move to WL while preserving BL revenue base">
<node CREATED="1236450991468" ID="Freemind_Link_707077034" MODIFIED="1236450992953" TEXT="AV vendors are now beginning to realise that their time has passed and the majors (Symantec, McAfee and Trend Micro) are looking for ways to join the whitelisting movement without poisoning their AV revenues."/>
</node>
</node>
<node CREATED="1236450005937" FOLDED="true" ID="Freemind_Link_424091685" MODIFIED="1236961470843" TEXT="Application whitelisting is a good complement to other anti-virus strategies">
<node CREATED="1236961474500" ID="Freemind_Link_1597704652" MODIFIED="1236961487859" TEXT="such as blacklisting, diligent patching and user education"/>
<node CREATED="1236450292953" ID="Freemind_Link_50037921" MODIFIED="1236450295031" TEXT="and the PCI DSS (Payment Card Indus&#xad;try Data Security Standard) specifically mandates the use of anti-virus software on machines through which credit card data passes. "/>
<node CREATED="1236946097265" FOLDED="true" ID="Freemind_Link_411594815" MODIFIED="1236946112640" TEXT="Bit9 and Kaperskty partnership">
<node CREATED="1236451852828" ID="Freemind_Link_1147062864" MODIFIED="1236451853906" TEXT="In the face of that sobering reality, Kaspersky this summer will release its first consumer antivirus products that bring in whitelists. It will use lists from Bit9, a whitelisting company that maintains a 6.3 billion-strong list of known good applications. The new Kaspersky applications won&apos;t automatically block programs not on the Bit9 list, but instead will focus scanning resources on those programs that Bit9 doesn&apos;t recognize. Theoretically, that could allow for more careful scrutiny of unknown files with less risk of false alerts."/>
</node>
<node CREATED="1236451266718" FOLDED="true" ID="Freemind_Link_54335140" MODIFIED="1236451268062" TEXT="With AV, every year or so a new client security technology comes along and the death of AV is prophesised. In the end, users either decide that the new technology is not as important or good as the start-ups make out and ignore it, or it turns out that AV and the new technology have their benefits and the result is the new technology is integrated into the AV clients.">
<node CREATED="1236451325093" ID="Freemind_Link_315828894" MODIFIED="1236451333968" TEXT="deja vu"/>
<node CREATED="1236962099062" ID="Freemind_Link_956976947" MODIFIED="1236962123140" TEXT="actually abosorbed under AV name"/>
</node>
</node>
<node CREATED="1237048840515" FOLDED="true" ID="Freemind_Link_561121293" MODIFIED="1237048847015" TEXT="Cloud">
<node CREATED="1236449031843" ID="Freemind_Link_1759778517" MODIFIED="1236449052578" TEXT="probably unmanageable for the desktop"/>
<node CREATED="1236449056218" ID="Freemind_Link_1712001650" MODIFIED="1236449078921" TEXT="ping the cloud  instead">
<node CREATED="1236449081656" ID="Freemind_Link_513447697" MODIFIED="1236449086046" TEXT="trend micro">
<node CREATED="1236449143312" ID="Freemind_Link_1475444095" MODIFIED="1236449145390" TEXT="An added benefit, says Chen, is that new samples are submitted in real time and evaluated quickly. In her estimate, Trend Micro can have a new signature file for an unknown threat ready within 15 minutes. "/>
</node>
<node CREATED="1236449246156" ID="Freemind_Link_1696054038" MODIFIED="1236449265765" TEXT="this may be the new model even w/o WLs"/>
</node>
</node>
<node CREATED="1236962155734" FOLDED="true" ID="Freemind_Link_1041500481" MODIFIED="1237048649687" TEXT="General executable management">
<node CREATED="1236962266093" ID="Freemind_Link_969536630" MODIFIED="1236962268093" TEXT="So even if AV technology was capable of stopping viruses effectively, which it isn&apos;t, it would have no contribution to make to the management of executables. Whitelisting software does because, aside from stopping all malware stone dead, it can prevent the use of old versions of software or software that violates corporate policy. "/>
<node CREATED="1236451199093" ID="Freemind_Link_1978289420" MODIFIED="1236962289500" TEXT="The inevitable destiny of whitelisting technology is to share its data with some global repository as it contributes to the end-to-end management of security. Technically, that&apos;s what the merger of Patchlink with SecureWave is about. "/>
<node CREATED="1236451160531" ID="Freemind_Link_1570015860" MODIFIED="1236451163125" TEXT="In any event, there is a need for a common (probably federated) store of information about executables which comes within the remit of the CMDB (Configuration Management Database) which system management vendors will happily tell you about because it is required for system amendment as well as security."/>
<node CREATED="1236451144250" ID="Freemind_Link_572207720" MODIFIED="1236451145593" TEXT="Actually there are a whole series of network issues that require the management of a list of valid executables including software license management, software usage auditing, software provisioning and so on."/>
<node CREATED="1236986327250" ID="Freemind_Link_1269788761" MODIFIED="1236986337265" TEXT="Endpoint TCO">
<node CREATED="1236986294906" ID="Freemind_Link_1075392059" MODIFIED="1236986322640" TEXT="Application Whitelisting dramatically lowers endpoint TCO &#xa;&#xa;Automatically prevents unauthorized and unplanned change &#xa;Easily allows authorized and planned change &#xa;Automatically meets compliance requirements for control and visibility &#xa;Dramatically improves security &#x2014; with significantly less effort "/>
<node CREATED="1236986348281" ID="Freemind_Link_1197649780" MODIFIED="1236986353328" TEXT="figures?">
<node CREATED="1236986762421" ID="Freemind_Link_1519345589" MODIFIED="1236986766359" TEXT="Bit9"/>
</node>
<node CREATED="1237048041328" ID="Freemind_Link_526976068" MODIFIED="1237048058640" TEXT="maybe make this another post with those Tripwire folks"/>
</node>
</node>
</node>
<node CREATED="1229121382203" FOLDED="true" ID="Freemind_Link_889516295" MODIFIED="1237238231781" TEXT="Some recent online articles">
<node CREATED="1236448257421" LINK="http://news.cnet.com/8301-10789_3-9994679-57.html" MODIFIED="1236448257421" TEXT="news.cnet.com &gt; 8301-10789 3-9994679-57"/>
<node CREATED="1236449894187" LINK="http://searchsecurity.techtarget.com/tip/0" MODIFIED="1236449894187" TEXT="searchsecurity.techtarget.com &gt; Tip &gt; 0,289483,sid14 gci1338514,00"/>
<node CREATED="1236449953953" LINK="http://www.eweek.com/c/a/Security/Application-Whitelisting-Gains-Traction/" MODIFIED="1236449953953" TEXT="eweek.com &gt; C &gt; A &gt; Security &gt; Application-Whitelisting-Gains-Traction"/>
<node CREATED="1236450884609" LINK="http://www.it-director.com/blogs/Robin_Bloor/2007/6/The_Decline_of_AntiVirus_and_the_Rise_of_Whitelisting.html" MODIFIED="1236450884609" TEXT="it-director.com &gt; Blogs &gt; Robin Bloor &gt; 2007 &gt; 6 &gt; The Decline of AntiVirus and the Rise of Whitelisting"/>
</node>
</node>
<node CREATED="1237238234875" FOLDED="true" ID="Freemind_Link_78969089" MODIFIED="1237238488000" POSITION="left" TEXT="Author Info">
<cloud COLOR="#ffcccc"/>
<node CREATED="1237238276437" ID="Freemind_Link_1870920286" MODIFIED="1237238282203" TEXT="Luke O&apos;Connor"/>
<node CREATED="1237238330296" ID="Freemind_Link_994539107" LINK="http://lukenotricks.blogspot.com/2009/03/positive-trust-model-and-whitelists.html" MODIFIED="1237238435281" TEXT="blog post based on this map"/>
<node CREATED="1237238252031" ID="Freemind_Link_19788586" MODIFIED="1237238263265" TEXT="Uploaded March 16th, 2009"/>
</node>
</node>
</map>
