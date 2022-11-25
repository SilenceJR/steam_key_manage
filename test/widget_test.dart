// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:steam_key_manage/http/http_client.dart';
import 'package:steam_key_manage/main.dart';
import 'package:steam_key_manage/model/humble_order_model.dart';
import 'package:steam_key_manage/utils/data_parser.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  String html = """
  <div class="base-main-wrapper">
      <div class="page_title"></div>
      <div class="inner-main-wrapper">

<div class="js-library-holder js-holder is-hidden"><div class="header">
  <div class="container">
    <h1>Humble Library</h1>

    <div class="filter">
      <div class="switch-platform js-platform-filter-holder"><label for="platform">个平台</label>
<select name="switch-platform" id="switch-platform" class="js-platform">
  <option value="all" selected="">全部</option>
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  <option value="linux">Linux</option>
    
  
    
  <option value="mac">Mac</option>
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  <option value="steam">Steam</option>
    
  
    
  
    
  
    
  
    
  <option value="windows">Windows</option>
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
</select>
</div>
      <div class="search">
        <input type="text" id="search" name="search" class="js-search" control-id="ControlID-6">
        <i class="hb hb-times-circle clear-search js-clear-search"></i>
        <i class="hb hb-search"> </i>
      </div>
    </div>
  </div>
  <hr>
  <div class="container">
    <div class="top-controls">
      <div class="switch-sort-order">
        <label for="sort-order">排序</label>
        <select name="sort-order" id="sort-order" class="js-sort-order" control-id="ControlID-7">
          <option value="human_name">按字母顺序</option>
          <option value="updated">近期更新</option>
        </select>
      </div>
      <div class="switch-download-method">
        <label for="download-method">下载方式</label>
        <select name="download-method" id="download-method" class="js-download-method" control-id="ControlID-8">
          <option value="bittorrent">BitTorrent</option>
          <option value="direct" selected="">直接链接</option>
        </select>
      </div>
    </div>
  </div>
</div>
<div class="hb-download-list download-list">
  <div class="scrollbar-hider">
    <div class="no-results js-no-results" style="display: none;">未找到任何内容</div>
    <div class="column subproducts-holder js-subproducts-holder"><div class="subproduct-selector selected"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="112 Operator">112 Operator</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/11240343c705f9b0f895bf6915f3d060d189d7d1.png?auto=compress,format&amp;s=db89f96626723320e2aea600f6f7f01e')"></div><div class="text-holder">
    <h2 title="Alt254">Alt254</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Ambassador: Fractured Timelines">The Ambassador: Fractured Timelines</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Amnesia: Rebirth">Amnesia: Rebirth</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Ancestors: The Humankind Odyssey">Ancestors: The Humankind Odyssey</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Autonauts">Autonauts</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Basement">Basement</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Beast Inside">The Beast Inside</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Black Future '88">Black Future '88</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/f5b1e8eb4304f21616e332a252593bf3c7771607.png?auto=compress,format&amp;s=8b57258e4f90d9ce90bbac01d52d3bf4')"></div><div class="text-holder">
    <h2 title="Carto Sneak Peek">Carto Sneak Peek</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Catherine Classic">Catherine Classic</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Children of Morta">Children of Morta</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/bccec934954df458a4f451a05d88930e725a481e.png?auto=compress,format&amp;s=d6d2deebb39018e32d2bde7b7ec4c9dc')"></div><div class="text-holder">
    <h2 title="Co-open">Co-open</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/8ff9f3c97a603797626559df4110fe14e3f525b5.png?auto=compress,format&amp;s=a06f29efe5db4793e8e29eaf263534d2')"></div><div class="text-holder">
    <h2 title="THE CORRIDOR">THE CORRIDOR</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/b8d2f819183784e9ed13b0b99327b626956f9a1b.png?auto=compress,format&amp;s=434565f5ec1597365c8948d9ca5e5438')"></div><div class="text-holder">
    <h2 title="CreatorCrate">CreatorCrate</h2>
    <p>Jori Ryan</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Crying Suns">Crying Suns</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Darksburg">Darksburg</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Darksiders III">Darksiders III</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Darkwood">Darkwood</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Deleveled">Deleveled</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="ENSLAVED™: Odyssey to the West™ Premium Edition">ENSLAVED™: Odyssey to the West™ Premium Edition</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Evoland Legendary Edition">Evoland Legendary Edition</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Fae Tactics">Fae Tactics</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Fantasy Blacksmith">Fantasy Blacksmith</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/4eea719d5cbc2ff9cf5899ce42505782e646b030.png?auto=compress,format&amp;s=977b7755723debec8b56645c57523baf')"></div><div class="text-holder">
    <h2 title="Fate of Kai">Fate of Kai</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Forager">Forager</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Frog Detective">Frog Detective</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Frog Detective 2">Frog Detective 2</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Fun with Ragdolls">Fun with Ragdolls</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="GARAGE: Bad Trip">GARAGE: Bad Trip</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Generation Zero">Generation Zero</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="GET EVEN">GET EVEN</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Goat of Duty">Goat of Duty</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Golf With Your Friends + Caddypack DLC + OST">Golf With Your Friends + Caddypack DLC + OST</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Golf With Your Friends - OST">Golf With Your Friends - OST</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/e0da848972d003b94013e5af2806224ec608659a.png?auto=compress,format&amp;s=76a7597fa30dea3c5181931d0d3b9047')"></div><div class="text-holder">
    <h2 title="The Groundz">The Groundz</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Guts and Glory">Guts and Glory</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/2e6841c99f8322d05d4792b53d4cdb70cb689630.png?auto=compress,format&amp;s=4fd73c5d38ba225ae452c194cf2896fa')"></div><div class="text-holder">
    <h2 title="Heeey! Park-Boy">Heeey! Park-Boy</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Hiveswap Friendsim">Hiveswap Friendsim</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Imperator Rome Deluxe Edition">Imperator Rome Deluxe Edition</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Indivisible">Indivisible</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/b00d2509f9e2b400c1a8b16fe0d3111709d3cd39.png?auto=compress,format&amp;s=eea3ad75b418838daaae93c54219d710')"></div><div class="text-holder">
    <h2 title="Influent">Influent</h2>
    <p>Robert Howland</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Iron Danger">Iron Danger</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="John Wick Hex">John Wick Hex</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Katana Zero">Katana Zero</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Kingdom: Classic">Kingdom: Classic</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Lethal League Blaze">Lethal League Blaze</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Lightmatter">Lightmatter</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Little Misfortune">Little Misfortune</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Minoria">Minoria</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Not Tonight">Not Tonight</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Occupation">The Occupation</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="One Step from Eden">One Step from Eden</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Overcooked! 2">Overcooked! 2</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Pac-Man 256">Pac-Man 256</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Path of Giants">Path of Giants</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Pathologic 2">Pathologic 2</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="PC Building Simulator">PC Building Simulator</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/68e33aebaabde9328a25cbfcbc55214fd04b3139.png?auto=compress,format&amp;s=fbcf011cdb7acfe43dddb4198e1129d8')"></div><div class="text-holder">
    <h2 title="Retired Men's Nude Beach Volleyball">Retired Men's Nude Beach Volleyball</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Ring of Pain">Ring of Pain</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Rover Mechanic Simulator">Rover Mechanic Simulator</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/83317cfb73eca32c4d9d4c5d7c004a35063ff5ca.png?auto=compress,format&amp;s=e59c6292a2539daedfcdd8073bdfc636')"></div><div class="text-holder">
    <h2 title="Ruin Raiders - Unknown Menace">Ruin Raiders - Unknown Menace</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Seven: Enhanced Edition">Seven: Enhanced Edition</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Shadows Awakening">Shadows Awakening</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Shapeshifting Detective">The Shapeshifting Detective</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Shining Resonance Refrain">Shining Resonance Refrain</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/b17b28967b5525f5d86473c3627cf26f9890b6c9.png?auto=compress,format&amp;s=9833f65cf5b4091191f4fc5aa7d669a6')"></div><div class="text-holder">
    <h2 title="Sluggish Morss Pattern Circus">Sluggish Morss Pattern Circus</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Smile For Me">Smile For Me</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Song of Horror">Song of Horror</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Still There">Still There</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Strange Brigade">Strange Brigade</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Struggling">Struggling</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Suicide of Rachel Foster">The Suicide of Rachel Foster</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Sunless Sea">Sunless Sea</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Sunless Skies">Sunless Skies</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Syberia 3">Syberia 3</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/57a4c7182e0ad7888e63ac429c65e27a92850e32.png?auto=compress,format&amp;s=501ca2d4b5667045208a2f0cd2fcd2d7')"></div><div class="text-holder">
    <h2 title="Syzygy">Syzygy</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Tabletop Playground">Tabletop Playground</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Tales of the Neon Sea">Tales of the Neon Sea</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Textorcist">Textorcist</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Tools Up!">Tools Up!</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon" style="background-image: url('https://hb.imgix.net/df3a8f7d1955754c5c1b2b3e8aacc4bc4413f189.png?auto=compress,format&amp;s=88b08ac6c8daa0f47bb24be4bdf3f060')"></div><div class="text-holder">
    <h2 title="TORII">TORII</h2>
    <p>Humble Games</p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Total Tank Simulator">Total Tank Simulator</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Townsmen - A Kingdom Rebuilt">Townsmen - A Kingdom Rebuilt</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Tropico 6 El Prez Edition">Tropico 6 El Prez Edition</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Tsioque">Tsioque</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="The Uncertain: Last Quiet Day">The Uncertain: Last Quiet Day</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Vampire: The Masquerade - Shadows of New York">Vampire: The Masquerade - Shadows of New York</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Vampire The Masquerade: Coteries of New York">Vampire The Masquerade: Coteries of New York</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Warhammer: Chaosbane">Warhammer: Chaosbane</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Yakuza Kiwami 2">Yakuza Kiwami 2</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Yooka-Laylee and the Impossible Lair">Yooka-Laylee and the Impossible Lair</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Youropa">Youropa</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Zwei: The Arges Adventure">Zwei: The Arges Adventure</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div><div class="subproduct-selector"><div class="selector-content">
  <div class="icon"></div><div class="text-holder">
    <h2 title="Zwei: The Ilvard Insurrection">Zwei: The Ilvard Insurrection</h2>
    <p></p>
  </div>
  <div class="pointer"></div>
</div>

</div></div>
  </div>
  <div class="column details-column js-details-column">
    <div class="js-scroll-follower scroll-follower" style="position: relative; top: 0px; left: 0px;">
      <div class="details-holder js-details-holder"><div class="details-view"><div class="details-heading">
  <div class="modal-holder"></div>

    <div class="icon"></div>
    <div class="text-holder">
      <h2 title="112 Operator">112 Operator</h2>
      <p></p>
    </div>

</div>



<div class="js-platform-select-holder select-holder"></div>






<div class="key-redeemers">

  
  <div class="platform steam">
    <h3><i class="hb hb-steam"></i>Steam</h3>
    <hr>

    <div class="js-keyredeemer-holder"><div class="key-redeemer">


<div class="heading-text">
  <h4>112 Operator
  
  </h4>
  <a href="https://support.humblebundle.com/hc/articles/204008710-How-To-Redeem-Steam-Keys" target="_blank">Steam Instructions</a>

</div>


<div class="container js-third-party">
  <div title="NXPN4-ERN84-BPVM2" class="js-keyfield keyfield redeemed enabled">
    <div class="keyfield-value">NXPN4-ERN84-BPVM2</div>
  
    <a class="steam-redeem-button js-steam-redeem-button" href="https://store.steampowered.com/account/registerkey?key=NXPN4-ERN84-BPVM2" target="_blank">
      <div class="steam-redeem-text">兑换</div>
      <span class="tooltiptext">在 Steam 上兑换</span>
    </a>
  
  
    <div class="spinner-icon" aria-label="载入中">
        <i class="hb hb-spinner hb-spin"></i>
    </div>
  </div>
  
</div>
  
  
<p class="disclaimer"><strong>Steam will not provide extra giftable copies of games you already own.</strong></p>
  
  



</div></div>
  </div>

</div>


</div></div>
    </div>
  </div>
</div>
</div>
<div class="js-purchase-holder js-holder"><div class="js-unclaimed-orders-holder unclaimed-orders-holder"></div>
<div class="header">
  <div class="container">
    <h1>已购买的产品</h1>

    <div class="search">
      <input type="text" id="purchase-search" name="purchase-search" control-id="ControlID-18">
      <i class="hb hb-times-circle js-clear-search clear-search"></i>
      <i class="hb hb-search"></i>
    </div>
  </div>
  <hr>
  <div class="container">
    <div class="sort">
      <label for="purchase-sort">排序</label>
      <select name="purchase-sort" id="purchase-sort" control-id="ControlID-19">
        <option value="human_name">按字母顺序</option>
        <option value="created" selected="">最近</option>
      </select>
    </div>
    <div class="js-pagination-holder pagination-holder">
</div>
  </div>
</div>
<div class="no-results js-no-results" style="display: none;">未找到任何内容</div>
<div class="results js-results">
  <div class="heading">
    <div class="product-name">产品</div>
    <div class="order-placed">日期</div>
    <div class="total">合计</div>
  </div>
  <div class="body"><div class="row js-row" data-hb-gamekey="3AvK8cpkZPcaqFr6">
  <div class="product-name">
    October 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年10月26日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="6aTvuxKmYp3bevFk">
  <div class="product-name">
    September 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年9月28日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="tTssDNwAmykKazAN">
  <div class="product-name">
    August 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年8月31日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="fHs68qVysAyySXPN">
  <div class="product-name">
    July 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年7月6日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="FVeSwnh4mX882zXy">
  <div class="product-name">
    March 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年3月2日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="Fu4wyd7pNPsm7Bze">
  <div class="product-name">
    February 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年2月23日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="Hmrbz4xn6CycyWMe">
  <div class="product-name">
    January 2021 Humble Choice
  </div>
  <div class="order-placed">
    2021年1月27日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="WUu47TufDav3YCBN">
  <div class="product-name">
    Bomber Crew
  </div>
  <div class="order-placed">
    2021年1月14日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="fRdZn7xPbHWDtnfD">
  <div class="product-name">
    December 2020 Humble Choice
  </div>
  <div class="order-placed">
    2020年12月25日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="KSX3edfKBh5qFEnu">
  <div class="product-name">
    Seven: Enhanced Edition
  </div>
  <div class="order-placed">
    2020年12月9日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="sRBY6v88d6Cnnwp6">
  <div class="product-name">
    November 2020 Humble Choice
  </div>
  <div class="order-placed">
    2020年11月8日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="DCZGXNRkdsE6u7RU">
  <div class="product-name">
    Kingdom: Classic
  </div>
  <div class="order-placed">
    2020年11月3日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="qqSxkbuutfCWHfnk">
  <div class="product-name">
    October 2020 Humble Choice
  </div>
  <div class="order-placed">
    2020年10月6日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="Vxq4hNcHnRTKAMam">
  <div class="product-name">
    Influent
  </div>
  <div class="order-placed">
    2020年9月20日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="qNmfTFSV28eeHM24">
  <div class="product-name">
    September 2020 Humble Choice
  </div>
  <div class="order-placed">
    2020年9月20日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="RGenEs7EeEPVWcTh">
  <div class="product-name">
    Humble BANDAI NAMCO Bundle 4
  </div>
  <div class="order-placed">
    2020年5月19日
  </div>
  <div class="total">
  
    礼品
  
  </div>

</div>
<div class="row js-row" data-hb-gamekey="5DAqZCKmT8beHzEH">
  <div class="product-name">
    DiRT Showdown
  </div>
  <div class="order-placed">
    2017年1月13日
  </div>
  <div class="total">
  
    --
  
  </div>

</div>
</div>
</div>
<div class="js-pagination-holder pagination-holder">
</div>
</div>
<div class="js-claimed-orders-holder js-holder is-hidden"></div>
<div class="js-key-manager-holder js-holder is-hidden"></div>
<div class="js-coupon-holder js-holder is-hidden"><h1>Humble 优惠券</h1>

<p>您没有任何优惠券。</p>

<p><a href="https://support.humblebundle.com/hc/articles/205273768" target="_blank">了解优惠券的更多信息</a></p>

</div>
<div class="bottom-tab-shortcuts">
  <a href="/home/library">库</a> |
  <a href="/home/purchases">订单
</a> |
  <a href="/home/keys">密钥和权益</a> |
  <a href="/home/coupons">优惠券
</a>
</div>
</div>
  
</div>
  """;

  test('humble', () async {
    var dataParser = DataParser();
    var res =
        await dataParser.findOrderKey(data: html, user: '597471205@qq.com');

    print('结果数量: ${res.length}');
    for (var value in res) {
      print(value);
    }
  });

  test('humbleOrder', () async {
    var client = Client()..init();

    var res = await client.dio.get(
        'https://www.humblebundle.com/api/v1/order/3AvK8cpkZPcaqFr6',
        queryParameters: {'all_tpkds': 'true'});

    print('res: $res');

    var humbleOrderModel = HumbleOrderModel.fromJson(res.data);

    log('humbleOrderModel: ${humbleOrderModel.toString()}');
  });
}
