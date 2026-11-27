Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791873;
	b=BhEWh9MM0BVHjU7Y0jeCl46n8/6vjcPPNuVmuitYNV6qCF/cBEiLv/Z91r8hSD/P+sUT
	 p+xO8DMtc2jeSjv++ejETcEILSan9QcdX9BEqKhW5Z8ti0C6Jr0vU6L1QUMPO+CW1QBVB
	 8azlhBKoJlHxLJBdAHrBg9DJE739v7OWigUxh9hd+Nd80OnXwPjb3grFAniQNXvQGXzoH
	 RLRks4PW7anR3dprmHXr+F01mc/MdR4hlCdPzLGO8/Ozo6KcRZz1o5ObPLUYPaYHV9Srf
	 VxNmoqoTHwZ57yPaXpiE+w1iYDkhtedGVyGHzq/E+dTfPp+nbjJtCxmFsK6NcJrBrYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791873;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Payh2j8EHhB3KoOUCJJLm3a0eI9jJYgr+FioCUI3o28=;
	b=OSnCNadvCg7qMZZt3wJjhDAxKFy4dXgTxYtgYv+h7pdU8VWeuC5ER+4Zv+t4O76Spuzn
	 XTwUKqyYc6X97wwro3b47x5LxwYv2WtTTmJdreG7JUAusxiGugXZAToaRo2J6qeUNz55O
	 tMObpjk3Hc+jCasfz/uoUQXeXSJR2BmveowbAihB2nalmrSqluW/fcChqTjnV+QRw226o
	 svgp6jISSJ/zEUAyUD2SO4Xfx8fDoqndDt5DANtHkXzCsifktrVnYSddEs7Y6EAM3Kdwf
	 e8KCTEGbhgFxQ+B7NY4JBu8bGPTeXf6tIiOI5mtfx6rX68ZbPs6uNAB1T3YfyDDOwOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=hdEOCzwx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.20
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010020.outbound.protection.outlook.com [52.103.66.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D3606A335
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 15:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B6D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=hdEOCzwx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odqLhUMmVFh01qNW7RQfubT4k1hikJh0DPw3dcH/e8WkMsKfBjPrVRikmASWaRL02m11Vxtyx27Ybske2FcaaMe77Zcj+t73lPa49psnWSBvrqQmT1egFENwHftKaACOoa1+4dOFJZC6WPzYxPcMvh55naxSxlNLXoIbnWe5rdzTuBq58vavdobkKB+rrQEUcj7sBo3f4JXkWjelU8q9bli8koiV48b3VaGFvlqU+fbL+rPE9vL1+b1VOYG5FY/TkkczB5YVhH5cQa+AdGMbuOBOUyitMQ/kltpdeCL+GSI2m5CAnDl7vyrfq1zoejSdEemRB9NkS6CjrCs27xuyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Payh2j8EHhB3KoOUCJJLm3a0eI9jJYgr+FioCUI3o28=;
 b=LhypPOHbbOewFAH2qJl3rskuQ9LQUwWZNYHEvVgy8bAJhZCBrUnHYU6wlcDSTdihl9QStyLUeQ31WjNUo9nQ156s0Xm6Nr7RqLyZRDYfxspkP2t0OHyh1/ePgBLmpsZLUAwBU8sVUP8gpjo2q1Q8CfWQyHIxjjJwOp8TEAZ8l9j7jbVeUJCYLaBwmoelxI6isvkAc84Fi8uFZGaKpMXD9cK8Tdi+znEYUYjO9M2VzneYW2oaoWCVjvWWUV3G0zph/m/RY845QZIF8MMb4uxA1/Jml1DLILZ34epM1l6Ym6LAckCN3lurSHJ661Bv3VfiINEFSvO+9CkI75MOW+orbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Payh2j8EHhB3KoOUCJJLm3a0eI9jJYgr+FioCUI3o28=;
 b=hdEOCzwxDEnoF/slnnumeJbaEoyXoOXeu0vsKrp2p/LVbWumG3PlSLOlUjibe4dtwDGxBElaGjzbvORRNPzve4toG33O9/b9xffdb0LWy6OYqK4Y7ftSi6uXL+5Ws98U5Xmoxk/xvIOtWIFjHDgRMe25CG/a4VX/VqsbUno3fr4IbTTA/6GVUmH6+2fv4wOG+rprnhXV/tozIsIj0xVSfYr+TtuYRDRgWeUZv9tbVkIlBZwD8qlwEnC2Q/4HYx8498SIwTZfZzasNQmnBWusm7ow6VYbSAk6eDSGHlz8eCGA0WDDoEc8aqlYNO7XDp2PaG5bIrx/PXnxQDkTnoZQ4w==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by OS9PR01MB17828.jpnprd01.prod.outlook.com
 (2603:1096:604:448::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:04:27 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:04:27 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "arend.vanspriel@broadcom.com" <arend.vanspriel@broadcom.com>,
	"brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
	"brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
	Keisuke Tsukuda <tkdkei@outlook.jp>
Subject: [PATCH wireless] wifi: brcmfmac: fix allmulti fallback when
 mcast_list is rejected
Thread-Topic: [PATCH wireless] wifi: brcmfmac: fix allmulti fallback when
 mcast_list is rejected
Thread-Index: AQHdfoCYaqzni8mB1kmxqv0slUhQfA==
Date: Fri, 27 Nov 2026 15:04:26 +0000
Message-ID: <20261127150422.64483-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|OS9PR01MB17828:EE_
x-ms-office365-filtering-correlation-id: 80215a93-9bfd-40d9-8ae3-08df4c97baf0
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|8062599012|8060799015|41001999006|15080799012|25031999004|24021099003|4140399003|39105399006|31061999003|22141099003|38102599003|19110799012|26104999009|3412199025|440099028|102099032|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ANIzi5cjdJVZB1I/ntiqN105BJA5hrxWjhODtcCGmKo4wtm+Re8u2a+01K?=
 =?iso-8859-1?Q?aLKGPJG3ic6nnQv9vegwW8lb6+lEK9PvQc9f1dv3pNatfzlcmAA7cotNr8?=
 =?iso-8859-1?Q?d83XIfs9fVAfDkYM98YLldNUe9EAv4qetJfOTw7AkU35AIFFym5jGftga1?=
 =?iso-8859-1?Q?4fdKzpnO3FYjuI0AwRVjzSWxMuPAKitn6qn9pP2jobyQX3O4aXANpIzU3X?=
 =?iso-8859-1?Q?38Ko0lb3gr85GICxICIvMyOXg9iNrCSPF2Bz02afjHhrMwqnnRlWlt/zMJ?=
 =?iso-8859-1?Q?WKYHH9wVLEZRjLoPTdGBj/MmaHDzCquq0VNHB4mbc5qT3xeDyeQu8dgz40?=
 =?iso-8859-1?Q?4PfhbxnPaepgqhucwR/n3b1eP+i69cdDVquy5dHkVU0yf70oo/nMXvyRmW?=
 =?iso-8859-1?Q?LhNe+xqURRuliPyBse4kQczCNcEC+yaU7ORkkILb2kwGobMIlSlfhoQeTZ?=
 =?iso-8859-1?Q?VZxraECB24aAMjjQ3EYeZYRw7zxLJ8Fp06tqlivlnj4+Og5QlvZLMqJpBx?=
 =?iso-8859-1?Q?RqonQVw1HOi/7nK1Y73nVY5aYVf2bwC8Vl6Wh+1h/DUR6DUUe60ejYaHPh?=
 =?iso-8859-1?Q?UQamg5TF0P/NwpTWBQSmbMDX2Z+kDdyZurpqnk8kXWJPGZvzbMGpDxvjPl?=
 =?iso-8859-1?Q?yqUw88I1h7jZ6VrjFapzA+F0m9J0y4BigGRfvqVNS1aSF+mQ7xFpk44gUp?=
 =?iso-8859-1?Q?oSGUKODzC7hleyPZu9n6E7ASHATYPilEBd+mCEAcG+IoN2y/UbpCokt0Cz?=
 =?iso-8859-1?Q?PLol160ZnF7uTtDcOs/nSjpNFhG8jRp6FGc6ILZR+vr228yh97KTPE50zI?=
 =?iso-8859-1?Q?vXPGnvaPjNdt8zQC7quQ7ikdMwHgTVCVwmxx3LVHQ2RhZohWy2BCzsA8Wq?=
 =?iso-8859-1?Q?N5T4I8Ktxa9YI4xx22gJgUwmjhER5iU2lgNcKFY8elIQl/fwCjn2w8JbSq?=
 =?iso-8859-1?Q?Lc+MBR0eL9kjyRLdkcfv7ugtGoArsgKQEcRdD8iu9eCCEBOiMGGSqu8jb9?=
 =?iso-8859-1?Q?Htv2mng6HnjmJjS30Hzona0DZvme37DKHzcqVVcMaCP8AS1pkkNquAdzQp?=
 =?iso-8859-1?Q?PbzptDvSm556OSeSOL6rQfemauh1sawyLMUtPs/kqmszAbNCt7/LeT9lIv?=
 =?iso-8859-1?Q?mHbqwnqA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xMA66Nhdy9AvETnw26oOzfNAP/QYMmojkRwzKBdCuETkd4ZDm3hAV6kdqG?=
 =?iso-8859-1?Q?+tPKZG4JeFCwVnyuyUcK7iOVDDMrjcSeY+WahXbXPTxBgEjtfAWZCZJCgO?=
 =?iso-8859-1?Q?FNe23ajOdkmdzwaMIcwq/+rV8NACHRQreVCwEb77owXKEUIWVsZlz9lhMU?=
 =?iso-8859-1?Q?oNruhJo+qhHyB/ah1+wVoCkF70ckWBeMfsdp/7rQifU/eBDnCbyIz1ateL?=
 =?iso-8859-1?Q?agyVDZ0Loqo0qn15b1pXhJ16iHb/NV27q9R5AQFeNH/TF2dJhtSP9sFRQA?=
 =?iso-8859-1?Q?XlUUvFd33gxbDBdNoAGD7JLZhKFSW+V6A7VejBIiT7GzS6H0r2Fi53ey3B?=
 =?iso-8859-1?Q?LWb+R5EZI+dRxYgBmnG3HjMeOaquSyKO5atT4IkYlyoVBTH+qWJ9YUSI57?=
 =?iso-8859-1?Q?SYiZPCBstiTvH8kF+qFettMCi+wAu4zSN85CT8otTOxF1ir0EsFMDjVWEc?=
 =?iso-8859-1?Q?lZrpIrQ2r/ucsNRtqWUlRKy+AsNCelCBEMvAN/Hgq4a2hdmfaI9Xpp7ghL?=
 =?iso-8859-1?Q?EdUwkdJ/hFqghNhcHiuJliYaOx68qRnO3C7EnLs5Wdzu9e/6xpq2yJb411?=
 =?iso-8859-1?Q?9mw/jzOROiNzA0nWg69IV3u25k1JmNcl0SWDGtUFg/jEHw0iRsnkxYLtuy?=
 =?iso-8859-1?Q?qUkkpfbMaSm25FN6GgkIE55siPShXqWgHSbaTezs4Wjg/nxDu6tP6mroj1?=
 =?iso-8859-1?Q?UjWpZ6K+mogAroXDsZiUqB9RJCnl7s9YGZZtpnDXilDZylolkfIO6r6XXB?=
 =?iso-8859-1?Q?73PbPD+MvR6VabVG1kzyvboKNopZhunHq//lFK+wlIVlQxCdBKLzovkz9t?=
 =?iso-8859-1?Q?VsC0Af1FH0R+4ebv0i2Eh49LkEFvIRf0r9cupFRVycPaN1YiGHZbcIpvyR?=
 =?iso-8859-1?Q?Of/JeS/6aBzM0vPvWi1ZFCpCgMcv0GmEKUZ5hGDHfaimEMuD19yNfbbPN6?=
 =?iso-8859-1?Q?+CEP5hXaa3IZ7ipQGItsGkDnzg6ZeLl+FORFgyVAKq07+k32Vt6T/bF/rX?=
 =?iso-8859-1?Q?B4bdLxauJ6KyqpWieQOPqIeGhV3H3ESIMwae5lAGe59BeZkpGdvm8pvPWc?=
 =?iso-8859-1?Q?Z3tQMeOrRCtjF77jzW42Ka36RDFeJZ0lkP37aEwxZRtqf9YYHSREW1ERjb?=
 =?iso-8859-1?Q?Cr1jvfWUFgdhImHEYXFGWvVoSFRZGTodhxE6Fuqv7kot64KeP3/XilEbzT?=
 =?iso-8859-1?Q?zAZdISQGTvFB8L3ahy/kipyByRkf9F0VLwYn833h+8e+NL9eHcsvfXFj6h?=
 =?iso-8859-1?Q?uzO9Lgn27TAH4WhdpzWxv4nEa0UGHmk+LX7fmx8X0yZonZwo1iImHtfC9j?=
 =?iso-8859-1?Q?AImMfNAI6/Ahi+hkjzt6h+f/1F7PTlKLFkdEnrcFwEQoQI7eB05/SkLY6p?=
 =?iso-8859-1?Q?jzxqwAa3vrs/2mJ59POvvQPXF2iffR5d39wEfKxD1W1sasM3nG5zg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 80215a93-9bfd-40d9-8ae3-08df4c97baf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 15:04:26.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17828

_brcmf_set_multicast_list() uses cnt as both the multicast address count=0A=
and the number of addresses left to copy into mcast_list. After a=0A=
complete copy, cnt is zero. If the firmware then rejects the nonempty=0A=
list, the error path checks this exhausted counter and fails to enable=0A=
allmulti as a fallback. Multicast traffic for some joined groups can=0A=
then be lost.=0A=
=0A=
Keep the original count for the fallback decision. A rejected empty=0A=
list still leaves allmulti unchanged.=0A=
=0A=
On a Raspberry Pi CM4 (BCM4345/6 SDIO, firmware 7.45.265) running=0A=
Ubuntu 7.0.0-1023-raspi, the driver reported -EBADE for a 33-address=0A=
mcast_list update. The last joined group received 0/3 packets with the=0A=
original module and 3/3 with the patched module, although the list=0A=
update still failed. The first group received 3/3 in both runs, with=0A=
IFF_ALLMULTI clear.=0A=
=0A=
Fixes: cf2b448852ab ("staging: brcm80211: add fullmac driver")=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 7 ++++---=0A=
 1 file changed, 4 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/driv=
ers/net/wireless/broadcom/brcm80211/brcmfmac/core.c=0A=
index a3d6623487115..d24725b7b6de9 100644=0A=
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c=0A=
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c=0A=
@@ -142,7 +142,7 @@ static void _brcmf_set_multicast_list(struct work_struc=
t *work)=0A=
 	struct brcmf_pub *drvr =3D ifp->drvr;=0A=
 	struct net_device *ndev;=0A=
 	struct netdev_hw_addr *ha;=0A=
-	u32 cmd_value, cnt;=0A=
+	u32 cmd_value, cnt, mc_count;=0A=
 	__le32 cnt_le;=0A=
 	char *buf, *bufp;=0A=
 	u32 buflen;=0A=
@@ -156,7 +156,8 @@ static void _brcmf_set_multicast_list(struct work_struc=
t *work)=0A=
 	cmd_value =3D (ndev->flags & IFF_ALLMULTI) ? true : false;=0A=
 =0A=
 	/* Send down the multicast list first. */=0A=
-	cnt =3D netdev_mc_count(ndev);=0A=
+	mc_count =3D netdev_mc_count(ndev);=0A=
+	cnt =3D mc_count;=0A=
 	buflen =3D sizeof(cnt) + (cnt * ETH_ALEN);=0A=
 	buf =3D kmalloc(buflen, GFP_KERNEL);=0A=
 	if (!buf)=0A=
@@ -178,7 +179,7 @@ static void _brcmf_set_multicast_list(struct work_struc=
t *work)=0A=
 	err =3D brcmf_fil_iovar_data_set(ifp, "mcast_list", buf, buflen);=0A=
 	if (err < 0) {=0A=
 		bphy_err(drvr, "Setting mcast_list failed, %d\n", err);=0A=
-		cmd_value =3D cnt ? true : cmd_value;=0A=
+		cmd_value =3D mc_count ? true : cmd_value;=0A=
 	}=0A=
 =0A=
 	kfree(buf);=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
=0A=
