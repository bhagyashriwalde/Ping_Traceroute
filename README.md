<h3 align="center"><b>Ping - Traceroute</b></h4>

<p>The script is for pinging a list of servers and providing the ping and traceroute output. This script will help you to save time as you have to just provide the list of servers to it FQDN format and it will provide you the ping/traceroute output for all the servers in seperate files.
</p>

<summary>Script Location</summary>
  <p>/opt/IBM/common/Scripts/Ping/</p>
<summary>Command to run</summary>
  <p>./ping_traceroute.sh<inputfile></p>
<summary>Output files</summary>
    <p>/opt/IBM/common/Scripts/Ping/output/<hostname_date_time>_ping_output.txt</p>
    <p>/opt/IBM/common/Scripts/Ping/output/<hostname_date_time>_ping_traceroute.txt</p>
<br/>

<h3 align="center"><b>Key points</h4>

<summary><p>The script provides you an option whether you want to capture Traceroute output for the unreachable hosts.</p></summary>
<summary><p>It provides you details of the second pair of ping probe where you can again login and run same script to get the response.</p></summary>
<summary><p>If a particular server is not monitored from the probe, it also mentions the same which means you have not logged in to the correct Ping probe server.</p></summary>
