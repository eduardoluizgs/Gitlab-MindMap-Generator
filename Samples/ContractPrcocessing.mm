<map version="0.8.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node BACKGROUND_COLOR="#ffff00" CREATED="1168083784656" ID="Freemind_Link_1008075266" MODIFIED="1168083944468" TEXT="   Contract&#xa;Processing">
<edge WIDTH="thin"/>
<font BOLD="true" NAME="SansSerif" SIZE="20"/>
<node COLOR="#006699" CREATED="1168083807078" ID="_" MODIFIED="1168168193484" POSITION="right" STYLE="bubble" TEXT="Create a New Contract" VSHIFT="-53">
<edge COLOR="#990033" WIDTH="2"/>
<cloud/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#006699" CREATED="1168084204921" ID="Freemind_Link_1922340826" MODIFIED="1168168189046" TEXT="Validations">
<edge COLOR="#990033" WIDTH="2"/>
<node COLOR="#006699" CREATED="1168084210812" ID="Freemind_Link_174493834" MODIFIED="1168093662078" STYLE="fork" TEXT="Person requiring the contract must exist"/>
<node COLOR="#006699" CREATED="1168084230187" ID="Freemind_Link_1361508331" MODIFIED="1168173727015" STYLE="fork" TEXT="Check unit availablility">
<node CREATED="1168173731609" ID="Freemind_Link_863158565" MODIFIED="1168173900296" STYLE="fork" TEXT="Booking">
<node COLOR="#006699" CREATED="1168173770234" ID="Freemind_Link_1494573543" MODIFIED="1168178498375" TEXT="Check that the units have a booking state &quot;ACTIVE&quot;" VSHIFT="2">
<edge COLOR="#990033" WIDTH="2"/>
</node>
</node>
<node CREATED="1168177387421" ID="Freemind_Link_233153604" MODIFIED="1168279894593" TEXT="Contract">
<node COLOR="#006699" CREATED="1168177747734" ID="Freemind_Link_1611344551" MODIFIED="1168279980125" TEXT="Or check if there are any &quot;PLANNED&quot; or &quot;ACTIVE&quot; contracts on this unit" VSHIFT="2">
<edge COLOR="#990033" WIDTH="2"/>
</node>
</node>
</node>
<node COLOR="#006699" CREATED="1168086006718" ID="Freemind_Link_1026398070" MODIFIED="1168093662078" STYLE="fork" TEXT="Free days before and after should be specified for each unit"/>
<node COLOR="#006699" CREATED="1168086027703" ID="Freemind_Link_834616186" MODIFIED="1168093662078" STYLE="fork" TEXT="An ocupant should be specified for each unit"/>
<node COLOR="#006699" CREATED="1168086049093" ID="Freemind_Link_1654353353" MODIFIED="1168093662078" STYLE="fork" TEXT="Start and End date for contract must be specified"/>
<node COLOR="#006699" CREATED="1168086066765" ID="Freemind_Link_828182990" MODIFIED="1168093664421" STYLE="fork" TEXT="Currency and Financial Data must be specified"/>
</node>
<node COLOR="#006699" CREATED="1168085954281" ID="Freemind_Link_439766083" MODIFIED="1168169869890" TEXT="Actions" VSHIFT="5">
<edge COLOR="#990033" WIDTH="2"/>
<node CREATED="1168163764953" ID="Freemind_Link_1547738202" MODIFIED="1168163844609" TEXT="Set the puprose of the contract to NEW"/>
<node CREATED="1168086390109" ID="Freemind_Link_615675488" MODIFIED="1168086423953" TEXT="Register Tenant as a Customer if not already a customer"/>
<node CREATED="1168086113421" ID="Freemind_Link_1569696507" MODIFIED="1168429359218" TEXT="Create a new contract with status DRAFT" VSHIFT="-11"/>
</node>
</node>
<node CREATED="1168083841453" HGAP="33" ID="Freemind_Link_106760072" MODIFIED="1168109008718" POSITION="right" STYLE="bubble" TEXT="Approve Contract" VSHIFT="-14">
<edge COLOR="#009933" WIDTH="2"/>
<font NAME="SansSerif" SIZE="14"/>
<node CREATED="1168087202640" ID="Freemind_Link_805611868" MODIFIED="1168109135562" TEXT="Validations" VSHIFT="-8">
<edge COLOR="#009933" WIDTH="2"/>
<node CREATED="1168087205953" ID="Freemind_Link_1909211944" MODIFIED="1168087325453" TEXT="Contract is DRAFT"/>
<node CREATED="1168087277406" ID="Freemind_Link_38561118" MODIFIED="1168087285421" TEXT="Action password required"/>
</node>
<node CREATED="1168087246859" ID="Freemind_Link_1906018717" MODIFIED="1168109139359" TEXT="Actions" VSHIFT="-8">
<edge COLOR="#009933" WIDTH="2"/>
<node CREATED="1168087250234" HGAP="35" ID="Freemind_Link_271092656" MODIFIED="1168182994156" TEXT="Change the Status to PLANNED" VSHIFT="34"/>
<node CREATED="1168086514734" HGAP="22" ID="Freemind_Link_631812311" MODIFIED="1168173234109" TEXT="Perform Some Finance Transactions" VSHIFT="-13">
<icon BUILTIN="help"/>
<node CREATED="1168086528312" HGAP="26" ID="Freemind_Link_1404318523" MODIFIED="1168107171562" TEXT="Debit" VSHIFT="3">
<node CREATED="1168086548671" ID="Freemind_Link_796158511" MODIFIED="1168086560375" TEXT="Security Deposit"/>
<node CREATED="1168086561484" ID="Freemind_Link_1345398124" MODIFIED="1168086569437" TEXT="Contract Amount"/>
</node>
<node CREATED="1168086537656" ID="Freemind_Link_1067253276" MODIFIED="1168107168765" TEXT="Credit" VSHIFT="-2">
<node CREATED="1168086574453" ID="Freemind_Link_462595915" MODIFIED="1168086578906" TEXT="Retention Amount"/>
<node CREATED="1168086582468" ID="Freemind_Link_1500540448" MODIFIED="1168086587015" TEXT="Booking Fee Amount"/>
</node>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1168109011750" HGAP="34" ID="Freemind_Link_1430557929" MODIFIED="1168109087312" POSITION="right" TEXT="Activate Contract">
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#0033ff" CREATED="1168109028890" HGAP="30" ID="Freemind_Link_260949663" MODIFIED="1168109101703" TEXT="Actions" VSHIFT="2">
<node COLOR="#0033ff" CREATED="1168109035265" ID="Freemind_Link_700806097" MODIFIED="1168177715000" TEXT="Change the contract status to ACTIVE" VSHIFT="3"/>
<node COLOR="#0033ff" CREATED="1168086485687" ID="Freemind_Link_115057900" MODIFIED="1168173851000" TEXT="Migrate Unit from Previous State ">
<edge COLOR="#808080" WIDTH="thin"/>
<icon BUILTIN="clanbomber"/>
<node COLOR="#cc6600" CREATED="1168171758390" ID="Freemind_Link_1084122239" MODIFIED="1168172071687" TEXT="WaitingList">
<node COLOR="#0033ff" CREATED="1168171780406" ID="Freemind_Link_288456280" MODIFIED="1168177508796" TEXT="Find the units that were in WaitingLists having the state &quot;WAITING&quot;">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#0033ff" CREATED="1168171922750" ID="Freemind_Link_1682413953" MODIFIED="1168177532000" TEXT="Change the status of all these WaitingLists to &quot;CONTRACT&quot;">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
</node>
<node COLOR="#cc6600" CREATED="1168171762375" ID="Freemind_Link_1153906706" MODIFIED="1168172073406" TEXT="Booking">
<node COLOR="#0033ff" CREATED="1168171959453" ID="Freemind_Link_141185708" MODIFIED="1168177561218" TEXT="Find the units that were in Booking and have the status &quot;ACTIVE&quot;">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#0033ff" CREATED="1168172001250" ID="Freemind_Link_1582822591" MODIFIED="1168173856359" TEXT="Change the status of all the Bookings to CONTRACT">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
</node>
<node COLOR="#cc6600" CREATED="1168177623468" ID="Freemind_Link_484735645" MODIFIED="1168177662421" TEXT="Unit">
<edge COLOR="#808080" WIDTH="thin"/>
<node COLOR="#0033ff" CREATED="1168177626390" HGAP="48" ID="Freemind_Link_1668833608" MODIFIED="1168183047593" TEXT="Change all the unit status to &quot;RENTED&quot;" VSHIFT="2">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#ff0000" CREATED="1168083832203" HGAP="35" ID="Freemind_Link_1863996070" MODIFIED="1168093929812" POSITION="right" STYLE="bubble" TEXT="Renew Contract" VSHIFT="-15">
<edge COLOR="#0000cc" WIDTH="2"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#ff0000" CREATED="1168086671312" ID="Freemind_Link_619692884" MODIFIED="1168429843406" TEXT="Validations" VSHIFT="23">
<edge COLOR="#0000cc" WIDTH="2"/>
<node COLOR="#006633" CREATED="1168086689875" ID="Freemind_Link_1231017716" MODIFIED="1168093689578" STYLE="bubble" TEXT="Contract Already Exists"/>
<node COLOR="#006633" CREATED="1168086709515" ID="Freemind_Link_1643590023" MODIFIED="1168429839125" TEXT="Occupants exist as Customers or Persons"/>
</node>
<node COLOR="#ff0000" CREATED="1168086674687" ID="Freemind_Link_1169772479" MODIFIED="1168093674234" TEXT="Actions" VSHIFT="18">
<edge COLOR="#0000cc" WIDTH="2"/>
<node COLOR="#006633" CREATED="1168086740796" ID="Freemind_Link_1554135939" MODIFIED="1168093697375" TEXT="Create a new contract as a Clone of the Old Contract"/>
<node COLOR="#006633" CREATED="1168164002875" ID="Freemind_Link_1464128414" MODIFIED="1168164049671" TEXT="Set the status of the new contract to DRAFT">
<edge COLOR="#0000cc" WIDTH="2"/>
</node>
<node COLOR="#006633" CREATED="1168086781406" ID="Freemind_Link_1415350210" MODIFIED="1168163954453" TEXT="Set the purpose of the new contract to RENEWAL"/>
<node COLOR="#006633" CREATED="1168086907812" ID="Freemind_Link_486310719" MODIFIED="1168163981218" TEXT="Mark the old contract as ISRENEWED"/>
<node COLOR="#006633" CREATED="1168086955906" ID="Freemind_Link_1746276258" MODIFIED="1168093697375" TEXT="Mark old contract status to EXPIRED"/>
<node COLOR="#006633" CREATED="1168086865828" ID="Freemind_Link_1926367869" MODIFIED="1168164036578" TEXT="Let the new contract reference the old contract"/>
<node COLOR="#006633" CREATED="1168086798484" ID="Freemind_Link_1390284486" MODIFIED="1168093697375" TEXT="Update occupants for each unit"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1168087908468" HGAP="38" ID="Freemind_Link_1230916954" MODIFIED="1168429886921" POSITION="right" STYLE="bubble" TEXT="Break Contract" VSHIFT="28">
<edge COLOR="#ff00ff" WIDTH="2"/>
<cloud COLOR="#ccccff"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#0033ff" CREATED="1168083860437" HGAP="25" ID="Freemind_Link_1855344539" MODIFIED="1168093847062" STYLE="bubble" TEXT="Partial Break" VSHIFT="7">
<edge COLOR="#ff00ff" WIDTH="2"/>
<node COLOR="#0033ff" CREATED="1168087957078" HGAP="25" ID="Freemind_Link_1696280639" MODIFIED="1168167987531" TEXT="Checks" VSHIFT="17">
<node COLOR="#0033ff" CREATED="1168094236250" ID="Freemind_Link_42075025" MODIFIED="1168183112875" TEXT="An Active Contract already exists" VSHIFT="2">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1168087960390" ID="Freemind_Link_34898662" MODIFIED="1168167985453" TEXT="Actions" VSHIFT="5">
<node COLOR="#0033ff" CREATED="1168094255625" ID="Freemind_Link_494783364" MODIFIED="1168094699796" TEXT="Create a new Contract that is a Clone of the old Contract">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#0033ff" CREATED="1168094307390" ID="Freemind_Link_1049703286" MODIFIED="1168094699796" TEXT="Set the status of the old contract as BREAK">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#0033ff" CREATED="1168164272421" ID="Freemind_Link_216071934" MODIFIED="1168164300078" TEXT="Set the Purpose of the new contract to TRANSFER">
<edge COLOR="#ff00ff" WIDTH="2"/>
</node>
<node COLOR="#0033ff" CREATED="1168094364671" ID="Freemind_Link_1128386587" MODIFIED="1168094699796" TEXT="Remove or Add units to the new contract">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#0033ff" CREATED="1168094381500" ID="Freemind_Link_549093" MODIFIED="1168094699781" TEXT="Modify the Start and the End Times of the Contract to support the new changes">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#0033ff" CREATED="1168094605843" ID="Freemind_Link_246377656" MODIFIED="1168094699781" TEXT="Set the new contract to reference the new contract">
<edge COLOR="#ff00ff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#0033ff" CREATED="1168433009828" ID="Freemind_Link_1539244239" MODIFIED="1168433075218" TEXT="Recalculate money in the new contract after removing units from the old contract">
<edge COLOR="#ff00ff" WIDTH="2"/>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1168083854921" HGAP="28" ID="Freemind_Link_438733046" MODIFIED="1168093847062" STYLE="bubble" TEXT="Full Break" VSHIFT="6">
<edge COLOR="#ff00ff" WIDTH="2"/>
<node COLOR="#0033ff" CREATED="1168087594062" ID="Freemind_Link_295803255" MODIFIED="1168093847062" TEXT="Checks">
<node COLOR="#0033ff" CREATED="1168087597312" ID="Freemind_Link_579274276" MODIFIED="1168093847062" TEXT="An Active Contract already exists"/>
</node>
<node COLOR="#0033ff" CREATED="1168087667125" ID="Freemind_Link_58671282" MODIFIED="1168093847062" TEXT="Actions">
<node COLOR="#0033ff" CREATED="1168087669468" ID="Freemind_Link_54984395" MODIFIED="1168093847062" TEXT="Set a new expiration date"/>
<node COLOR="#0033ff" CREATED="1168087685687" ID="Freemind_Link_1525536669" MODIFIED="1168093847062" TEXT="Set Contract status to BROKEN"/>
</node>
</node>
</node>
<node COLOR="#990099" CREATED="1168083847906" HGAP="26" ID="Freemind_Link_1087182549" MODIFIED="1168093812437" POSITION="right" STYLE="bubble" TEXT="Delete Contract" VSHIFT="29">
<edge COLOR="#003333" WIDTH="2"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#990099" CREATED="1168087442437" ID="Freemind_Link_334811252" MODIFIED="1168093825062" TEXT="Checks" VSHIFT="-2">
<edge COLOR="#003333" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#990099" CREATED="1168087448921" HGAP="22" ID="Freemind_Link_1457976428" MODIFIED="1168093830484" TEXT="Contract exists as DRAFT" VSHIFT="3"/>
</node>
<node COLOR="#990099" CREATED="1168087495890" HGAP="21" ID="Freemind_Link_348213909" MODIFIED="1168093825062" TEXT="Actions" VSHIFT="5">
<edge COLOR="#003333" WIDTH="2"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#990099" CREATED="1168087498796" ID="Freemind_Link_38899051" MODIFIED="1168093830484" TEXT="Set Contract status to DELETED" VSHIFT="3"/>
</node>
</node>
<node COLOR="#990000" CREATED="1168093950265" HGAP="24" ID="Freemind_Link_611114165" MODIFIED="1168094215312" POSITION="right" STYLE="bubble" TEXT="Update Contract" VSHIFT="21">
<edge COLOR="#00ffff" WIDTH="2"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#990000" CREATED="1168093996046" ID="Freemind_Link_218085871" MODIFIED="1168094189546" STYLE="bubble" TEXT="Checks">
<edge COLOR="#00ffff"/>
<node COLOR="#990000" CREATED="1168093999562" ID="Freemind_Link_530602192" MODIFIED="1168094196765" TEXT="Exiting DRAFT Contract"/>
</node>
<node COLOR="#990000" CREATED="1168094047203" ID="Freemind_Link_630496368" MODIFIED="1168094189546" STYLE="bubble" TEXT="Actions">
<edge COLOR="#00ffff"/>
<node COLOR="#990000" CREATED="1168094050359" ID="Freemind_Link_1787964505" MODIFIED="1168094196765" TEXT="Modify Contract Data"/>
<node COLOR="#990000" CREATED="1168094057468" ID="Freemind_Link_115908258" MODIFIED="1168094196765" TEXT="Add or Remove Units "/>
<node COLOR="#990000" CREATED="1168094061687" ID="Freemind_Link_892582158" MODIFIED="1168094196765" TEXT="Persist Modifyied Contract"/>
</node>
</node>
<node COLOR="#cc3300" CREATED="1168167703937" ID="Freemind_Link_383258253" MODIFIED="1168168123765" POSITION="right" TEXT="Append To Contract">
<edge COLOR="#808080" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#cc3300" CREATED="1168167715156" ID="Freemind_Link_1029632502" MODIFIED="1168168113890" TEXT="Checks" VSHIFT="5">
<node COLOR="#cc3300" CREATED="1168167718671" HGAP="21" ID="Freemind_Link_303325734" MODIFIED="1168168078078" TEXT="Contract is ACTIVE" VSHIFT="2">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
</node>
<node COLOR="#cc3300" CREATED="1168167726375" ID="Freemind_Link_1101559496" MODIFIED="1168168111156" TEXT="Actions" VSHIFT="30">
<edge COLOR="#808080" WIDTH="thin"/>
<node COLOR="#cc3300" CREATED="1168167738312" ID="Freemind_Link_986581596" MODIFIED="1168168078859" TEXT="Create a new Clone of the old Contract">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#cc3300" CREATED="1168167789859" ID="Freemind_Link_1433312578" MODIFIED="1168168079718" TEXT="Set the new status of the Contract to DRAFT">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#cc3300" CREATED="1168167801953" ID="Freemind_Link_123799460" MODIFIED="1168168080562" TEXT="Add any extra items to the new Contract (units or parkings)">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#cc3300" CREATED="1168167928406" ID="Freemind_Link_442525870" MODIFIED="1168168081390" TEXT="Set the purpose of the new contract to SUPPLEMENT">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#cc3300" CREATED="1168432834906" ID="Freemind_Link_1908469575" MODIFIED="1168432853421" TEXT="Relate both contracts">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
<node COLOR="#cc3300" CREATED="1168433257750" ID="Freemind_Link_1777602169" MODIFIED="1168433274359" TEXT="Recalculate the money of the new contract">
<edge COLOR="#808080" WIDTH="thin"/>
</node>
</node>
</node>
<node CREATED="1168441295421" FOLDED="true" ID="Freemind_Link_1664373575" MODIFIED="1168441310796" POSITION="left" TEXT="Actions supported on Contracts">
<node CREATED="1168441312203" ID="Freemind_Link_1374065010" MODIFIED="1168441487953" TEXT="Draft" VSHIFT="-3">
<node CREATED="1168441334890" ID="Freemind_Link_1812485006" MODIFIED="1168441336609" TEXT="Modify"/>
<node CREATED="1168441343437" HGAP="21" ID="Freemind_Link_1027113708" MODIFIED="1168441493968" TEXT="Delete" VSHIFT="-2"/>
<node CREATED="1168441505000" ID="Freemind_Link_1713349206" MODIFIED="1168441506296" TEXT="Print"/>
</node>
<node CREATED="1168441325515" HGAP="21" ID="Freemind_Link_405304475" MODIFIED="1168441485734" TEXT="Expired" VSHIFT="-6"/>
<node CREATED="1168441321218" ID="Freemind_Link_1775651755" MODIFIED="1168441466812" TEXT="Broken" VSHIFT="1"/>
<node CREATED="1168441319125" ID="Freemind_Link_216895093" MODIFIED="1168441320390" TEXT="Planned">
<node CREATED="1168441383921" ID="Freemind_Link_267337749" MODIFIED="1168441385859" TEXT="Break"/>
<node CREATED="1168441386671" ID="Freemind_Link_963170018" MODIFIED="1168441392078" TEXT="Partial Break"/>
<node CREATED="1168441392843" ID="Freemind_Link_878931646" MODIFIED="1168441395078" TEXT="Supplement"/>
</node>
<node CREATED="1168441316859" ID="Freemind_Link_23948389" MODIFIED="1168441318343" TEXT="Active">
<node CREATED="1168441360125" ID="Freemind_Link_706935041" MODIFIED="1168441361609" TEXT="Break"/>
<node CREATED="1168441363625" ID="Freemind_Link_1467533006" MODIFIED="1168441367703" TEXT="Partial Break"/>
<node CREATED="1168441371437" ID="Freemind_Link_871926706" MODIFIED="1168441373828" TEXT="Supplement"/>
<node CREATED="1168441448328" ID="Freemind_Link_1670644780" MODIFIED="1168441449625" TEXT="Renew"/>
</node>
</node>
</node>
</map>
