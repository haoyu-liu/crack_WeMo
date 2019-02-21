package net.lingala.zip4j.crypto.engine;

import java.lang.reflect.Array;
import net.lingala.zip4j.exception.ZipException;

public class AESEngine
{
  private static final byte[] S;
  private static final int[] T0;
  private static final int[] rcon;
  private int C0;
  private int C1;
  private int C2;
  private int C3;
  private int rounds;
  private int[][] workingKey = null;
  
  static
  {
    byte[] arrayOfByte = new byte['Ā'];
    arrayOfByte[0] = 99;
    arrayOfByte[1] = 124;
    arrayOfByte[2] = 119;
    arrayOfByte[3] = 123;
    arrayOfByte[4] = -14;
    arrayOfByte[5] = 107;
    arrayOfByte[6] = 111;
    arrayOfByte[7] = -59;
    arrayOfByte[8] = 48;
    arrayOfByte[9] = 1;
    arrayOfByte[10] = 103;
    arrayOfByte[11] = 43;
    arrayOfByte[12] = -2;
    arrayOfByte[13] = -41;
    arrayOfByte[14] = -85;
    arrayOfByte[15] = 118;
    arrayOfByte[16] = -54;
    arrayOfByte[17] = -126;
    arrayOfByte[18] = -55;
    arrayOfByte[19] = 125;
    arrayOfByte[20] = -6;
    arrayOfByte[21] = 89;
    arrayOfByte[22] = 71;
    arrayOfByte[23] = -16;
    arrayOfByte[24] = -83;
    arrayOfByte[25] = -44;
    arrayOfByte[26] = -94;
    arrayOfByte[27] = -81;
    arrayOfByte[28] = -100;
    arrayOfByte[29] = -92;
    arrayOfByte[30] = 114;
    arrayOfByte[31] = -64;
    arrayOfByte[32] = -73;
    arrayOfByte[33] = -3;
    arrayOfByte[34] = -109;
    arrayOfByte[35] = 38;
    arrayOfByte[36] = 54;
    arrayOfByte[37] = 63;
    arrayOfByte[38] = -9;
    arrayOfByte[39] = -52;
    arrayOfByte[40] = 52;
    arrayOfByte[41] = -91;
    arrayOfByte[42] = -27;
    arrayOfByte[43] = -15;
    arrayOfByte[44] = 113;
    arrayOfByte[45] = -40;
    arrayOfByte[46] = 49;
    arrayOfByte[47] = 21;
    arrayOfByte[48] = 4;
    arrayOfByte[49] = -57;
    arrayOfByte[50] = 35;
    arrayOfByte[51] = -61;
    arrayOfByte[52] = 24;
    arrayOfByte[53] = -106;
    arrayOfByte[54] = 5;
    arrayOfByte[55] = -102;
    arrayOfByte[56] = 7;
    arrayOfByte[57] = 18;
    arrayOfByte[58] = Byte.MIN_VALUE;
    arrayOfByte[59] = -30;
    arrayOfByte[60] = -21;
    arrayOfByte[61] = 39;
    arrayOfByte[62] = -78;
    arrayOfByte[63] = 117;
    arrayOfByte[64] = 9;
    arrayOfByte[65] = -125;
    arrayOfByte[66] = 44;
    arrayOfByte[67] = 26;
    arrayOfByte[68] = 27;
    arrayOfByte[69] = 110;
    arrayOfByte[70] = 90;
    arrayOfByte[71] = -96;
    arrayOfByte[72] = 82;
    arrayOfByte[73] = 59;
    arrayOfByte[74] = -42;
    arrayOfByte[75] = -77;
    arrayOfByte[76] = 41;
    arrayOfByte[77] = -29;
    arrayOfByte[78] = 47;
    arrayOfByte[79] = -124;
    arrayOfByte[80] = 83;
    arrayOfByte[81] = -47;
    arrayOfByte[83] = -19;
    arrayOfByte[84] = 32;
    arrayOfByte[85] = -4;
    arrayOfByte[86] = -79;
    arrayOfByte[87] = 91;
    arrayOfByte[88] = 106;
    arrayOfByte[89] = -53;
    arrayOfByte[90] = -66;
    arrayOfByte[91] = 57;
    arrayOfByte[92] = 74;
    arrayOfByte[93] = 76;
    arrayOfByte[94] = 88;
    arrayOfByte[95] = -49;
    arrayOfByte[96] = -48;
    arrayOfByte[97] = -17;
    arrayOfByte[98] = -86;
    arrayOfByte[99] = -5;
    arrayOfByte[100] = 67;
    arrayOfByte[101] = 77;
    arrayOfByte[102] = 51;
    arrayOfByte[103] = -123;
    arrayOfByte[104] = 69;
    arrayOfByte[105] = -7;
    arrayOfByte[106] = 2;
    arrayOfByte[107] = Byte.MAX_VALUE;
    arrayOfByte[108] = 80;
    arrayOfByte[109] = 60;
    arrayOfByte[110] = -97;
    arrayOfByte[111] = -88;
    arrayOfByte[112] = 81;
    arrayOfByte[113] = -93;
    arrayOfByte[114] = 64;
    arrayOfByte[115] = -113;
    arrayOfByte[116] = -110;
    arrayOfByte[117] = -99;
    arrayOfByte[118] = 56;
    arrayOfByte[119] = -11;
    arrayOfByte[120] = -68;
    arrayOfByte[121] = -74;
    arrayOfByte[122] = -38;
    arrayOfByte[123] = 33;
    arrayOfByte[124] = 16;
    arrayOfByte[125] = -1;
    arrayOfByte[126] = -13;
    arrayOfByte[127] = -46;
    arrayOfByte[''] = -51;
    arrayOfByte[''] = 12;
    arrayOfByte[''] = 19;
    arrayOfByte[''] = -20;
    arrayOfByte[''] = 95;
    arrayOfByte[''] = -105;
    arrayOfByte[''] = 68;
    arrayOfByte[''] = 23;
    arrayOfByte[''] = -60;
    arrayOfByte[''] = -89;
    arrayOfByte[''] = 126;
    arrayOfByte[''] = 61;
    arrayOfByte[''] = 100;
    arrayOfByte[''] = 93;
    arrayOfByte[''] = 25;
    arrayOfByte[''] = 115;
    arrayOfByte[''] = 96;
    arrayOfByte[''] = -127;
    arrayOfByte[''] = 79;
    arrayOfByte[''] = -36;
    arrayOfByte[''] = 34;
    arrayOfByte[''] = 42;
    arrayOfByte[''] = -112;
    arrayOfByte[''] = -120;
    arrayOfByte[''] = 70;
    arrayOfByte[''] = -18;
    arrayOfByte[''] = -72;
    arrayOfByte[''] = 20;
    arrayOfByte[''] = -34;
    arrayOfByte[''] = 94;
    arrayOfByte[''] = 11;
    arrayOfByte[''] = -37;
    arrayOfByte[' '] = -32;
    arrayOfByte['¡'] = 50;
    arrayOfByte['¢'] = 58;
    arrayOfByte['£'] = 10;
    arrayOfByte['¤'] = 73;
    arrayOfByte['¥'] = 6;
    arrayOfByte['¦'] = 36;
    arrayOfByte['§'] = 92;
    arrayOfByte['¨'] = -62;
    arrayOfByte['©'] = -45;
    arrayOfByte['ª'] = -84;
    arrayOfByte['«'] = 98;
    arrayOfByte['¬'] = -111;
    arrayOfByte['­'] = -107;
    arrayOfByte['®'] = -28;
    arrayOfByte['¯'] = 121;
    arrayOfByte['°'] = -25;
    arrayOfByte['±'] = -56;
    arrayOfByte['²'] = 55;
    arrayOfByte['³'] = 109;
    arrayOfByte['´'] = -115;
    arrayOfByte['µ'] = -43;
    arrayOfByte['¶'] = 78;
    arrayOfByte['·'] = -87;
    arrayOfByte['¸'] = 108;
    arrayOfByte['¹'] = 86;
    arrayOfByte['º'] = -12;
    arrayOfByte['»'] = -22;
    arrayOfByte['¼'] = 101;
    arrayOfByte['½'] = 122;
    arrayOfByte['¾'] = -82;
    arrayOfByte['¿'] = 8;
    arrayOfByte['À'] = -70;
    arrayOfByte['Á'] = 120;
    arrayOfByte['Â'] = 37;
    arrayOfByte['Ã'] = 46;
    arrayOfByte['Ä'] = 28;
    arrayOfByte['Å'] = -90;
    arrayOfByte['Æ'] = -76;
    arrayOfByte['Ç'] = -58;
    arrayOfByte['È'] = -24;
    arrayOfByte['É'] = -35;
    arrayOfByte['Ê'] = 116;
    arrayOfByte['Ë'] = 31;
    arrayOfByte['Ì'] = 75;
    arrayOfByte['Í'] = -67;
    arrayOfByte['Î'] = -117;
    arrayOfByte['Ï'] = -118;
    arrayOfByte['Ð'] = 112;
    arrayOfByte['Ñ'] = 62;
    arrayOfByte['Ò'] = -75;
    arrayOfByte['Ó'] = 102;
    arrayOfByte['Ô'] = 72;
    arrayOfByte['Õ'] = 3;
    arrayOfByte['Ö'] = -10;
    arrayOfByte['×'] = 14;
    arrayOfByte['Ø'] = 97;
    arrayOfByte['Ù'] = 53;
    arrayOfByte['Ú'] = 87;
    arrayOfByte['Û'] = -71;
    arrayOfByte['Ü'] = -122;
    arrayOfByte['Ý'] = -63;
    arrayOfByte['Þ'] = 29;
    arrayOfByte['ß'] = -98;
    arrayOfByte['à'] = -31;
    arrayOfByte['á'] = -8;
    arrayOfByte['â'] = -104;
    arrayOfByte['ã'] = 17;
    arrayOfByte['ä'] = 105;
    arrayOfByte['å'] = -39;
    arrayOfByte['æ'] = -114;
    arrayOfByte['ç'] = -108;
    arrayOfByte['è'] = -101;
    arrayOfByte['é'] = 30;
    arrayOfByte['ê'] = -121;
    arrayOfByte['ë'] = -23;
    arrayOfByte['ì'] = -50;
    arrayOfByte['í'] = 85;
    arrayOfByte['î'] = 40;
    arrayOfByte['ï'] = -33;
    arrayOfByte['ð'] = -116;
    arrayOfByte['ñ'] = -95;
    arrayOfByte['ò'] = -119;
    arrayOfByte['ó'] = 13;
    arrayOfByte['ô'] = -65;
    arrayOfByte['õ'] = -26;
    arrayOfByte['ö'] = 66;
    arrayOfByte['÷'] = 104;
    arrayOfByte['ø'] = 65;
    arrayOfByte['ù'] = -103;
    arrayOfByte['ú'] = 45;
    arrayOfByte['û'] = 15;
    arrayOfByte['ü'] = -80;
    arrayOfByte['ý'] = 84;
    arrayOfByte['þ'] = -69;
    arrayOfByte['ÿ'] = 22;
    S = arrayOfByte;
    rcon = new int[] { 1, 2, 4, 8, 16, 32, 64, 128, 27, 54, 108, 216, 171, 77, 154, 47, 94, 188, 99, 198, 151, 53, 106, 212, 179, 125, 250, 239, 197, 145 };
    int[] arrayOfInt = new int['Ā'];
    arrayOfInt[0] = -1520213050;
    arrayOfInt[1] = -2072216328;
    arrayOfInt[2] = -1720223762;
    arrayOfInt[3] = -1921287178;
    arrayOfInt[4] = 234025727;
    arrayOfInt[5] = -1117033514;
    arrayOfInt[6] = -1318096930;
    arrayOfInt[7] = 1422247313;
    arrayOfInt[8] = 1345335392;
    arrayOfInt[9] = 50397442;
    arrayOfInt[10] = -1452841010;
    arrayOfInt[11] = 2099981142;
    arrayOfInt[12] = 436141799;
    arrayOfInt[13] = 1658312629;
    arrayOfInt[14] = -424957107;
    arrayOfInt[15] = -1703512340;
    arrayOfInt[16] = 1170918031;
    arrayOfInt[17] = -1652391393;
    arrayOfInt[18] = 1086966153;
    arrayOfInt[19] = -2021818886;
    arrayOfInt[20] = 368769775;
    arrayOfInt[21] = -346465870;
    arrayOfInt[22] = -918075506;
    arrayOfInt[23] = 200339707;
    arrayOfInt[24] = -324162239;
    arrayOfInt[25] = 1742001331;
    arrayOfInt[26] = -39673249;
    arrayOfInt[27] = -357585083;
    arrayOfInt[28] = -1080255453;
    arrayOfInt[29] = -140204973;
    arrayOfInt[30] = -1770884380;
    arrayOfInt[31] = 1539358875;
    arrayOfInt[32] = -1028147339;
    arrayOfInt[33] = 486407649;
    arrayOfInt[34] = -1366060227;
    arrayOfInt[35] = 1780885068;
    arrayOfInt[36] = 1513502316;
    arrayOfInt[37] = 1094664062;
    arrayOfInt[38] = 49805301;
    arrayOfInt[39] = 1338821763;
    arrayOfInt[40] = 1546925160;
    arrayOfInt[41] = -190470831;
    arrayOfInt[42] = 887481809;
    arrayOfInt[43] = 150073849;
    arrayOfInt[44] = -1821281822;
    arrayOfInt[45] = 1943591083;
    arrayOfInt[46] = 1395732834;
    arrayOfInt[47] = 1058346282;
    arrayOfInt[48] = 201589768;
    arrayOfInt[49] = 1388824469;
    arrayOfInt[50] = 1696801606;
    arrayOfInt[51] = 1589887901;
    arrayOfInt[52] = 672667696;
    arrayOfInt[53] = -1583966665;
    arrayOfInt[54] = 251987210;
    arrayOfInt[55] = -1248159185;
    arrayOfInt[56] = 151455502;
    arrayOfInt[57] = 907153956;
    arrayOfInt[58] = -1686077413;
    arrayOfInt[59] = 1038279391;
    arrayOfInt[60] = 652995533;
    arrayOfInt[61] = 1764173646;
    arrayOfInt[62] = -843926913;
    arrayOfInt[63] = -1619692054;
    arrayOfInt[64] = 453576978;
    arrayOfInt[65] = -1635548387;
    arrayOfInt[66] = 1949051992;
    arrayOfInt[67] = 773462580;
    arrayOfInt[68] = 756751158;
    arrayOfInt[69] = -1301385508;
    arrayOfInt[70] = -296068428;
    arrayOfInt[71] = -73359269;
    arrayOfInt[72] = -162377052;
    arrayOfInt[73] = 1295727478;
    arrayOfInt[74] = 1641469623;
    arrayOfInt[75] = -827083907;
    arrayOfInt[76] = 2066295122;
    arrayOfInt[77] = 1055122397;
    arrayOfInt[78] = 1898917726;
    arrayOfInt[79] = -1752923117;
    arrayOfInt[80] = -179088474;
    arrayOfInt[81] = 1758581177;
    arrayOfInt[83] = 753790401;
    arrayOfInt[84] = 1612718144;
    arrayOfInt[85] = 536673507;
    arrayOfInt[86] = -927878791;
    arrayOfInt[87] = -312779850;
    arrayOfInt[88] = -1100322092;
    arrayOfInt[89] = 1187761037;
    arrayOfInt[90] = -641810841;
    arrayOfInt[91] = 1262041458;
    arrayOfInt[92] = -565556588;
    arrayOfInt[93] = -733197160;
    arrayOfInt[94] = -396863312;
    arrayOfInt[95] = 1255133061;
    arrayOfInt[96] = 1808847035;
    arrayOfInt[97] = 720367557;
    arrayOfInt[98] = -441800113;
    arrayOfInt[99] = 385612781;
    arrayOfInt[100] = -985447546;
    arrayOfInt[101] = -682799718;
    arrayOfInt[102] = 1429418854;
    arrayOfInt[103] = -1803188975;
    arrayOfInt[104] = -817543798;
    arrayOfInt[105] = 284817897;
    arrayOfInt[106] = 100794884;
    arrayOfInt[107] = -2122350594;
    arrayOfInt[108] = -263171936;
    arrayOfInt[109] = 1144798328;
    arrayOfInt[110] = -1163944155;
    arrayOfInt[111] = -475486133;
    arrayOfInt[112] = -212774494;
    arrayOfInt[113] = -22830243;
    arrayOfInt[114] = -1069531008;
    arrayOfInt[115] = -1970303227;
    arrayOfInt[116] = -1382903233;
    arrayOfInt[117] = -1130521311;
    arrayOfInt[118] = 1211644016;
    arrayOfInt[119] = 83228145;
    arrayOfInt[120] = -541279133;
    arrayOfInt[121] = -1044990345;
    arrayOfInt[122] = 1977277103;
    arrayOfInt[123] = 1663115586;
    arrayOfInt[124] = 806359072;
    arrayOfInt[125] = 452984805;
    arrayOfInt[126] = 250868733;
    arrayOfInt[127] = 1842533055;
    arrayOfInt[''] = 1288555905;
    arrayOfInt[''] = 336333848;
    arrayOfInt[''] = 890442534;
    arrayOfInt[''] = 804056259;
    arrayOfInt[''] = -513843266;
    arrayOfInt[''] = -1567123659;
    arrayOfInt[''] = -867941240;
    arrayOfInt[''] = 957814574;
    arrayOfInt[''] = 1472513171;
    arrayOfInt[''] = -223893675;
    arrayOfInt[''] = -2105639172;
    arrayOfInt[''] = 1195195770;
    arrayOfInt[''] = -1402706744;
    arrayOfInt[''] = -413311558;
    arrayOfInt[''] = 723065138;
    arrayOfInt[''] = -1787595802;
    arrayOfInt[''] = -1604296512;
    arrayOfInt[''] = -1736343271;
    arrayOfInt[''] = -783331426;
    arrayOfInt[''] = 2145180835;
    arrayOfInt[''] = 1713513028;
    arrayOfInt[''] = 2116692564;
    arrayOfInt[''] = -1416589253;
    arrayOfInt[''] = -2088204277;
    arrayOfInt[''] = -901364084;
    arrayOfInt[''] = 703524551;
    arrayOfInt[''] = -742868885;
    arrayOfInt[''] = 1007948840;
    arrayOfInt[''] = 2044649127;
    arrayOfInt[''] = -497131844;
    arrayOfInt[''] = 487262998;
    arrayOfInt[''] = 1994120109;
    arrayOfInt[' '] = 1004593371;
    arrayOfInt['¡'] = 1446130276;
    arrayOfInt['¢'] = 1312438900;
    arrayOfInt['£'] = 503974420;
    arrayOfInt['¤'] = -615954030;
    arrayOfInt['¥'] = 168166924;
    arrayOfInt['¦'] = 1814307912;
    arrayOfInt['§'] = -463709000;
    arrayOfInt['¨'] = 1573044895;
    arrayOfInt['©'] = 1859376061;
    arrayOfInt['ª'] = -273896381;
    arrayOfInt['«'] = -1503501628;
    arrayOfInt['¬'] = -1466855111;
    arrayOfInt['­'] = -1533700815;
    arrayOfInt['®'] = 937747667;
    arrayOfInt['¯'] = -1954973198;
    arrayOfInt['°'] = 854058965;
    arrayOfInt['±'] = 1137232011;
    arrayOfInt['²'] = 1496790894;
    arrayOfInt['³'] = -1217565222;
    arrayOfInt['´'] = -1936880383;
    arrayOfInt['µ'] = 1691735473;
    arrayOfInt['¶'] = -766620004;
    arrayOfInt['·'] = -525751991;
    arrayOfInt['¸'] = -1267962664;
    arrayOfInt['¹'] = -95005012;
    arrayOfInt['º'] = 133494003;
    arrayOfInt['»'] = 636152527;
    arrayOfInt['¼'] = -1352309302;
    arrayOfInt['½'] = -1904575756;
    arrayOfInt['¾'] = -374428089;
    arrayOfInt['¿'] = 403179536;
    arrayOfInt['À'] = -709182865;
    arrayOfInt['Á'] = -2005370640;
    arrayOfInt['Â'] = 1864705354;
    arrayOfInt['Ã'] = 1915629148;
    arrayOfInt['Ä'] = 605822008;
    arrayOfInt['Å'] = -240736681;
    arrayOfInt['Æ'] = -944458637;
    arrayOfInt['Ç'] = 1371981463;
    arrayOfInt['È'] = 602466507;
    arrayOfInt['É'] = 2094914977;
    arrayOfInt['Ê'] = -1670089496;
    arrayOfInt['Ë'] = 555687742;
    arrayOfInt['Ì'] = -582268010;
    arrayOfInt['Í'] = -591544991;
    arrayOfInt['Î'] = -2037675251;
    arrayOfInt['Ï'] = -2054518257;
    arrayOfInt['Ð'] = -1871679264;
    arrayOfInt['Ñ'] = 1111375484;
    arrayOfInt['Ò'] = -994724495;
    arrayOfInt['Ó'] = -1436129588;
    arrayOfInt['Ô'] = -666351472;
    arrayOfInt['Õ'] = 84083462;
    arrayOfInt['Ö'] = 32962295;
    arrayOfInt['×'] = 302911004;
    arrayOfInt['Ø'] = -1553899070;
    arrayOfInt['Ù'] = 1597322602;
    arrayOfInt['Ú'] = -111716434;
    arrayOfInt['Û'] = -793134743;
    arrayOfInt['Ü'] = -1853454825;
    arrayOfInt['Ý'] = 1489093017;
    arrayOfInt['Þ'] = 656219450;
    arrayOfInt['ß'] = -1180787161;
    arrayOfInt['à'] = 954327513;
    arrayOfInt['á'] = 335083755;
    arrayOfInt['â'] = -1281845205;
    arrayOfInt['ã'] = 856756514;
    arrayOfInt['ä'] = -1150719534;
    arrayOfInt['å'] = 1893325225;
    arrayOfInt['æ'] = -1987146233;
    arrayOfInt['ç'] = -1483434957;
    arrayOfInt['è'] = -1231316179;
    arrayOfInt['é'] = 572399164;
    arrayOfInt['ê'] = -1836611819;
    arrayOfInt['ë'] = 552200649;
    arrayOfInt['ì'] = 1238290055;
    arrayOfInt['í'] = -11184726;
    arrayOfInt['î'] = 2015897680;
    arrayOfInt['ï'] = 2061492133;
    arrayOfInt['ð'] = -1886614525;
    arrayOfInt['ñ'] = -123625127;
    arrayOfInt['ò'] = -2138470135;
    arrayOfInt['ó'] = 386731290;
    arrayOfInt['ô'] = -624967835;
    arrayOfInt['õ'] = 837215959;
    arrayOfInt['ö'] = -968736124;
    arrayOfInt['÷'] = -1201116976;
    arrayOfInt['ø'] = -1019133566;
    arrayOfInt['ù'] = -1332111063;
    arrayOfInt['ú'] = 1999449434;
    arrayOfInt['û'] = 286199582;
    arrayOfInt['ü'] = -877612933;
    arrayOfInt['ý'] = -61582168;
    arrayOfInt['þ'] = -692339859;
    arrayOfInt['ÿ'] = 974525996;
    T0 = arrayOfInt;
  }
  
  public AESEngine(byte[] paramArrayOfByte)
    throws ZipException
  {
    init(paramArrayOfByte);
  }
  
  private final void encryptBlock(int[][] paramArrayOfInt)
  {
    this.C0 ^= paramArrayOfInt[0][0];
    this.C1 ^= paramArrayOfInt[0][1];
    this.C2 ^= paramArrayOfInt[0][2];
    this.C3 ^= paramArrayOfInt[0][3];
    int i = 1;
    for (;;)
    {
      if (i >= -1 + this.rounds)
      {
        int i4 = T0[(0xFF & this.C0)] ^ shift(T0[(0xFF & this.C1 >> 8)], 24) ^ shift(T0[(0xFF & this.C2 >> 16)], 16) ^ shift(T0[(0xFF & this.C3 >> 24)], 8) ^ paramArrayOfInt[i][0];
        int i5 = T0[(0xFF & this.C1)] ^ shift(T0[(0xFF & this.C2 >> 8)], 24) ^ shift(T0[(0xFF & this.C3 >> 16)], 16) ^ shift(T0[(0xFF & this.C0 >> 24)], 8) ^ paramArrayOfInt[i][1];
        int i6 = T0[(0xFF & this.C2)] ^ shift(T0[(0xFF & this.C3 >> 8)], 24) ^ shift(T0[(0xFF & this.C0 >> 16)], 16) ^ shift(T0[(0xFF & this.C1 >> 24)], 8) ^ paramArrayOfInt[i][2];
        int i7 = T0[(0xFF & this.C3)] ^ shift(T0[(0xFF & this.C0 >> 8)], 24) ^ shift(T0[(0xFF & this.C1 >> 16)], 16) ^ shift(T0[(0xFF & this.C2 >> 24)], 8);
        int i8 = i + 1;
        int i9 = i7 ^ paramArrayOfInt[i][3];
        this.C0 = (0xFF & S[(i4 & 0xFF)] ^ (0xFF & S[(0xFF & i5 >> 8)]) << 8 ^ (0xFF & S[(0xFF & i6 >> 16)]) << 16 ^ S[(0xFF & i9 >> 24)] << 24 ^ paramArrayOfInt[i8][0]);
        this.C1 = (0xFF & S[(i5 & 0xFF)] ^ (0xFF & S[(0xFF & i6 >> 8)]) << 8 ^ (0xFF & S[(0xFF & i9 >> 16)]) << 16 ^ S[(0xFF & i4 >> 24)] << 24 ^ paramArrayOfInt[i8][1]);
        this.C2 = (0xFF & S[(i6 & 0xFF)] ^ (0xFF & S[(0xFF & i9 >> 8)]) << 8 ^ (0xFF & S[(0xFF & i4 >> 16)]) << 16 ^ S[(0xFF & i5 >> 24)] << 24 ^ paramArrayOfInt[i8][2]);
        this.C3 = (0xFF & S[(i9 & 0xFF)] ^ (0xFF & S[(0xFF & i4 >> 8)]) << 8 ^ (0xFF & S[(0xFF & i5 >> 16)]) << 16 ^ S[(0xFF & i6 >> 24)] << 24 ^ paramArrayOfInt[i8][3]);
        return;
      }
      int j = T0[(0xFF & this.C0)] ^ shift(T0[(0xFF & this.C1 >> 8)], 24) ^ shift(T0[(0xFF & this.C2 >> 16)], 16) ^ shift(T0[(0xFF & this.C3 >> 24)], 8) ^ paramArrayOfInt[i][0];
      int k = T0[(0xFF & this.C1)] ^ shift(T0[(0xFF & this.C2 >> 8)], 24) ^ shift(T0[(0xFF & this.C3 >> 16)], 16) ^ shift(T0[(0xFF & this.C0 >> 24)], 8) ^ paramArrayOfInt[i][1];
      int m = T0[(0xFF & this.C2)] ^ shift(T0[(0xFF & this.C3 >> 8)], 24) ^ shift(T0[(0xFF & this.C0 >> 16)], 16) ^ shift(T0[(0xFF & this.C1 >> 24)], 8) ^ paramArrayOfInt[i][2];
      int n = T0[(0xFF & this.C3)] ^ shift(T0[(0xFF & this.C0 >> 8)], 24) ^ shift(T0[(0xFF & this.C1 >> 16)], 16) ^ shift(T0[(0xFF & this.C2 >> 24)], 8);
      int i1 = i + 1;
      int i2 = n ^ paramArrayOfInt[i][3];
      this.C0 = (T0[(j & 0xFF)] ^ shift(T0[(0xFF & k >> 8)], 24) ^ shift(T0[(0xFF & m >> 16)], 16) ^ shift(T0[(0xFF & i2 >> 24)], 8) ^ paramArrayOfInt[i1][0]);
      this.C1 = (T0[(k & 0xFF)] ^ shift(T0[(0xFF & m >> 8)], 24) ^ shift(T0[(0xFF & i2 >> 16)], 16) ^ shift(T0[(0xFF & j >> 24)], 8) ^ paramArrayOfInt[i1][1]);
      this.C2 = (T0[(m & 0xFF)] ^ shift(T0[(0xFF & i2 >> 8)], 24) ^ shift(T0[(0xFF & j >> 16)], 16) ^ shift(T0[(0xFF & k >> 24)], 8) ^ paramArrayOfInt[i1][2]);
      int i3 = T0[(i2 & 0xFF)] ^ shift(T0[(0xFF & j >> 8)], 24) ^ shift(T0[(0xFF & k >> 16)], 16) ^ shift(T0[(0xFF & m >> 24)], 8);
      i = i1 + 1;
      this.C3 = (i3 ^ paramArrayOfInt[i1][3]);
    }
  }
  
  private int[][] generateWorkingKey(byte[] paramArrayOfByte)
    throws ZipException
  {
    int i = paramArrayOfByte.length / 4;
    if (((i != 4) && (i != 6) && (i != 8)) || (i * 4 != paramArrayOfByte.length)) {
      throw new ZipException("invalid key length (not 128/192/256)");
    }
    this.rounds = (i + 6);
    int[] arrayOfInt = { 1 + this.rounds, 4 };
    int[][] arrayOfInt1 = (int[][])Array.newInstance(Integer.TYPE, arrayOfInt);
    int j = 0;
    int k = 0;
    int n;
    for (;;)
    {
      if (k >= paramArrayOfByte.length)
      {
        int m = 1 + this.rounds << 2;
        n = i;
        if (n < m) {
          break;
        }
        return arrayOfInt1;
      }
      arrayOfInt1[(j >> 2)][(j & 0x3)] = (0xFF & paramArrayOfByte[k] | (0xFF & paramArrayOfByte[(k + 1)]) << 8 | (0xFF & paramArrayOfByte[(k + 2)]) << 16 | paramArrayOfByte[(k + 3)] << 24);
      k += 4;
      j++;
    }
    int i1 = arrayOfInt1[(n - 1 >> 2)][(0x3 & n - 1)];
    if (n % i == 0) {}
    for (i1 = subWord(shift(i1, 8)) ^ rcon[(-1 + n / i)];; i1 = subWord(i1)) {
      do
      {
        arrayOfInt1[(n >> 2)][(n & 0x3)] = (i1 ^ arrayOfInt1[(n - i >> 2)][(0x3 & n - i)]);
        n++;
        break;
      } while ((i <= 6) || (n % i != 4));
    }
  }
  
  private int shift(int paramInt1, int paramInt2)
  {
    return paramInt1 >>> paramInt2 | paramInt1 << -paramInt2;
  }
  
  private final void stateIn(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramInt + 1;
    this.C0 = (0xFF & paramArrayOfByte[paramInt]);
    int j = this.C0;
    int k = i + 1;
    this.C0 = (j | (0xFF & paramArrayOfByte[i]) << 8);
    int m = this.C0;
    int n = k + 1;
    this.C0 = (m | (0xFF & paramArrayOfByte[k]) << 16);
    int i1 = this.C0;
    int i2 = n + 1;
    this.C0 = (i1 | paramArrayOfByte[n] << 24);
    int i3 = i2 + 1;
    this.C1 = (0xFF & paramArrayOfByte[i2]);
    int i4 = this.C1;
    int i5 = i3 + 1;
    this.C1 = (i4 | (0xFF & paramArrayOfByte[i3]) << 8);
    int i6 = this.C1;
    int i7 = i5 + 1;
    this.C1 = (i6 | (0xFF & paramArrayOfByte[i5]) << 16);
    int i8 = this.C1;
    int i9 = i7 + 1;
    this.C1 = (i8 | paramArrayOfByte[i7] << 24);
    int i10 = i9 + 1;
    this.C2 = (0xFF & paramArrayOfByte[i9]);
    int i11 = this.C2;
    int i12 = i10 + 1;
    this.C2 = (i11 | (0xFF & paramArrayOfByte[i10]) << 8);
    int i13 = this.C2;
    int i14 = i12 + 1;
    this.C2 = (i13 | (0xFF & paramArrayOfByte[i12]) << 16);
    int i15 = this.C2;
    int i16 = i14 + 1;
    this.C2 = (i15 | paramArrayOfByte[i14] << 24);
    int i17 = i16 + 1;
    this.C3 = (0xFF & paramArrayOfByte[i16]);
    int i18 = this.C3;
    int i19 = i17 + 1;
    this.C3 = (i18 | (0xFF & paramArrayOfByte[i17]) << 8);
    int i20 = this.C3;
    int i21 = i19 + 1;
    this.C3 = (i20 | (0xFF & paramArrayOfByte[i19]) << 16);
    int i22 = this.C3;
    (i21 + 1);
    this.C3 = (i22 | paramArrayOfByte[i21] << 24);
  }
  
  private final void stateOut(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramInt + 1;
    paramArrayOfByte[paramInt] = ((byte)this.C0);
    int j = i + 1;
    paramArrayOfByte[i] = ((byte)(this.C0 >> 8));
    int k = j + 1;
    paramArrayOfByte[j] = ((byte)(this.C0 >> 16));
    int m = k + 1;
    paramArrayOfByte[k] = ((byte)(this.C0 >> 24));
    int n = m + 1;
    paramArrayOfByte[m] = ((byte)this.C1);
    int i1 = n + 1;
    paramArrayOfByte[n] = ((byte)(this.C1 >> 8));
    int i2 = i1 + 1;
    paramArrayOfByte[i1] = ((byte)(this.C1 >> 16));
    int i3 = i2 + 1;
    paramArrayOfByte[i2] = ((byte)(this.C1 >> 24));
    int i4 = i3 + 1;
    paramArrayOfByte[i3] = ((byte)this.C2);
    int i5 = i4 + 1;
    paramArrayOfByte[i4] = ((byte)(this.C2 >> 8));
    int i6 = i5 + 1;
    paramArrayOfByte[i5] = ((byte)(this.C2 >> 16));
    int i7 = i6 + 1;
    paramArrayOfByte[i6] = ((byte)(this.C2 >> 24));
    int i8 = i7 + 1;
    paramArrayOfByte[i7] = ((byte)this.C3);
    int i9 = i8 + 1;
    paramArrayOfByte[i8] = ((byte)(this.C3 >> 8));
    int i10 = i9 + 1;
    paramArrayOfByte[i9] = ((byte)(this.C3 >> 16));
    (i10 + 1);
    paramArrayOfByte[i10] = ((byte)(this.C3 >> 24));
  }
  
  private int subWord(int paramInt)
  {
    return 0xFF & S[(paramInt & 0xFF)] | (0xFF & S[(0xFF & paramInt >> 8)]) << 8 | (0xFF & S[(0xFF & paramInt >> 16)]) << 16 | S[(0xFF & paramInt >> 24)] << 24;
  }
  
  public void init(byte[] paramArrayOfByte)
    throws ZipException
  {
    this.workingKey = generateWorkingKey(paramArrayOfByte);
  }
  
  public int processBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
    throws ZipException
  {
    if (this.workingKey == null) {
      throw new ZipException("AES engine not initialised");
    }
    if (paramInt1 + 16 > paramArrayOfByte1.length) {
      throw new ZipException("input buffer too short");
    }
    if (paramInt2 + 16 > paramArrayOfByte2.length) {
      throw new ZipException("output buffer too short");
    }
    stateIn(paramArrayOfByte1, paramInt1);
    encryptBlock(this.workingKey);
    stateOut(paramArrayOfByte2, paramInt2);
    return 16;
  }
  
  public int processBlock(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws ZipException
  {
    return processBlock(paramArrayOfByte1, 0, paramArrayOfByte2, 0);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/engine/AESEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */