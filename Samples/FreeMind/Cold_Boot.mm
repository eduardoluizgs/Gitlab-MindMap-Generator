<map version="0.8.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1218286445515" ID="Freemind_Link_851345858" MODIFIED="1238756147795" TEXT="The Cold Boot Attack">
<font NAME="SansSerif" SIZE="16"/>
<node BACKGROUND_COLOR="#ffcc00" CREATED="1206417868484" FOLDED="true" ID="Freemind_Link_120948751" MODIFIED="1206746361109" POSITION="right" STYLE="bubble" TEXT="the paper">
<icon BUILTIN="bookmark"/>
<node CREATED="1206420379515" ID="Freemind_Link_121678834" MODIFIED="1238755514987" TEXT="paper published Thursday February 21st, 2008"/>
<node CREATED="1206417893906" ID="Freemind_Link_152785323" LINK="http://isc.sans.org/diary.html?storyid=4006&amp;rss" MODIFIED="1206417899984" TEXT="here"/>
<node CREATED="1206417963078" ID="Freemind_Link_411955878" LINK="http://citp.princeton.edu/memory/" MODIFIED="1206417974296" TEXT="info"/>
</node>
<node CREATED="1206417237468" ID="Freemind_Link_50481406" MODIFIED="1238756095671" POSITION="right" TEXT="Summary">
<icon BUILTIN="idea"/>
<node CREATED="1206747799437" FOLDED="true" ID="Freemind_Link_1968709814" MODIFIED="1238755757532" TEXT="Result">
<node CREATED="1206749024203" FOLDED="true" ID="Freemind_Link_1643077605" MODIFIED="1238756262419" TEXT="What">
<node CREATED="1206748882546" ID="Freemind_Link_191498134" MODIFIED="1206748898859" TEXT="recovery of the encryption key">
<node CREATED="1206420810093" ID="Freemind_Link_1480114861" MODIFIED="1206420811468" TEXT="This latter feat they did by looking at scratch variables that the encryption systems use, and back-deducing what some of the damaged bits of the keys must have been. The process is a bit like a big Sudoku game; when you play Sudoku, you deduce what is missing based on what is present."/>
<node CREATED="1206749613453" MODIFIED="1206749613453" TEXT="What is new is the researchers&#x2019; ability to identify cryptographic keys and rebuild them after bits had begun decaying. They were able to reconstruct 128-bit Advanced Encryption Standard keys on which 10 percent of the bits had decayed in a matter of seconds."/>
<node CREATED="1206749210046" ID="Freemind_Link_1680511052" MODIFIED="1206749210046" TEXT="and they did some math to recover partially-damaged RSA and AES keys."/>
</node>
</node>
<node CREATED="1206749032234" FOLDED="true" ID="Freemind_Link_1715489060" MODIFIED="1238756266685" TEXT="Why">
<node CREATED="1206747806515" ID="Freemind_Link_1616706858" MODIFIED="1206748574250" TEXT="premise is that security info cleared from DRAM when powered off or rebooted"/>
<node CREATED="1206748061421" ID="Freemind_Link_836368203" MODIFIED="1206748134000" TEXT="information can be extracted for several minutes after shutdown"/>
<node CREATED="1206420503343" ID="Freemind_Link_1491289573" MODIFIED="1206420505125" TEXT="The attack is based on the insight that information stored in modern DRAM chips does not disappear the instant a computer is powered off."/>
<node CREATED="1206750031234" ID="Freemind_Link_1427144529" MODIFIED="1206750051468" TEXT="If the DRAM chip is removed from the PC and quickly chilled or frozen, all of this data will remain in place long enough for thieves to transfer the chip to another machine."/>
<node CREATED="1206417555453" FOLDED="true" ID="Freemind_Link_516023902" MODIFIED="1206417591328" TEXT="need to keep keys in RAM for efficiency purpose (disk encryption) and so as not to bother the user">
<node CREATED="1206417622937" ID="Freemind_Link_1217171627" MODIFIED="1206417624750" TEXT="While some keys might not absolutely be needed in RAM for a long term, e.g. keys to decrypt hard disk images are non-trivial to only keep for very short time in memory."/>
<node CREATED="1206750646265" ID="Freemind_Link_879762161" MODIFIED="1206750661046" TEXT="not just keys but the extended keys"/>
</node>
</node>
<node CREATED="1206749051375" FOLDED="true" ID="Freemind_Link_769123180" MODIFIED="1238756271701" TEXT="When">
<node CREATED="1206420470812" ID="Freemind_Link_412489622" MODIFIED="1206420472437" TEXT="What is unique about the Cold Boot Attack is that it also works during the period between powering off a computer and a few minutes after shut-down when the information stored in DRAM is actually gone. "/>
<node CREATED="1206421129031" ID="Freemind_Link_261127437" MODIFIED="1206421131640" TEXT="But the attack does not work on a computer that has been shut down for more than a few minutes or when a computer is hibernated or suspended. (In the latter case, all the data in memory is saved to disk, cleared and the machine is shut down). "/>
<node CREATED="1206418166328" ID="Freemind_Link_571460539" MODIFIED="1206418167500" TEXT="For the attack to work, the computer would have to first be running or in standby mode."/>
<node CREATED="1206417400218" ID="Freemind_Link_793112373" MODIFIED="1206417435750" TEXT="memory modules, even removed from the motherboard, can retain data for seconds to minutes allowing retrieval of the cryptographic keys."/>
</node>
<node CREATED="1206749056406" FOLDED="true" ID="Freemind_Link_942247129" MODIFIED="1238756276326" TEXT="How">
<node CREATED="1206421075828" ID="Freemind_Link_1678059241" MODIFIED="1206748583468" TEXT="attach a USB key with an alternate operating system. When the computer is quickly rebooted, the rogue OS grabs all the data lingering in memory and can find encryption keys (and lots of other data) in the resulting file."/>
<node CREATED="1206418305140" ID="Freemind_Link_377682300" MODIFIED="1206418327468" TEXT="cool it down get 10 mins">
<node CREATED="1206418311359" ID="Freemind_Link_706715282" MODIFIED="1206418313296" TEXT="Cooling chips down to about -58 degrees Fahrenheit (-50 degrees Celsius) gave researchers time to power down the computer and then install the memory in another PC that would boot without wiping out the data. &quot;By cooling the chips we were able to recover data perfectly after 10 minutes or more,&quot; Halderman said."/>
</node>
</node>
<node CREATED="1206418062265" FOLDED="true" ID="Freemind_Link_1241634197" MODIFIED="1238756292560" TEXT="What products work on">
<node CREATED="1206418070765" ID="Freemind_Link_647837541" MODIFIED="1206418079890" TEXT="Windows Vista&apos;s BitLocker"/>
<node CREATED="1206418081281" ID="Freemind_Link_785151616" MODIFIED="1206418086171" TEXT="Apple&apos;s FileVault."/>
</node>
</node>
<node CREATED="1206418026312" FOLDED="true" ID="Freemind_Link_1265324865" MODIFIED="1238755762235" TEXT="Sound bites">
<node CREATED="1206418033812" ID="Freemind_Link_341526076" MODIFIED="1206418035156" TEXT="Hard drive encryption has Achilles heel"/>
<node CREATED="1206749470453" MODIFIED="1206749470453" TEXT="dynamic RAM (DRAM) chips is not quite as dynamic as often thought,"/>
<node CREATED="1206750093640" MODIFIED="1206750093640" TEXT="overturned the conventional wisdom that all data held on DRAM chips disappears when a PC is turned off"/>
</node>
<node CREATED="1206747768062" FOLDED="true" ID="Freemind_Link_1791422990" MODIFIED="1238755766438" TEXT="Reactions">
<node CREATED="1206418606937" FOLDED="true" ID="Freemind_Link_1877213094" MODIFIED="1206418608734" TEXT="it is very difficult to secure data when the attacker has physical control of the machine the data is stored on">
<node CREATED="1206748682046" ID="Freemind_Link_1563158492" MODIFIED="1206748683437" TEXT="Callas still thinks the attack is an &quot;edge condition&quot; attack -- meaning that it&apos;s an attack that relies on specific and not-common situations.     means boundary condition "/>
</node>
<node CREATED="1206748207453" ID="Freemind_Link_373188335" MODIFIED="1206748263656" TEXT="present works gives details and demo">
<node CREATED="1206748265812" ID="Freemind_Link_1905331539" MODIFIED="1206748284890" TEXT="present work increases the prob "/>
<node CREATED="1206748286562" ID="Freemind_Link_1906183579" MODIFIED="1206748304390" TEXT="but conditional on hacker having physical access to the machine"/>
</node>
<node CREATED="1206748160218" ID="Freemind_Link_859558510" MODIFIED="1206748201718" TEXT="attack is known to exist in principle">
<node CREATED="1206748220500" ID="Freemind_Link_718599995" MODIFIED="1206748256593" TEXT="might think of this as a risk with low prob, and med to high seveity"/>
<node CREATED="1206418872250" ID="Freemind_Link_550525014" MODIFIED="1206418878468" TEXT="attack not new per se"/>
</node>
<node CREATED="1206420409078" ID="Freemind_Link_1591212090" MODIFIED="1206420410437" TEXT="It is significant to note that this is a hardware attack, not an attack on the encryption tools themselves. "/>
<node CREATED="1206420788750" ID="Freemind_Link_1050095911" MODIFIED="1206420790578" TEXT="Those of us who consider these things have known that this was at least in theory possible for some time. This team did two impressive things: they made it actually work, and they did some math to recover partially-damaged RSA and AES keys."/>
<node CREATED="1206749506921" ID="Freemind_Link_68166157" MODIFIED="1206749506921" TEXT="The threat is real, particularly if you are a high-value target with sophisticated enemies lying in wait for your data. But full-disk encryption is not broken, and there are simple ways to mitigate the threat."/>
<node CREATED="1206749578843" ID="Freemind_Link_382199969" MODIFIED="1206749578843" TEXT="The cryo-crypto attack is not new. &#x201c;It&#x2019;s been in the toolbox of forensics examiners for some time,&#x201d; said Murugiah Souppaya, a researcher at the National Institute of Standards and Technology."/>
</node>
<node CREATED="1206747853328" FOLDED="true" ID="Freemind_Link_144469666" MODIFIED="1238755771173" TEXT="Mitigation">
<node CREATED="1206749348781" ID="Freemind_Link_1623036172" MODIFIED="1206749348781" TEXT="Despite how dramatic this attack is, there is an easy fix for it. That is to clear the memory in which valuable information is held. The true risks come from software that relies on removing power from memory to clear it. Software that does not explicitly clear memory is at risk."/>
<node CREATED="1206748325625" ID="Freemind_Link_148217754" MODIFIED="1206749369046" TEXT="changes in HW required, may take years to implement as software approach maybe unreliable"/>
<node CREATED="1206749652656" MODIFIED="1206749652656" TEXT="The simplest way to protect yourself from this attack is to turn off your computer or put it in hibernation rather than sleep mode before leaving it. This cuts power to the DRAM, and if you stay with the computer for a few seconds before walking away, the memory will have faded enough to protect you. With tools such as BitLocker, you also can improve security by using it in a mode requiring a token to provide additional cryptographic key material. This means that a complete key will not be available on the DRAM."/>
<node CREATED="1206750220250" FOLDED="true" ID="Freemind_Link_1725057782" MODIFIED="1206750224703" TEXT="TPM">
<node CREATED="1206750227015" ID="Freemind_Link_1888710863" MODIFIED="1238756346528" TEXT="paper says it won&apos;t help but ..."/>
</node>
</node>
<node CREATED="1206748700703" FOLDED="true" ID="Freemind_Link_104408204" MODIFIED="1238755779313" TEXT="Lessons and Issues">
<edge WIDTH="thin"/>
<node CREATED="1206421261328" ID="Freemind_Link_1879337627" MODIFIED="1206421263437" TEXT="The lesson, according to Callas, is that &quot;sleep mode leaves a computer vulnerable in ways we didn&apos;t realize.&quot;"/>
<node CREATED="1206421278859" FOLDED="true" ID="Freemind_Link_438738428" MODIFIED="1206421280546" TEXT="&quot;Encryption is not magic pixie dust that makes everything okay,&quot; Callas said.">
<node CREATED="1206418484828" FOLDED="true" ID="Freemind_Link_1900186032" MODIFIED="1206418499671" TEXT="conclusion; encryption not as strong as thought">
<node CREATED="1206418501640" ID="Freemind_Link_418469302" MODIFIED="1206418514500" TEXT="not the silver bullet"/>
</node>
</node>
<node CREATED="1206747978968" FOLDED="true" ID="Freemind_Link_674117504" MODIFIED="1206748010562" TEXT="what happend to in situ memory keys during changes of machine state?">
<node CREATED="1206748019687" ID="Freemind_Link_1848333553" MODIFIED="1206748022000" TEXT="boot"/>
<node CREATED="1206748023765" ID="Freemind_Link_1693033260" MODIFIED="1206748025765" TEXT="run"/>
<node CREATED="1206748027203" ID="Freemind_Link_1590209053" MODIFIED="1206748032187" TEXT="sleep"/>
<node CREATED="1206748034171" ID="Freemind_Link_507979112" MODIFIED="1206748037500" TEXT="hibernate"/>
<node CREATED="1206748971609" ID="Freemind_Link_178752866" MODIFIED="1206748976171" TEXT="suspended"/>
<node CREATED="1206748038765" ID="Freemind_Link_1862861899" MODIFIED="1206748048218" TEXT="shutdown"/>
<node CREATED="1206748014484" ID="Freemind_Link_1006309059" MODIFIED="1206748018109" TEXT="off"/>
</node>
<node CREATED="1206749691921" MODIFIED="1206749691921" TEXT="Bill Burr, manager of the security technology group at NIST&#x2019;s Information Technology Lab, said the DRAM attack is not an attack on the cryptography itself. Protecting crypto keys will always remain a challenge."/>
<node CREATED="1206418378031" ID="Freemind_Link_782895948" MODIFIED="1206418380875" TEXT="The team&apos;s research may spur legislators to rethink that approach, Halderman said. &quot;Maybe that law is placing too much faith in disk encryption technologies,&quot; he said. &quot;It may be that we&apos;re not hearing about thefts of encrypted machines where that data could still be at risk.&quot;"/>
<node CREATED="1206417674500" FOLDED="true" ID="Freemind_Link_454453629" MODIFIED="1206417699437" TEXT="every time the media report on a lost laptop containing some long list of sensitive information that the only questions raised seem to be if the disk was encrypted or not, and why in the latter case.">
<node CREATED="1206417701750" ID="Freemind_Link_1529370953" MODIFIED="1206417721328" TEXT="attack surface has expanded"/>
</node>
<node CREATED="1206417943921" ID="Freemind_Link_1735588817" MODIFIED="1206417945296" TEXT="In the future now there should be even more questions that need answers:      * How long ago was the laptop turned off ?     * Was the laptop turned off, or just asleep?     * What encryption product was used and does it wipe its keys from RAM upon shutdown or sleep actions ?"/>
</node>
<node CREATED="1206750382281" FOLDED="true" ID="Freemind_Link_1116659773" MODIFIED="1238755783329" TEXT="Extensions">
<node CREATED="1206749925140" ID="Freemind_Link_150577409" LINK="http://security4all.blogspot.com/2008/03/tool-to-use-cold-boot-encryption-attack.html" MODIFIED="1216641369787" TEXT="code for USB released to extract memory"/>
<node CREATED="1206750392234" FOLDED="true" ID="Freemind_Link_878849307" LINK="http://www.theregister.co.uk/2008/03/28/memory_sniffer_unveiled/" MODIFIED="1206750403859" TEXT="DaisyDukes">
<node CREATED="1206750405984" ID="Freemind_Link_760468878" MODIFIED="1206750415437" TEXT="extracts passwords for apps as well"/>
<node CREATED="1206750861281" ID="Freemind_Link_535574979" LINK="http://securosis.com/2008/03/27/uh-oh-time-to-take-cold-boot-encryption-attacks-very-seriously/" MODIFIED="1206750918390" TEXT="this just makes things more serious - higher prob"/>
</node>
<node CREATED="1206751038718" ID="Freemind_Link_1477455170" LINK="http://www.symantec.com/enterprise/security_response/weblog/2008/03/practical_cold_boot_attacks.html" MODIFIED="1206751051859" TEXT="practical cold boot attacks"/>
</node>
</node>
<node CREATED="1204756961359" FOLDED="true" ID="Freemind_Link_878213912" MODIFIED="1238756086139" POSITION="right" TEXT="Sources">
<icon BUILTIN="xmag"/>
<node CREATED="1206750827437" ID="Freemind_Link_48340420" LINK="http://securosis.com/2008/02/25/evaluating-and-protecting-yourself-from-the-cold-boot-encryption-attack/" MODIFIED="1206750897703" TEXT="why aren&apos;t we following a risk based approach?"/>
<node CREATED="1204756998062" FOLDED="true" ID="Freemind_Link_1862705838" LINK="http://www.schneier.com/blog/archives/2008/02/cold_boot_attac.html" MODIFIED="1206418569218" TEXT="bruce">
<node CREATED="1206418614484" ID="Freemind_Link_27035161" MODIFIED="1206418618187" TEXT="nice work"/>
<node CREATED="1206418606937" ID="Freemind_Link_599012261" MODIFIED="1206418608734" TEXT="it is very difficult to secure data when the attacker has physical control of the machine the data is stored on"/>
<node CREATED="1206418656453" FOLDED="true" ID="Freemind_Link_1690687986" MODIFIED="1206418659234" TEXT="comments">
<node CREATED="1206418662312" ID="Freemind_Link_1935916343" MODIFIED="1206418664125" TEXT="It would seem that having the BIOS do a DRAM &quot;initialize&quot; as part of the POST process would minimize if not render this method moot."/>
<node CREATED="1206418803937" ID="Freemind_Link_1541923521" MODIFIED="1206418805750" TEXT="The DRAM hold is actually quit old news ands has a fairly simple solution.  You build your key dynamicaly into a CPU register imediatly prior to use. The key its self is either never stored in RAM or (due to OS issues) securly over writen imediatly it has been loaded etc."/>
<node CREATED="1206418903593" ID="Freemind_Link_400128609" MODIFIED="1206418904984" TEXT="Clive, the problem is you need some serious low level OS and CPU VooDoo to get a piece of memory, even just 256b, that doesn&apos;t leave the confines of the cache."/>
<node CREATED="1206419311593" ID="Freemind_Link_1159091506" MODIFIED="1206419313250" TEXT="It would not be difficult or expensive to equip new CPUs or TPMs with a few KB of very volitile memory for key storage."/>
</node>
<node CREATED="1206418982687" ID="Freemind_Link_138884126" MODIFIED="1206419005546" TEXT="it seems that bruce can just make a few remarks and set off a whole debate"/>
</node>
<node CREATED="1204757399500" FOLDED="true" ID="Freemind_Link_1196520913" MODIFIED="1206420269859" TEXT="MS">
<node CREATED="1204757720875" FOLDED="true" ID="Freemind_Link_176029431" LINK="http://www.theregister.co.uk/2008/02/27/bitlocker_hack_prevention/" MODIFIED="1204757728953" TEXT="art">
<node CREATED="1206419934765" ID="Freemind_Link_943887718" MODIFIED="1206712415397" TEXT="BitLocker can be protected"/>
<node CREATED="1206419990984" ID="Freemind_Link_791281312" MODIFIED="1206419992359" TEXT="According to Humphries, the hack is easily prevented. Users can configure BitLocker to prevent a PC from booting, or resuming from hibernation without confirmation of a password or a second key contained on a USB stick."/>
<node CREATED="1206420022031" ID="Freemind_Link_585284797" MODIFIED="1206420023312" TEXT="&quot;The thing to keep in mind here is the old adage of balancing security, usability and risk,&quot; he wrote. &quot;For example BitLocker provides several options that allow for a user (or more likely Administrator) to increase their security protections but at the cost of somewhat lowering ease-of-use.&quot;"/>
<node CREATED="1206420052031" ID="Freemind_Link_211839237" MODIFIED="1206420053328" TEXT="Humphries also worked to downplay the likelihood that an attack as exotic as this one would work in the trenches or real-world crime. Thieves would first have to get physical access to a machine and the machine would most likely need to be in sleep mode."/>
<node CREATED="1206420085421" ID="Freemind_Link_437165694" MODIFIED="1206420091359" TEXT="The Bitlocker attack is a wake-up call for privacy and security buffs because it demonstrated a fundamental weakness in a key tool used to protect sensitive data.">
<icon BUILTIN="bookmark"/>
</node>
<node CREATED="1206420127703" FOLDED="true" ID="Freemind_Link_625567121" MODIFIED="1206420129781" TEXT="there is little that can be done to prevent ghost images from being readily accessed. Software changes are likely to be ineffective, and altering the way hardware works inside a laptop would take years.">
<node CREATED="1206420133218" ID="Freemind_Link_26562898" MODIFIED="1206420140468" TEXT="another long tail"/>
</node>
</node>
<node CREATED="1206420201359" ID="Freemind_Link_1317534092" LINK="http://blogs.msdn.com/windowsvistasecurity/archive/2008/02/22/disk-encryption-balancing-security-usability-and-risk-assessment.aspx" MODIFIED="1206420264531" TEXT="MS corp blog"/>
</node>
<node CREATED="1206421916421" FOLDED="true" ID="Freemind_Link_308261890" MODIFIED="1206421918921" TEXT="SANS">
<node CREATED="1204757488953" FOLDED="true" ID="Freemind_Link_1713132690" LINK="http://isc.sans.org/diary.html?storyid=4024&amp;rss" MODIFIED="1204757507109" TEXT="vendors">
<node CREATED="1206421649890" ID="Freemind_Link_637266589" MODIFIED="1206421653812" TEXT="9 of them"/>
<node CREATED="1206421380484" FOLDED="true" ID="Freemind_Link_1245153159" LINK="http://www.utimaco.de/C12570CB0047B0D2/vwContentByKey/W26KHGVT356OBELEN/$FILE/Utimaco_Statement_FDE_vulnerability_to_key_search_in_RAM.pdf" MODIFIED="1206421395625" TEXT="Ultimaco pdf">
<node CREATED="1206421407562" ID="Freemind_Link_1542707614" MODIFIED="1206421415359" TEXT="we knew but ..."/>
<node CREATED="1206421416656" ID="Freemind_Link_1223371913" MODIFIED="1206421431453" TEXT="give mitigations which protect for most business use"/>
</node>
</node>
<node CREATED="1204758149343" FOLDED="true" ID="Freemind_Link_441432611" LINK="http://isc.sans.org/diary.html?storyid=4043&amp;rss" MODIFIED="1204758156062" TEXT="user guide">
<node CREATED="1206421929046" ID="Freemind_Link_626690626" MODIFIED="1206421936296" TEXT="great questions to ask"/>
</node>
</node>
<node CREATED="1204757534062" FOLDED="true" ID="Freemind_Link_1289738269" LINK="http://www.pgp.com/newsroom/cold_boot_attack_response.html" MODIFIED="1238755841297" TEXT="PGP">
<node CREATED="1206419373453" FOLDED="true" ID="Freemind_Link_234312748" LINK="http://blog.wired.com/27bstroke6/2008/02/encryption-stil.html" MODIFIED="1206420345046" TEXT="wired PGP">
<node CREATED="1206421129031" ID="Freemind_Link_608038913" MODIFIED="1206421131640" TEXT="But the attack does not work on a computer that has been shut down for more than a few minutes or when a computer is hibernated or suspended. (In the latter case, all the data in memory is saved to disk, cleared and the machine is shut down). "/>
<node CREATED="1206421161093" FOLDED="true" ID="Freemind_Link_47638009" MODIFIED="1206421162656" TEXT="Callas still thinks the attack is an &quot;edge condition&quot; attack -- meaning that it&apos;s an attack that relies on specific and not-common situations.">
<node CREATED="1206421164906" ID="Freemind_Link_367305605" MODIFIED="1206421172875" TEXT="means boundary condition"/>
</node>
<node CREATED="1206421261328" ID="Freemind_Link_1377578162" MODIFIED="1206421263437" TEXT="The lesson, according to Callas, is that &quot;sleep mode leaves a computer vulnerable in ways we didn&apos;t realize.&quot;"/>
<node CREATED="1206421278859" ID="Freemind_Link_1740722003" MODIFIED="1206421280546" TEXT="&quot;Encryption is not magic pixie dust that makes everything okay,&quot; Callas said."/>
</node>
<node CREATED="1206420409078" ID="Freemind_Link_1029367891" MODIFIED="1206420410437" TEXT="It is significant to note that this is a hardware attack, not an attack on the encryption tools themselves. "/>
<node CREATED="1206420470812" ID="Freemind_Link_486875181" MODIFIED="1206420472437" TEXT="What is unique about the Cold Boot Attack is that it also works during the period between powering off a computer and a few minutes after shut-down when the information stored in DRAM is actually gone. "/>
<node CREATED="1206420492125" FOLDED="true" ID="Freemind_Link_1495230517" MODIFIED="1206420500812" TEXT="the vulnerability">
<node CREATED="1206420503343" ID="Freemind_Link_1670876504" MODIFIED="1206420505125" TEXT="The attack is based on the insight that information stored in modern DRAM chips does not disappear the instant a computer is powered off."/>
</node>
<node CREATED="1206420606062" ID="Freemind_Link_436561559" MODIFIED="1206420607515" TEXT="PGP Virtual Disk not only erases the key used from memory, but prevents that key from being readable in any way once the PGP volume is unmounted. Consequently, if a user utilizes PGP Virtual Disk encryption and unmounts the volume when it is not in use, the information on the volume will not be subject to the Cold Boot Attack as described in the Princeton research paper."/>
<node CREATED="1206420732734" FOLDED="true" ID="Freemind_Link_1031228664" LINK="http://www.pgp.com/newsroom/ctocorner/coldboot.html" MODIFIED="1206420746687" TEXT="CTO comments">
<node CREATED="1206420788750" ID="Freemind_Link_622855865" MODIFIED="1206420790578" TEXT="Those of us who consider these things have known that this was at least in theory possible for some time. This team did two impressive things: they made it actually work, and they did some math to recover partially-damaged RSA and AES keys."/>
<node CREATED="1206420810093" ID="Freemind_Link_64330076" MODIFIED="1206420811468" TEXT="This latter feat they did by looking at scratch variables that the encryption systems use, and back-deducing what some of the damaged bits of the keys must have been. The process is a bit like a big Sudoku game; when you play Sudoku, you deduce what is missing based on what is present."/>
<node CREATED="1206420848453" ID="Freemind_Link_1368717250" MODIFIED="1206420859765" TEXT="Despite how dramatic this attack is, there is an easy fix for it. That is to clear the memory in which valuable information is held. The true risks come from software that relies on removing power from memory to clear it. Software that does not explicitly clear memory is at risk. Memory that has simply been written over is safe. We don&apos;t have to do it multiple times or anything special, we just have to clear it.">
<icon BUILTIN="bookmark"/>
</node>
<node CREATED="1206420994640" ID="Freemind_Link_1613766284" MODIFIED="1206421012500" TEXT="much more comment that I will not put here">
<icon BUILTIN="wizard"/>
</node>
</node>
</node>
<node CREATED="1206106020531" ID="Freemind_Link_347177984" LINK="http://www.seagate.com/docs/pdf/security/Princeton_RC514_1_0702.pdf" MODIFIED="1206106027078" TEXT="seagate comment"/>
<node CREATED="1204757949687" FOLDED="true" ID="Freemind_Link_1169881912" LINK="http://www.scmagazineus.com/Hard-encryption-keys-TPM-thwart-cold-boot-theft-Experts/article/107192/" MODIFIED="1238755858656" TEXT="shift keys off OS">
<node CREATED="1204757964093" ID="Freemind_Link_1783902120" MODIFIED="1204757967640" TEXT="use TPM"/>
</node>
<node CREATED="1204758518265" ID="Freemind_Link_23674110" LINK="http://security4all.blogspot.com/2008/03/tool-to-use-cold-boot-encryption-attack.html" MODIFIED="1238755863438" TEXT="key extraction via USB"/>
<node CREATED="1206107132390" ID="Freemind_Link_361917465" LINK="http://www.gcn.com/print/27_6/45958-1.html" MODIFIED="1238755868781" TEXT="what&apos;s new and what is not in the attack"/>
<node CREATED="1206746672187" ID="Freemind_Link_201804235" LINK="http://www.theregister.co.uk/2008/03/28/memory_sniffer_unveiled/" MODIFIED="1238755835672" TEXT="art"/>
<node CREATED="1204756972796" FOLDED="true" ID="Freemind_Link_1869591455" LINK="http://isc.sans.org/diary.html?storyid=4006&amp;rss" MODIFIED="1238755900734" TEXT="art">
<node CREATED="1206417354593" ID="Freemind_Link_1166187710" MODIFIED="1206417374250" TEXT="assumption that keys in RAM are erased when turned off"/>
<node CREATED="1206417400218" ID="Freemind_Link_1799704863" MODIFIED="1206417435750" TEXT="memory modules, even removed from the motherboard, can retain data for seconds to minutes allowing retrieval of the cryptographic keys."/>
<node CREATED="1206417555453" FOLDED="true" ID="Freemind_Link_203695136" MODIFIED="1206417591328" TEXT="need to keep keys in RAM for efficiency purpose (disk encryption) and so as not to bother the user">
<node CREATED="1206417622937" ID="Freemind_Link_1886907020" MODIFIED="1206417624750" TEXT="While some keys might not absolutely be needed in RAM for a long term, e.g. keys to decrypt hard disk images are non-trivial to only keep for very short time in memory."/>
</node>
<node CREATED="1206417674500" FOLDED="true" ID="Freemind_Link_1212383278" MODIFIED="1206417699437" TEXT="every time the media report on a lost laptop containing some long list of sensitive information that the only questions raised seem to be if the disk was encrypted or not, and why in the latter case.">
<node CREATED="1206417701750" ID="Freemind_Link_1567811769" MODIFIED="1206417721328" TEXT="attack surface has expanded"/>
</node>
<node CREATED="1206417943921" ID="Freemind_Link_996518396" MODIFIED="1206417945296" TEXT="In the future now there should be even more questions that need answers:      * How long ago was the laptop turned off ?     * Was the laptop turned off, or just asleep?     * What encryption product was used and does it wipe its keys from RAM upon shutdown or sleep actions ?"/>
</node>
<node CREATED="1204757078968" FOLDED="true" ID="Freemind_Link_284460241" LINK="http://www.first.org/newsroom/globalsecurity/212700.html" MODIFIED="1238755854203" TEXT="art">
<node CREATED="1206418112718" FOLDED="true" ID="Freemind_Link_453978914" MODIFIED="1206418114000" TEXT="Data in these DRAM (dynamic RAM) processors disappears when the computer is turned off, but it turns out that this doesn&apos;t happen right away,">
<node CREATED="1206418123906" ID="Freemind_Link_665847058" MODIFIED="1206418128406" TEXT="decays"/>
<node CREATED="1206418139390" ID="Freemind_Link_1061403758" MODIFIED="1206418142890" TEXT="secs to mins"/>
</node>
<node CREATED="1206418166328" ID="Freemind_Link_660559766" MODIFIED="1206418167500" TEXT="For the attack to work, the computer would have to first be running or in standby mode."/>
<node CREATED="1206418174406" ID="Freemind_Link_1825908179" MODIFIED="1206418182593" TEXT="really gone after a few mins"/>
<node CREATED="1206418231859" FOLDED="true" ID="Freemind_Link_261414147" MODIFIED="1206418248000" TEXT="also works when steal laptop and reboot">
<node CREATED="1206418251671" ID="Freemind_Link_1439914351" MODIFIED="1206418265421" TEXT="previous RAM image may not be wiped"/>
</node>
<node CREATED="1206418305140" FOLDED="true" ID="Freemind_Link_1854074318" MODIFIED="1206418327468" TEXT="cool it down get 10 mins">
<node CREATED="1206418311359" ID="Freemind_Link_812434269" MODIFIED="1206418313296" TEXT="Cooling chips down to about -58 degrees Fahrenheit (-50 degrees Celsius) gave researchers time to power down the computer and then install the memory in another PC that would boot without wiping out the data. &quot;By cooling the chips we were able to recover data perfectly after 10 minutes or more,&quot; Halderman said."/>
</node>
<node CREATED="1206418384156" ID="Freemind_Link_1047838823" MODIFIED="1206418391484" TEXT="rethink laws">
<node CREATED="1206418378031" ID="Freemind_Link_1372650453" MODIFIED="1206418380875" TEXT="The team&apos;s research may spur legislators to rethink that approach, Halderman said. &quot;Maybe that law is placing too much faith in disk encryption technologies,&quot; he said. &quot;It may be that we&apos;re not hearing about thefts of encrypted machines where that data could still be at risk.&quot;"/>
</node>
<node CREATED="1206418484828" FOLDED="true" ID="Freemind_Link_1767750659" MODIFIED="1206418499671" TEXT="conclusion; encryption not as strong as thought">
<node CREATED="1206418501640" ID="Freemind_Link_835008270" MODIFIED="1206418514500" TEXT="not the silver bullet"/>
</node>
</node>
</node>
<node CREATED="1238755543862" FOLDED="true" ID="_" MODIFIED="1238755698392" POSITION="left" TEXT="Author ">
<node CREATED="1238755548846" ID="Freemind_Link_546705849" LINK="http://lukenotricks.blogspot.com/" MODIFIED="1238755584643" TEXT="Luke O&apos;Connor"/>
<node CREATED="1238755586924" ID="Freemind_Link_1854722519" LINK="http://lukenotricks.blogspot.com/2008/03/encryption-back-on-prime-time.html" MODIFIED="1238755710626" TEXT="July 2008 post based on this map"/>
</node>
</node>
</map>
