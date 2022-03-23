import 'package:alfred_workflow/src/extensions/string_helpers.dart';
import 'package:test/test.dart';

void main() {
  test('md5hex', () {
    expect('Lorem'.md5hex, 'db6ff2ffe2df7b8cfc0d9542bdce27dc');
    expect('ipsum'.md5hex, 'e78f5438b48b39bcbdea61b73679449d');
    expect('dolor'.md5hex, 'a98931d104a7fb8f30450547d97e7ca5');
    expect('sit'.md5hex, '87d4eeb7dec7686410748d174c0e0a11');
    expect('amet,'.md5hex, '5a3e3d45a946e52ce224472c5db8b6a6');
    expect('consectetur'.md5hex, '4c480b2170d066b2af6f98af80902ce0');
    expect('adipiscing'.md5hex, 'd540f9a8003e11e009342a40200192ea');
    expect('elit.'.md5hex, '0eedc028fc779c2eb13e494a6362135c');
    expect('Duis'.md5hex, '21a253e799186f681f4e520d06395b2f');
    expect('lacinia,'.md5hex, 'ec116b1f7146a3cb4d4a92bf1e7cccd9');
    expect('eros'.md5hex, '39eef2554d8407cbfeb017e68c8685e3');
    expect('quis'.md5hex, 'bb98d4e9c281b175ea84c517b59308ea');
    expect('consequat'.md5hex, 'cb3f4c73e4c498c768489f566045252c');
    expect('condimentum,'.md5hex, '92eba8bdfd8123cc47dbc13f01a1feb2');
    expect('metus'.md5hex, '7259bcad654293e3876bbb6a6febebe1');
    expect('est'.md5hex, '1c52bdae8bad70e82da799843bb4e831');
    expect('scelerisque'.md5hex, 'b36b698b5b1246c6d3a5a66aae98a1f5');
    expect('nunc,'.md5hex, 'ccf27bc62541abdee63a23c656b0f70b');
    expect('a'.md5hex, '0cc175b9c0f1b6a831c399e269772661');
    expect('condimentum'.md5hex, '5593a9e1c77d4f919f3137578dcbe9f3');
    expect('felis'.md5hex, '31185a5a06993cb36ad520c823809478');
    expect('felis'.md5hex, '31185a5a06993cb36ad520c823809478');
    expect('at'.md5hex, '7d0db380a5b95a8ba1da0bca241abda1');
    expect('nulla.'.md5hex, 'c0e9d11a498c44315d8884023484a4e4');
    expect('Curabitur'.md5hex, 'ac236f2663e8a6ae412f93b0a078119c');
    expect('placerat'.md5hex, '38c7b2741b1d86c35f51687f1f56fd00');
    expect('malesuada'.md5hex, '13bf4781726ab43b58cabc2d28a0ef76');
    expect('arcu'.md5hex, '2d3aa9c548f1af8f25846194f1da850c');
    expect('vitae'.md5hex, '855b1fd6af108e5f418efaa817b07f30');
    expect('auctor.'.md5hex, '44c9192e0d3d2e8a566d2a41e7a79d21');
    expect('Fusce'.md5hex, 'd7ae3621397d5975141a07e654cb1965');
    expect('a'.md5hex, '0cc175b9c0f1b6a831c399e269772661');
    expect('dolor'.md5hex, 'a98931d104a7fb8f30450547d97e7ca5');
    expect('non'.md5hex, '14b8f0494c6f1460c3720d0ce692dbca');
    expect('ex'.md5hex, '54d54a126a783bc9cba8c06137136943');
    expect('ornare'.md5hex, 'a32d05ad672c73293090c3f074ceae2d');
    expect('fringilla.'.md5hex, 'c773e056d13402e3deeaa596c6cd3774');
    expect('Quisque'.md5hex, '68f7d3423a127fd69bdc08004d856910');
    expect('bibendum'.md5hex, 'db49a477f4fec5d533d8110536817546');
    expect('malesuada'.md5hex, '13bf4781726ab43b58cabc2d28a0ef76');
    expect('nulla'.md5hex, 'bdfcacaa4e5a8b57727335c0cbf7614b');
    expect('in'.md5hex, '13b5bfe96f3e2fe411c9f66f4a582adf');
    expect('ornare.'.md5hex, '5ccf5810e299ce5ed16bed25cb55ffc4');
    expect('Pellentesque'.md5hex, '6d695300d47ed2d2b8e0c2280bd1591c');
    expect('nibh'.md5hex, '4afe8978f49b2b8389b567200ae59649');
    expect('purus,'.md5hex, '02c87187dabfcf74fd4503b1c722d586');
    expect('finibus'.md5hex, '3f9f9f63bf8fee131a31c0996df77d11');
    expect('nec'.md5hex, '0490b305539f9a2d4fb47a454c3a0dda');
    expect('ultrices'.md5hex, '248ab2d6f9df97a3047a58b5499e1efc');
    expect('nec,'.md5hex, '7550ea77723bc3366e39a8b643235fe3');
    expect('elementum'.md5hex, 'eda12856b9ad2ccabe62d448756f0991');
    expect('ut'.md5hex, 'b1a5d251fa4fe598cb947ffc42b9cbed');
    expect('sem.'.md5hex, '8a78823f89861a0a5c49e9e22ac07163');
    expect('Curabitur'.md5hex, 'ac236f2663e8a6ae412f93b0a078119c');
    expect('auctor'.md5hex, '8562ec32750f21bc83d44ecaafd95a62');
    expect('et'.md5hex, '4de1b7a4dc53e4a84c25ffb7cdb580ee');
    expect('ipsum'.md5hex, 'e78f5438b48b39bcbdea61b73679449d');
    expect('vestibulum'.md5hex, '09777ca5702506d4e13ccdf9749cc975');
    expect('mattis.'.md5hex, '05aa0ef8191e3bf815e5b86556b4c7de');
    expect('Lorem'.md5hex, 'db6ff2ffe2df7b8cfc0d9542bdce27dc');
    expect('ipsum'.md5hex, 'e78f5438b48b39bcbdea61b73679449d');
    expect('dolor'.md5hex, 'a98931d104a7fb8f30450547d97e7ca5');
    expect('sit'.md5hex, '87d4eeb7dec7686410748d174c0e0a11');
    expect('amet,'.md5hex, '5a3e3d45a946e52ce224472c5db8b6a6');
    expect('consectetur'.md5hex, '4c480b2170d066b2af6f98af80902ce0');
    expect('adipiscing'.md5hex, 'd540f9a8003e11e009342a40200192ea');
    expect('elit.'.md5hex, '0eedc028fc779c2eb13e494a6362135c');
    expect('Interdum'.md5hex, '67aaada6a02450ebbbe287d219a38c3d');
    expect('et'.md5hex, '4de1b7a4dc53e4a84c25ffb7cdb580ee');
    expect('malesuada'.md5hex, '13bf4781726ab43b58cabc2d28a0ef76');
    expect('fames'.md5hex, '4f5363aebb988074ac79ae0e68129747');
    expect('ac'.md5hex, 'e2075474294983e013ee4dd2201c7a73');
    expect('ante'.md5hex, 'ab618c3d25856955249af1a4e3e236b3');
    expect('ipsum'.md5hex, 'e78f5438b48b39bcbdea61b73679449d');
    expect('primis'.md5hex, '6e04c377d53ab9b09592a2f9504e68cd');
    expect('in'.md5hex, '13b5bfe96f3e2fe411c9f66f4a582adf');
    expect('faucibus.'.md5hex, '98512ba54b5e5b9f967161e89f598180');
    expect('Praesent'.md5hex, 'e3ce87720fa77afd40b7bdbb93513e4e');
    expect('sit'.md5hex, '87d4eeb7dec7686410748d174c0e0a11');
    expect('amet'.md5hex, '7f9a983a540e00931a69382161bdd265');
    expect('enim'.md5hex, 'a6ac54ff17ca90704e5d89a8e0d545bc');
    expect('at'.md5hex, '7d0db380a5b95a8ba1da0bca241abda1');
    expect('sem'.md5hex, 'bd9a2916f0e054a9361a98a97b8db5dc');
    expect('aliquet'.md5hex, '8e1a786fc0c37a5a15ea3a58c7b4334f');
    expect('bibendum.'.md5hex, 'eac4330fc86b19bb3e8ba9da90d46292');
    expect('In'.md5hex, 'efeb369cccbd560588a756610865664c');
    expect('hac'.md5hex, '3763e42b75ac2b1500a228bf22f4dc5b');
    expect('habitasse'.md5hex, '7c9332ba28ddd9544fb7942c7a898074');
    expect('platea'.md5hex, 'e405f11531882b9f4b2064cb6c3f588d');
    expect('dictumst.'.md5hex, '0a510265051aa82e438cb8f76b100f5c');
    expect('Nam'.md5hex, '4ad35edfc7beb97ebebb35ac572edcf7');
    expect('imperdiet'.md5hex, '15ceb382eaee2056153ac76b747c7f95');
    expect('ultricies'.md5hex, '78e2a86e251a86ad4151d8c6e3623b42');
    expect('sagittis.'.md5hex, '6083e406a716ac8fc06f2156b39afd6a');
    expect('Morbi'.md5hex, '6097c0d58243be03f0383d66acc5f50e');
    expect('posuere'.md5hex, 'dc23ec7d9708576f752f41086abda635');
    expect('neque'.md5hex, '88d2b69e23a67329d84d6c0104cdd6d6');
    expect('fringilla'.md5hex, '628e93f38039e0d664779477c11f2f6f');
    expect('mauris'.md5hex, '75bf68b7982d399df2c2ec675ffcd030');
    expect('ultrices,'.md5hex, 'ec614cff178cebee82ac5752495e677e');
    expect('sit'.md5hex, '87d4eeb7dec7686410748d174c0e0a11');
    expect('amet'.md5hex, '7f9a983a540e00931a69382161bdd265');
    expect('vehicula'.md5hex, 'ded5580b4c8673931695054f071fb6ae');
    expect('justo'.md5hex, '66c64cd3d8cafc59b39bc1a5583f3786');
    expect('sagittis.'.md5hex, '6083e406a716ac8fc06f2156b39afd6a');
    expect('Vestibulum'.md5hex, 'ce701cc4cabdef5eacb9b9fe26f7ca5d');
    expect('posuere'.md5hex, 'dc23ec7d9708576f752f41086abda635');
    expect('condimentum'.md5hex, '5593a9e1c77d4f919f3137578dcbe9f3');
    expect('leo,'.md5hex, '7ac6acde82aa41578c3678b471cf8e8f');
    expect('et'.md5hex, '4de1b7a4dc53e4a84c25ffb7cdb580ee');
    expect('cursus'.md5hex, 'e921e0fbc792e0fc7104c6470b1d0e9a');
    expect('leo'.md5hex, '0f759dd1ea6c4c76cedc299039ca4f23');
    expect('venenatis'.md5hex, '0b4d37b6b5a48329e90356777832837e');
    expect('et.'.md5hex, 'cba31d18dc1be191262fc9a407757f1f');
    expect('Nulla'.md5hex, '0437cb5a0ea1268b32908150f0e26dab');
    expect('semper'.md5hex, '4d93ec673cf2efff4b7115f99053ba5c');
    expect('arcu'.md5hex, '2d3aa9c548f1af8f25846194f1da850c');
    expect('sed'.md5hex, '177544aa797af6f322f8caa5e80e7f24');
    expect('volutpat'.md5hex, '923b22997eabf29a2adf56e77f4d3861');
    expect('semper.'.md5hex, '7edf39407b3ebb85d56777b21c699722');
  });
}
