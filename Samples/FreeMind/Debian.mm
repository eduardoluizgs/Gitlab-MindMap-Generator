<map version="0.8.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node BACKGROUND_COLOR="#ccff66" CREATED="1215803324343" ID="Freemind_Link_1928052031" MODIFIED="1216028313935" TEXT="Debian Crypto Incident&#xa;            May 2008">
<font NAME="SansSerif" SIZE="16"/>
<node CREATED="1216024429067" ID="Freemind_Link_1005106628" MODIFIED="1216024435122" POSITION="right" TEXT="links">
<node CREATED="1215803389375" FOLDED="true" ID="_" LINK="http://wiki.debian.org/SSLkeys#head-d841ac769390d013577ce3fd2be24b8cf5a74cfb" MODIFIED="1215803405687" TEXT="Debian wiki">
<node CREATED="1215803452015" ID="Freemind_Link_1192126220" MODIFIED="1215803482437" TEXT="# weak keys for both clients and servers (see section &quot;Identifying Weak Keys below&quot;) &#xa;# all key types that were generated using openssl (this includes RSA and DSA keys) &#xa;#  compromise of other keys or passwords that were transmitted over an encrypted link that was set up using weak keys. &#xa;&#xa;Note that this last point means that passwords transmitted over ssh to a server with a weak dsa server key could be compromised too; see the Debian project&apos;s reaction to this."/>
<node CREATED="1215803504468" ID="Freemind_Link_1230575367" MODIFIED="1215803516234" TEXT="weakness in OpenSSL as used by Debian"/>
<node CREATED="1215803826453" FOLDED="true" ID="Freemind_Link_1248903178" MODIFIED="1215803835875" TEXT="many apps impacted">
<node CREATED="1215804216921" ID="Freemind_Link_202065688" MODIFIED="1215804240921" TEXT="gives lots of detail on how to detect and rollover keys for various apps"/>
</node>
<node CREATED="1215803861390" ID="Freemind_Link_783325738" LINK="https://secure.comodo.net/utilities/decodeCSR.html" MODIFIED="1215803870765" TEXT="CSR checker"/>
<node CREATED="1215803958859" FOLDED="true" ID="Freemind_Link_1968059547" MODIFIED="1215803973250" TEXT="how weak?">
<node CREATED="1215803991750" ID="Freemind_Link_915382974" MODIFIED="1215804004546" TEXT="weak version only used PID as seed"/>
<node CREATED="1215804093937" ID="Freemind_Link_1974829986" MODIFIED="1215804104859" TEXT="2^15-1 values"/>
<node CREATED="1215804105828" ID="Freemind_Link_1836636230" MODIFIED="1215804126968" TEXT="Non-broken OpenSSL seeds from PID and /dev/urandom."/>
</node>
<node CREATED="1215804243687" FOLDED="true" ID="Freemind_Link_923254434" MODIFIED="1215804246125" TEXT="detail">
<node CREATED="1215804293671" ID="Freemind_Link_28889998" MODIFIED="1215804295890" TEXT="This was caused by an overzealous, well-intentioned elimination of code that was believed to have no impact on security. (Please do note from the above links that this was discussed with the !OpenSSL team and that no objections were raised at the time.)"/>
<node CREATED="1215804427781" ID="Freemind_Link_1182699347" LINK="http://svn.debian.org/viewsvn/pkg-openssl/openssl/trunk/rand/md_rand.c?rev=141&amp;view=diff&amp;r1=141&amp;r2=140&amp;p1=openssl/trunk/rand/md_rand.c&amp;p2=/openssl/trunk/rand/md_rand.c" MODIFIED="1215804437859" TEXT="the code change"/>
<node CREATED="1215804545984" ID="Freemind_Link_399589849" MODIFIED="1215804547578" TEXT="The second of these is in  ssleay_rand_bytes  where  buf  is used as an output buffer. It had already been marked as a bad idea when -DPURIFY was in effect, because Purify (and valgrind, naturally) dislike this use of an output buffer as input. This use of  MD_Update  is dubious but shouldn&apos;t hurt as long as the mixing function of the PRNG is &quot;sufficiently good&quot;. The removal of this call to MD_Update should not meaningfully alter the entropy available in the pool -- that is, OpenSSL does not depend upon uninitialized memory for its correct operation.  The first call, however, is in  ssleay_rand_add  where  buf  is used as an INPUT buffer, to add entropy to the pool. Failing to call  MD_Update  there means that the pool will never actually get the entropy intended for it."/>
</node>
</node>
<node CREATED="1215803567640" FOLDED="true" ID="Freemind_Link_638526891" LINK="http://lists.debian.org/debian-security-announce/2008/msg00152.html" MODIFIED="1215803600890" TEXT="debian project post">
<node CREATED="1215804669578" ID="Freemind_Link_426696170" MODIFIED="1215804671437" TEXT="On May 13th, 2008"/>
<node CREATED="1215803620718" ID="Freemind_Link_1504514754" MODIFIED="1215803622515" TEXT="Luciano Bello discovered that the random number generator in Debian&apos;s openssl package is predictable.  This is caused by an incorrect Debian-specific change to the openssl package (CVE-2008-0166).  As a result, cryptographic key material may be guessable."/>
<node CREATED="1215803652015" ID="Freemind_Link_1988707098" MODIFIED="1215803655390" TEXT="This is a Debian-specific vulnerability which does not affect other operating systems which are not based on Debian.  However, other systems can be indirectly affected if weak keys are imported into them."/>
<node CREATED="1215803688390" ID="Freemind_Link_641660839" MODIFIED="1215803690234" TEXT="It is strongly recommended that all cryptographic key material which has been generated by OpenSSL versions starting with 0.9.8c-1 on Debian systems is recreated from scratch."/>
<node CREATED="1215803714890" ID="Freemind_Link_1744431101" MODIFIED="1215803716718" TEXT="Affected keys include SSH keys, OpenVPN keys, DNSSEC keys, and key material for use in X.509 certificates and session keys used in SSL/TLS connections.  Keys generated with GnuPG or GNUTLS are not affected, though."/>
</node>
<node CREATED="1215803903890" FOLDED="true" ID="Freemind_Link_1370473209" LINK="http://metasploit.com/users/hdm/tools/debian-openssl/" MODIFIED="1215803927468" TEXT="metasploit">
<node CREATED="1215804752859" ID="Freemind_Link_191086760" MODIFIED="1215804756671" TEXT="Removing this code has the side effect of crippling the seeding process for the OpenSSL PRNG. Instead of mixing in random data for the initial seed, the only &quot;random&quot; value that was used was the current process ID. On the Linux platform, the default maximum process ID is 32,768, resulting in a very small number of seed values being used for all PRNG operations."/>
<node CREATED="1215804798828" ID="Freemind_Link_1406114388" MODIFIED="1215804801125" TEXT="All SSL and SSH keys generated on Debian-based systems (Ubuntu, Kubuntu, etc) between September 2006 and May 13th, 2008 may be affected."/>
<node CREATED="1215804804578" ID="Freemind_Link_1062510286" MODIFIED="1215804811984" TEXT="lists other impacts as well"/>
<node CREATED="1215804937187" ID="Freemind_Link_587785023" MODIFIED="1215804938718" TEXT="When creating a new OpenSSH key, there are only 32,767 possible outcomes for a given architecture, key size, and key type. The reason is that the only &quot;random&quot; data being used by the PRNG is the ID of the process."/>
</node>
<node CREATED="1215805016890" FOLDED="true" ID="Freemind_Link_1193249974" LINK="http://www.heise-online.co.uk/security/Debian-package-of-OpenSSL-generates-weak-keys--/news/110727" MODIFIED="1215805027921" TEXT="heise security">
<node CREATED="1215805048875" ID="Freemind_Link_715346225" MODIFIED="1215806886812" TEXT="Since a faulty patch in 2006, the OpenSSL library used by Linux distribution Debian has been generating weak cryptographic keys.">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1215805078718" ID="Freemind_Link_1012454386" MODIFIED="1215805080281" TEXT="Security expert Luciano Bello has now discovered a critical vulnerability in the OpenSSL package which makes the random number sequences, and therefore keys generated, predictable."/>
<node CREATED="1215805106859" ID="Freemind_Link_602580739" MODIFIED="1215805108187" TEXT="The problem only affects Debian and distributions derived from it, such as Ubuntu and Knoppix."/>
<node CREATED="1215805160859" ID="Freemind_Link_311362980" MODIFIED="1215805162265" TEXT="OpenSSL provides connection security for many important network services, such as the Apache web server, the SSH login service, the OpenVPN service, the Bind name server, S/MIME e-mail encryption and the trustworthiness of digital signatures. This could enable attackers to listen in on and manipulate SSL connections, obtain unauthorised access to SSH servers or poison DNS server caches. Encryption systems such as PGP and GnuPG, which are not based on SSL or TLS, are not affected."/>
</node>
<node CREATED="1215805344703" FOLDED="true" ID="Freemind_Link_1639851698" LINK="http://www.securityfocus.com/brief/739?ref=rss" MODIFIED="1215805352000" TEXT="sec focus">
<node CREATED="1215805374078" ID="Freemind_Link_1459666493" MODIFIED="1215805376109" TEXT="A flaw in the way that OpenSSL is implemented in the Ubuntu and Debian distributions of Linux have earned the software an unenviable adjective in the world of encryption: Predictable."/>
</node>
<node CREATED="1215805520609" FOLDED="true" ID="Freemind_Link_855852583" LINK="http://isc.sans.org/diary.html?storyid=4421" MODIFIED="1215978384437" TEXT="SANS diary">
<node CREATED="1215805583250" ID="Freemind_Link_1479666002" MODIFIED="1215805584984" TEXT="But this is not all &#x2013; keep in mind that ANY cryptographic material created on vulnerable systems can be compromised. If you generated SSL keys on such Debian or Ubuntu systems, you will have to recreate the certificates and get them signed again. An attacker can even decrypt old SSH sessions now."/>
</node>
<node CREATED="1215805689875" FOLDED="true" ID="Freemind_Link_792135780" LINK="http://www.links.org/?p=327" MODIFIED="1215805699890" TEXT="Ben Laurie">
<node CREATED="1215805723750" ID="Freemind_Link_738842758" MODIFIED="1215805725718" TEXT="The result of this is that for the last two years (from Debian&#x2019;s &#x201c;Etch&#x201d; release until now), anyone doing pretty much any crypto on Debian (and hence Ubuntu) has been using easily guessable keys. This includes SSH keys, SSL keys and OpenVPN keys."/>
<node CREATED="1215805757593" ID="Freemind_Link_1595990737" MODIFIED="1215805759218" TEXT="What can we learn from this? Firstly, vendors should not be fixing problems (or, really, anything) in open source packages by patching them locally - they should contribute their patches upstream to the package maintainers."/>
<node CREATED="1215805797312" ID="Freemind_Link_1435734959" MODIFIED="1215805799125" TEXT="Had Debian done this in this case, we (the OpenSSL Team) would have fallen about laughing, and once we had got our breath back, told them what a terrible idea this was. But no, it seems that every vendor wants to &#x201c;add value&#x201d; by getting in between the user of the software and its author.">
<node CREATED="1215805801140" ID="Freemind_Link_1072993391" MODIFIED="1215805826546" TEXT="breaking Linus&apos; Law"/>
</node>
<node CREATED="1215805853062" ID="Freemind_Link_844946359" MODIFIED="1215805854234" TEXT="Secondly, if you are going to fix bugs, then you should install this maxim of mine firmly in your head: never fix a bug you don&#x2019;t understand. I&#x2019;m not sure I&#x2019;ve ever put that in writing before, but anyone who&#x2019;s worked with me will have heard me say it multiple times."/>
<node CREATED="1215805934140" ID="Freemind_Link_1858118716" MODIFIED="1215805935546" TEXT="Valgrind tracks the use of uninitialised memory. Usually it is bad to have any kind of dependency on uninitialised memory, but OpenSSL happens to include a rare case when its OK, or even a good idea: its randomness pool.">
<node CREATED="1215806015609" ID="Freemind_Link_1274963753" MODIFIED="1215806021125" TEXT="177 comments"/>
<node CREATED="1215806023593" ID="Freemind_Link_1382920150" MODIFIED="1215806026468" TEXT="rant"/>
</node>
<node CREATED="1215806081984" ID="Freemind_Link_803063900" LINK="http://www.links.org/?p=328" MODIFIED="1215806098359" TEXT="more aftermath">
<node CREATED="1215806206765" ID="Freemind_Link_762082452" MODIFIED="1215806212656" TEXT="clarification"/>
<node CREATED="1215806213921" ID="Freemind_Link_1817918666" MODIFIED="1215806221687" TEXT="55 comments"/>
</node>
</node>
<node CREATED="1215806307828" FOLDED="true" ID="Freemind_Link_338393330" LINK="http://www.emergentchaos.com/archives/2008/05/the_difference_between_kn.html" MODIFIED="1215806321312" TEXT="Emergent">
<node CREATED="1215806327562" ID="Freemind_Link_597849639" MODIFIED="1215806343296" TEXT="ok commentary"/>
</node>
<node CREATED="1215806417921" FOLDED="true" ID="Freemind_Link_495352417" LINK="http://blogs.zdnet.com/security/?p=1102" MODIFIED="1215806433671" TEXT="DR">
<node CREATED="1215806435796" ID="Freemind_Link_1775474" MODIFIED="1215806451875" TEXT="HD Moore record time exploit"/>
<node CREATED="1215806487625" ID="Freemind_Link_662056765" MODIFIED="1215806489281" TEXT="These lines were removed because they caused the Valgrind and Purify tools to produce warnings about the use of uninitialized data in any code that was linked to OpenSSL. "/>
<node CREATED="1215806518718" FOLDED="true" ID="Freemind_Link_1537562424" MODIFIED="1215806520468" TEXT="Just goes to show you, no matter how great your tool set is, and I do like Valgrind, you have to understand how they work and more importantly how your code works.">
<node CREATED="1215806523093" ID="Freemind_Link_1317257107" MODIFIED="1215806548546" TEXT="well you have to know what the programmer is thinking"/>
</node>
<node CREATED="1215806580890" ID="Freemind_Link_1829672159" MODIFIED="1215806582234" TEXT="No tool can be smart enough to tell you that the warning its complaining about with uninitialized data should be ignored (or at least fixed and not removed from the codebase) because it will effectively render the encryption you are trying to accomplish neutered."/>
</node>
<node CREATED="1215806655265" FOLDED="true" ID="Freemind_Link_1895498907" LINK="http://www.theregister.co.uk/2008/05/16/debian_openssl_flaw/" MODIFIED="1215806672625" TEXT="Reg">
<node CREATED="1215806875953" ID="Freemind_Link_148715629" MODIFIED="1215806894765" TEXT="One reader forwarded an excerpt from an internal discussion within the Debian Security Team that suggested the bug resides within OpenSSL itself and dates from May 2006. This pointed to possible flaws in OpenSSL 0.9.8b-1. However, the same source later told us, the flaw was later pinned down to OpenSSL 0.9.8c, as described in Debian&apos;s advisory. &quot;They&apos;re still not revealing the full truth, particularly the fact the keyspace involved is only 215 possible permutations per architecture and thus very easily compromised if someone has a botnet at their disposal,&quot; our source said.">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1215806935296" FOLDED="true" ID="Freemind_Link_397218586" LINK="http://www.theregister.co.uk/2008/05/21/massive_debian_openssl_hangover/" MODIFIED="1215806944468" TEXT="Reg 2">
<node CREATED="1215806965906" ID="Freemind_Link_1220048848" MODIFIED="1215806967359" TEXT="It&apos;s been more than a week since Debian patched a massive security hole in the library the operating system uses to create cryptographic keys for securing email, websites and administrative servers. Now the hard work begins, as legions of admins are saddled with the odious task of regenerating keys too numerous for anyone to estimate."/>
<node CREATED="1215807017062" ID="Freemind_Link_1184791712" MODIFIED="1215807018250" TEXT="Certificates for defective keys will have to be revoked, new keys will have to be generated and, in the case of SSL certificates, registered with VeriSign or another certificate authority. No one knows how many keys need to be replaced, but it could number in the hundreds of thousands or millions. The keys are used for Secure Sockets Layer (SSL) transactions, which authenticate servers handling trusted websites and email, and to authenticate Secure Shell (SSH), which provides encrypted channels between sensitive computers."/>
<node CREATED="1215807072453" ID="Freemind_Link_1749736073" MODIFIED="1215807073718" TEXT="The heft and tedium of tracking down, testing and regenerating so many keys, and the cost of paying certificate authorities to register them, has left some people feeling pessimistic about the prospects the problem will be fixed anytime soon.">
<node CREATED="1215807075515" ID="Freemind_Link_912976219" MODIFIED="1215807078078" TEXT="LT"/>
</node>
<node CREATED="1215807151250" ID="Freemind_Link_710205199" MODIFIED="1215807152515" TEXT="&quot;I can&apos;t imagine how painful this will be for people who are using large data centers with hundreds of certificates,&quot; Ellis said."/>
<node CREATED="1215807191859" ID="Freemind_Link_531563404" MODIFIED="1215807193109" TEXT="The Debian bug was introduced in September 2006. It vastly reduces the amount of entropy used when programs like the Apache webserver, Sendmail, Exim and some implementations of Kerberos use OpenSSL to perform basic cryptographic functions. As a result, attackers can crack SSL keys, x.509 certificate keys, SSH keys, and digital signatures in fewer than 33,000 guesses, rather than the seemingly-infinite number of tries that would normally be required."/>
<node CREATED="1215807227187" ID="Freemind_Link_1899926791" MODIFIED="1215807228484" TEXT="Tools available from Ubuntu and Metasploit author HD Moore are designed to aid in the process of detecting weak keys, but Appelbaum, the independent researcher, says certain conditions will prevent even diligent searches from finding everything. For example, keys with nonstandard sizes may not be flagged even though they&apos;re vulnerable."/>
</node>
<node CREATED="1215807279703" FOLDED="true" ID="Freemind_Link_938144532" LINK="http://www.heise-online.co.uk/security/Fallout-from-the-OpenSSL-debacle--/news/110750" MODIFIED="1215807290375" TEXT="HS2">
<node CREATED="1215807313625" ID="Freemind_Link_1614556701" MODIFIED="1215807316781" TEXT="He believes that package maintainers should not play with source code they don&apos;t understand. Instead they should talk to the developers who can assess the patches and integrate them into the source code, effectively contributing their fixes upstream. According to Laurie, had Debian followed this policy, the OpenSSL problem would never have arisen."/>
<node CREATED="1215807350828" ID="Freemind_Link_732447087" MODIFIED="1215807352062" TEXT="Responsibility does not in this case lie exclusively with the maintainers of the Debian OpenSSL package. They were apparently fully aware that the change would result in a loss of randomness, for which reason they consulted the OpenSSL developers list to ensure that what they were doing was OK before introducing the fatal error into the package. No objections were registered, even after the event. Laurie backpedals somewhat in a subsequent blog entry and admits to communication problems within the OpenSSL team."/>
</node>
<node CREATED="1215807697687" FOLDED="true" ID="Freemind_Link_372842931" LINK="http://www.heise-online.co.uk/security/Good-numbers-bad-numbers--/features/110885" MODIFIED="1215807710656" TEXT="HS3">
<node CREATED="1215808725359" ID="Freemind_Link_377869544" MODIFIED="1215808738250" TEXT="best discussion"/>
<node CREATED="1215808920921" ID="Freemind_Link_44386105" LINK="http://www.heise-online.co.uk/security/Good-numbers-bad-numbers--/features/110885/5" MODIFIED="1215808928406" TEXT="last page"/>
</node>
<node CREATED="1215808993828" FOLDED="true" ID="Freemind_Link_525367663" LINK="http://www.heise-online.co.uk/networks/tools/chksslkey" MODIFIED="1215809003578" TEXT="online test tool">
<node CREATED="1215809078953" ID="Freemind_Link_9921267" MODIFIED="1215809085125" TEXT="SSL Guardian"/>
</node>
</node>
<node CREATED="1216024511745" ID="Freemind_Link_1727117829" MODIFIED="1216024515013" POSITION="left" TEXT="Author">
<node CREATED="1216024522328" ID="Freemind_Link_347385202" LINK="http://lukenotricks.blogspot.com/" MODIFIED="1216024744519" TEXT="Luke O&apos;Connor"/>
<node CREATED="1216024531169" ID="Freemind_Link_761877753" LINK="http://lukenotricks.blogspot.com/2008/07/blackish-swan-for-debian-crypto.html" MODIFIED="1216024721996" TEXT="mind map used for this blog post"/>
</node>
</node>
</map>
