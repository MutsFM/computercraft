---


---

<h1 id="architech-traffic-lights">ArchiTech Traffic Lights</h1>
<p>This readme explains how the ArchiTech traffic lights function and can be installed in Minecraft. It requires the Computer Craft (CC:Tweaked) mod.</p>
<p>This readme will first show the different traffic lights and auxiliary equipment. The traffic lights are customisable and come with different lighting sequences, icons to be displayed, and colours to choose from.</p>
<h1 id="table-of-contents">Table of Contents</h1>
<ul>
<li>To be added</li>
</ul>
<h1 id="important">Important</h1>
<p>Several files in this repository need to be titled differently on your computer in Minecraft in order to work. These files have been titled differently from their intended Minecraft file title in order to be quickly able to identify which file suits your use case.</p>
<p>Each section below will indicate which files need to be titled differently on your computer in Minecraft, and will provide the correct title for use in Minecraft.</p>
<p>For example, the <code>startup-ps</code> needs to be titled as followed on your computer in Minecraft: <code>startup</code></p>
<h1 id="architech-traffic-lights-overview">ArchiTech Traffic Lights Overview</h1>
<p>ArchiTech Traffic Lights provides traffic lights for several main use cases:</p>
<ul>
<li>Traffic lights for vehicles</li>
<li>Traffic lights for vehicles and pedestrians</li>
<li>Traffic lights for vehicles and pedestrians, with pedestrian detection</li>
<li>Traffic lights for vehicles and pedestrians, with audible indicators</li>
<li>Traffic lights for vehicles and pedestrians, with pedestrian detection and audible indicators</li>
</ul>
<p>How to set up the traffic lights for these use cases is described in more detail below in the section <strong>“Use Cases”</strong>.</p>
<p><strong>The files for the use cases are furthermore subdivided based on traffic scenarios, e.g. 3 traffic lights on a through road and 1 on a side street, or 6 traffic lights on a through road and 2 on a side street. If your traffic scenario is not covered, open an issue and I would be happy to add the files for your scenario. (Of course you can always edit a traffic scenario from this repository manually on your computers in Minecraft to fit your needs).</strong></p>
<h2 id="traffic-lights-for-vehicles">Traffic Lights for Vehicles</h2>
<p>The traffic light for vehicles comes with 4 different lighting sequences and with 5 icons.</p>
<h3 id="sequences">Sequences</h3>

<table>
<thead>
<tr>
<th align="left"><strong>The Standard Sequence</strong></th>
<th align="center"><strong>The UK/German Sequence</strong></th>
<th align="center"><strong>Warning Sequence</strong></th>
<th align="center"><strong>Stop Sequence</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td align="left"><img src="/images/trafficlights/StandardSequence.gif" alt="StandardSequence"></td>
<td align="center"><img src="/images/trafficlights/GermanSequence.gif" alt="GermanSequence"></td>
<td align="center">To Be added</td>
<td align="center">To Be Added</td>
</tr>
<tr>
<td align="left">The standard green-yellow-red traffic light sequence.</td>
<td align="center">A variation on the standard sequence, in which before a red light turns green, it will shortly show the yellow/orange light together with the red light to alert drivers that it soon will turn green.</td>
<td align="center">A yellow/orange flashing warning sequence</td>
<td align="center">A flashing sequence for the red light, which in some countries indicate the traffic light should be seen as a stop sign.</td>
</tr>
</tbody>
</table><p><strong>The Standard Sequence</strong><br>
The standard green-yellow-red traffic light sequence.</p>
<p><img src="/images/trafficlights/GermanSequence.gif" alt="GermanSequence"></p>
<p><strong>The UK/German Sequence</strong><br>
A variation on the standard sequence, in which before a red light turns green, it will shortly show the yellow/orange light together with the red light to alert drivers that it soon will turn green.</p>
<h1 id="use-cases">Use Cases</h1>
<p>ArchiTech Traffic Lights cover the following use cases:</p>

<table>
<thead>
<tr>
<th align="left"><strong>Use Case</strong></th>
<th align="left"><strong>Folder</strong></th>
<th align="left"><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td align="left"><em>Traffic lights for vehicles</em></td>
<td align="left">Core</td>
<td align="left">Core set of traffic lights for vehicles</td>
</tr>
<tr>
<td align="left"><em>Traffic lights for vehicles and pedestrians</em></td>
<td align="left">WPL</td>
<td align="left">Core + traffic lights for pedestrians. The pedestrian lights are included automatically in the sequence</td>
</tr>
<tr>
<td align="left"><em>Traffic lights for vehicles and pedestrians, with pedestrian detection</em></td>
<td align="left">WPD</td>
<td align="left">WPL + pedestrian detection. The pedestrian lights only become part of the sequence once the player requests a green light for pedestrians.</td>
</tr>
<tr>
<td align="left"><em>Traffic lights for vehicles and pedestrians</em></td>
<td align="left">WPLS</td>
<td align="left">WPL + Audible Sound for pedestrians. The pedestrian lights are included automatically in the sequence. Will play alternating sounds, depending on the traffic light situation for the pedestrian.</td>
</tr>
<tr>
<td align="left"><em>Traffic lights for vehicles and pedestrians, with pedestrian detection and audible indicators</em></td>
<td align="left">WPDS</td>
<td align="left">WPD + Audible Sound for pedestrians. Same sounds as WPLS, but will only play the appropriate sounds once the player has requested a green light for pedestrians.</td>
</tr>
</tbody>
</table><p>In short</p>
<p>Only explain the logic behind the files names, not list them all. Also indicate that other variations can be created upon demand though issue opening.</p>
<h2 id="traffic-lights-for-vehicles-1">Traffic lights for vehicles</h2>
<p>This use case only requires you to place <strong>one</strong> traffic light computer and the monitors necessary for the desired amount of traffic lights. Note that one traffic light consist of 2 monitors placed on top of each other. You then need to connect the traffic lights to the computer using network cables. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile.</p>
<p>You need to place the <code>startup-tl</code> file from the main traffic lights folder on your computer, and title it <code>startup</code>.</p>
<p>You then need to select from the <code>core</code> folder the traffic scenario that fits your needs. You however need to title this program as <code>trafficlight.lua</code> on your traffic light computer in Minecraft.</p>
<blockquote>
<p>For example, the program <code>tl-2plus1</code> should be named <code>trafficlight.lua</code> on your traffic light computer in Minecraft.</p>
</blockquote>
<p>The file names for the trafficlight programs are build up as followed, so that you can identify which program you need.</p>
<ul>
<li>The numbers indicate how many traffic lights</li>
</ul>

