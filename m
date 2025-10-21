Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013072.outbound.protection.outlook.com [52.103.35.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49BF2F999F
	for <brcm80211@lists.linux.dev>; Tue, 21 Oct 2025 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050644; cv=fail; b=iq0EPgUhir1yG2wvjRi+7udynMRAz/+7hBJrrVcteA+arIAXE+nW0F8Ujb3kTlQYQ5Q8wsabsL27u/IKtyubapk+oWwm3iWt5lYpqG+66Du1RjZrQIUOL3Xyc3RxZUjpI8FqNgbYXxBqPTEqw6oPI6tRw6RVL91+0nNrmIiebMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050644; c=relaxed/simple;
	bh=2WUvwLX3d2fOIPdsxs5nz07KjF3nk3oQl4+18Q9FTDA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uqp2IbO7Rae8AASRplNkqcPhPXzdpRJu26q9yWpQS9Tbc0AmOgxjhlwLNA8ktoF75TGIzqfAfZB5ym62cdAS9b2H2PJiE/ZJFdcuak0VLlwskuvTLuADN+lFC0FW63/jon0e4266repBYotBhRxtumNXapfbmgTifbHMOdBEspI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jMXt/z6p; arc=fail smtp.client-ip=52.103.35.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jMXt/z6p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7bGpmV846cGz+IxBd5+E+AdPB80pyAKQYpVs1sJsBoXqL0XBByELG0H9pv5gasx0uyNBYLBRBV0eFKCgZmxbYQcacevjy/pmOsNwc0YsxO55HUq66JVXRsj1oebq7L61fF7s2dQsOk3jRCwxs2+1qA2F6t/Lpj0q6sAomwQDH2Qr0Y84E6IJPuPurQ2YjxL9DYhTsqDNu6spwX2xs+kp2Rw9ueb5hS0FEiaqSJc3QKSS6QZRVj1rcx6nsLtGfHAyEqJRIo0T7Ce+GfeCbKgCtBorPbnCYzXLCqgEeroLpmiCgAC6bPaOsj4FkVeBzsjRo4ZrRPgbLECGIlVPVlVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WUvwLX3d2fOIPdsxs5nz07KjF3nk3oQl4+18Q9FTDA=;
 b=apClYfpQ5f7FoORn8x9FdEfWtZcRC3TwTf3rBD47ubdF9HKRDeJDkDW/DjOYhX6RbqGcYMEUsM3k3ewtyisG13NBemJBga//8ETCu+108iP5DnEhV6jSnndZG7dOthbiKxtLjXcZKsC3ZQM/Cx1AP2XZ8Fh8bipOuZB0FCLKQ6dQ9n8lVcSG5Xe7r3+EubXVgWzc75xpXEXRCvlUVyrOXXphek+hx20W5HDUZpafYcQEQBehguml6XNj3SM8ddS2Hz3ANalsAhCqVKzFqFKS5s6MB8F6sRpzs7SBgbWpxE9WK5Z84mS/mMVfmB8WwtGBPhDTF7qJW/bH9aSmGp34NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WUvwLX3d2fOIPdsxs5nz07KjF3nk3oQl4+18Q9FTDA=;
 b=jMXt/z6pch4avP2K+KZBlzsC8Y/bFnpMtrZ8UlNcHW9+h8saM7haRKLswrwCxXgJ5FD0BdhAUVF8VWUvERL5JgFzhinfY2Mt47XsmcHdTvLHXB6bPzFJNaL4ZT9A1n3q6maXcIAKHS2hG2+zogLQnO+OuMUmWB2yOqtNNZgvf0oY9SoGHXm1f7/hdjNbVgvzIWE74wbm9ytYQ3jbF0+17rETl26TsV3SU2vQMq7HU5pP02BwpOHF+R2UnnJTwqAkOXt2gAHD1Q3xnqajb10a+Che+N+ulxEuaBi0gWs5Js5t0T9CpKSv9ezlLH9z9FLmwTRPrzCNx/EU6UEgSMVZEw==
Received: from AS8P194MB1919.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:52e::13)
 by DB9P194MB1417.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 12:44:00 +0000
Received: from AS8P194MB1919.EURP194.PROD.OUTLOOK.COM
 ([fe80::4fe7:bffd:1115:25b9]) by AS8P194MB1919.EURP194.PROD.OUTLOOK.COM
 ([fe80::4fe7:bffd:1115:25b9%4]) with mapi id 15.20.9228.014; Tue, 21 Oct 2025
 12:44:00 +0000
From: Stephen C Goodman <Stephen.C.Goodman2@outlook.com>
To: "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>
Subject: Bug Report: Broadcom brcm80211 Displays WPA3 as WEP in OpenWRT
Thread-Topic: Bug Report: Broadcom brcm80211 Displays WPA3 as WEP in OpenWRT
Thread-Index: AQHcQobp2bbcuRxRqkmJXtSVzShGA7TMitYA
Date: Tue, 21 Oct 2025 12:44:00 +0000
Message-ID:
 <AS8P194MB19195004069A621AA660EA609DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
References:
 <AS8P194MB1919C4BF0BF0BF222F65BA449DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
In-Reply-To:
 <AS8P194MB1919C4BF0BF0BF222F65BA449DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P194MB1919:EE_|DB9P194MB1417:EE_
x-ms-office365-filtering-correlation-id: 44b51d0f-cf99-4a42-945c-08de109f8220
x-ms-exchange-slblob-mailprops:
 /OoUGmN/RpVAjouTXUgUPX+o0ch3BuGwV6dW8GyVDgW0R2Fg86U1K9ZEe5QBtEgfyL0OZMvT/Qtd9IYn0toU7tji1AUbYbApT14ggZVPA+K7jnkhhKB3sVY3lsXnZWJJVO5+AGhm4hSpgoRPr9GvKAPTDV65m3iIyWwmMf8xWjrNNcQsRN5bjegdk2bL39/X8PyizLM4k97eIlzjijbacpJm7nnnuWsAtW5FuzPoTrnTT4eF7NyFTHESGD5zzIvc/ocKXXLSnx+RnjMcIct0L19kf2++h/ngTABNLblrTBfejV3aTWgiy3+sjzoe8o21lbNG3C/TO7qU4miYc0FqAeR3i1iZNdQebl6cuRCIyFonyIw/vXCptrASjPExtPlYaiWe8e5WVYWTN2uBWXXQeiJli9Vo9GfMNSYRGJK7iO052xaO8l6S1grRaNvnqzbjRExsDHqbseXB9UsWCqPt9p3nVyugpWlGTrXRNrLhtDg0zfJJKoFqp97QZzwKxW2WCk2tyjAurYIXWDH3Urr1oz62pM4Ki3CEOULWLm7utQSsRXfwwDgvHJ4SQN60XozknenmOaKBSH9YhU+IufF1ziNFT3dCeeb0SeB7GwMJQvgVQLMYpGEYvaDGiFde0pMEimyVujF/iTEJ/FvgV2mY9xbtIq8fY8tbpLvHZ4Zz5UawTwWwXZqubpyeAcvGeDxfO5pcxvvtWZhbKHEpSdDaPIZwGO9M4RZ2Bfpr+J19APNTtFHTN/Wwe9cRA4/ofMiM
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|461199028|15030799006|15080799012|19110799012|8062599012|8060799015|3412199025|440099028|40105399003|102099032|3430499032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YXaCptMfv98PeybO59KXifX0y2WjFyO3oKu/kIBjU5hZ0l0MNwhLJgsJzW?=
 =?iso-8859-1?Q?YHQWB11kvZzIhGfcfFRRSW4OhTyJzIyEzZaU3h0uLk3k5bw5JOqOkWfQi0?=
 =?iso-8859-1?Q?Skf0xUknKkVAcDvcKcNkq4R5EYQg7zsRND012xpfp4l45OUA5jmquztewu?=
 =?iso-8859-1?Q?VJN/dx8mYugYntoGqw5fAyRsP1c64oZbzjcPbKLuQfPK/byR2DXcgnVPtK?=
 =?iso-8859-1?Q?zvdfUVfoC0QORGhK3LZImyjTPJWO4ugugrHZc5aJzuIDA82hEmnTF8ZWy8?=
 =?iso-8859-1?Q?DWD2wd0WLmUtSZb8lKfSy8ZTHVFjlrPHuzMqtGm7m1t2D9+gFS2MbM/Jwm?=
 =?iso-8859-1?Q?9zPpVsQ+QS9Yt73mq0hwxOOB870AWjwEDd6YIpu/rnsKplFz1349NFhOCd?=
 =?iso-8859-1?Q?PbL1F+A2it7VcZ59H7zwHKZPfHlslnErDA+vKoBWvS/tLL5na9dSwB3L6J?=
 =?iso-8859-1?Q?EUPli4jnn/K5yl6K8GwoXbb0YRlK+tS2/iv27qD2GAaWHeT0VH3vgagXJe?=
 =?iso-8859-1?Q?cgwkOviQGIp43Vzme0BK+NzRa+ty/1Im5z8ErzuC21V+02TRoyMmC/0eBi?=
 =?iso-8859-1?Q?nmz9000r+ofwJcCH0J/L6qG+iNPJy3mRtVY3R9pRnfWapUInt1hjOwOfeH?=
 =?iso-8859-1?Q?0yAj9+ttGqsK9eRpIAys2yd6wIaHx1IHtsFZTef3vgDd0ql0OEQMIytoK0?=
 =?iso-8859-1?Q?XInXp/n4tEdLA3XXUC0g6ezsF+gY1suOqyBKUk/yTl2sFXmVM9c/zWXZ53?=
 =?iso-8859-1?Q?ZZlXmBI35Da9Sdyq9Qh5GzuONaJBViuYYCQi9oSxb3iWmNrrV8tKfUnTtG?=
 =?iso-8859-1?Q?7l6UV3EzTW4Ij5e9ijN7JRjxINcdLw0N9Lopq25BY15YFo2o/ep7Z4cbZI?=
 =?iso-8859-1?Q?ebTZRR3vfSom9PoA5+fLAKT32GPzi6xgRnNpSny2EII1H8uzbB54wvkYWg?=
 =?iso-8859-1?Q?65Z+oHsAHlwRNa/nv/bfAj/zR2e+fQGU5qn9RQDQluKLYliZHd93pb3Vi9?=
 =?iso-8859-1?Q?56gsvk0MRN79953LooMbHpE+DeSUskg1Hj+JS30b0TFY6YgfYv2RMbdqWR?=
 =?iso-8859-1?Q?ZzuvKEIeKj1jNWmGB5uZjTITrVTkWLjGDkxIJWSunzdwD4rqjj7qZJCM8A?=
 =?iso-8859-1?Q?tHhmsCvlmAKPqY473byCdBGpnLkx2UjsWcrw4huHsu7dvpxFtvO/wKZv5T?=
 =?iso-8859-1?Q?56sPfPKBp4KlQAn22BKMcwVlWLeZJyecUX7oIPJBHqfJVeyON92VAU3O?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3qHGqLPJPJWHBfsog7tvwINHLkq6PlarOLbjxeLYAge2f6hjvTDdV1WJfa?=
 =?iso-8859-1?Q?09B92efCfmkmb/hINv3WBdQKBWHiuUhL607zTgBvzfer2tbGXUBMVi7hXn?=
 =?iso-8859-1?Q?GrLstWgk+u+vbMY+KausU4UY+aVCSS8T77CJFz8SpCpvBLTO6CtdAR0bN2?=
 =?iso-8859-1?Q?cUwvQrdjk4G+PfT9H35xpjJjZj7QqaK9vFttDr8uKduQdYZhWU+FY82qlC?=
 =?iso-8859-1?Q?Fs2UOHvHYZUN2EpFQtKebqBQBT2+LGKKdjjqelwnqx0Hv1vMGKoCKUpXz5?=
 =?iso-8859-1?Q?3t/+VbkMm7t7+84SkswJNZcOdwtEJQ5TlbEFpCPC8lZbBiHAJAfNpO0MPc?=
 =?iso-8859-1?Q?JIgcPVFJiTP7RHBPaLMF9KVPgjl8BxzXiOkwQD+NfTurgLmG7VmgSGRiqr?=
 =?iso-8859-1?Q?DgKU3yXOApJ/51NJZB35nG/5bjZnV9Bef4UgWcVhaZK5H2Y5WMNuoFW8of?=
 =?iso-8859-1?Q?UbmzeWU7NjAMGgWAsMEvZtLr/3U51HYme6tXqeTSo3zTFKblYexWJ0yBW6?=
 =?iso-8859-1?Q?6KOYzDWX0oQ7PKVKToyZ/l9gt5mwAinkynvMrPnzw8FP8aJOmlTS2GTC4Q?=
 =?iso-8859-1?Q?BwGGwq78Mk4rOgN3WjipV2b8MRpcmvc+C5sCJJJWhY79X/ug0WtSqAtP2W?=
 =?iso-8859-1?Q?vrjDPlAza3yP7x/+VWqPE4F3HnG4IXjqbQtkdbD1qN/9mE6WnBFLHtBS0k?=
 =?iso-8859-1?Q?ofmWKdW6XiN1aWbpoUETOz0ISoti+BwoJHAkPwHfYjxrdxUDrCN5SEWTt3?=
 =?iso-8859-1?Q?9tVodswm1QfayBbOAJoVxWChYfWMyTOsSyQoQ/5BJC/kp7KPiXJfRE40j+?=
 =?iso-8859-1?Q?XoSfl5+EPa4dGcdP0gmvd+27n7q8opvngYdFLewLxdGO3LZTZsQME24GG7?=
 =?iso-8859-1?Q?K74FtBQayMF/el6CQl3LmmIHzGKEBDPG6kdB7K5S/fX/6ylcPQR05IFfnI?=
 =?iso-8859-1?Q?10N0ByDa783vjPe/4zsYyo3HD+WczwDrxuWHMWmkJiwknNsa/dR6i4Ego+?=
 =?iso-8859-1?Q?Xn9/plZCTJ9KiID/1vBYFGIbrmqvSGIKZUGEFXTH6HuqJ5EPHnZPZSGtQn?=
 =?iso-8859-1?Q?XWo67nTC8taGXDnxCuV+6pyH5L7wpLBOFmkMyr8V8ds52nvHE5hoJvfgVb?=
 =?iso-8859-1?Q?jzTULx1F47iBMphiDFamxg++iVgZdtxP5FEEzYgKYemPi24ijapi1jd8ls?=
 =?iso-8859-1?Q?ork/M6eQEGMMU1hDtR+uWfMjN4QTXblGfx5ANgTtsNvCqxGAiAEmhzjlkp?=
 =?iso-8859-1?Q?0Z12u9+iewDC0xqHtsEUCJqiPXQ5sEpbXCdez53Rt1dHR3mKFeylN6jj2z?=
 =?iso-8859-1?Q?qJKX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB1919.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b51d0f-cf99-4a42-945c-08de109f8220
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 12:44:00.2166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P194MB1417

=0A=
I would like to report a bug concerning the Broadcom bcm4366c0 driver, whic=
h affects most brcmfmac PCIe chips.=0A=
Issue Details:=0A=
Chipset: Broadcom bcm4366c0=0A=
Environment: OpenWRT=0A=
Kernel Version: 6.12.54=0A=
mac80211 Version: 6.16 (backports)=0A=
Description: While WPA3 is shown as SAE in OpenWRT LuCI, attempts to connec=
t to the network or using a Wi-Fi analyzer reveal that it is actually opera=
ting as WEP. This discrepancy creates confusion and undermines security exp=
ectations.=0A=
Steps to Reproduce:=0A=
Use the Broadcom bcm4366c0 in an OpenWRT environment.=0A=
Configure a wireless network with WPA3 security via LuCI.=0A=
Attempt to connect to the network or perform a scan with a Wi-Fi analyzer.=
=0A=
Observe that it identifies WPA3 as WEP.=0A=
Please let me know if you require any additional information or logs to hel=
p diagnose this issue. Thank you for addressing this matter promptly.=0A=
Best regards,=0A=
Stephen=
