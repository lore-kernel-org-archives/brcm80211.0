Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783280;
	b=ezx24wNPz51KfFoUyudXHiXIE8+Mj/nGKXwyPxwchxfKRMdzkmbiLBFUDaATH4ajX9Ur
	 ZxqObS+79grx+f4VHNTsypG3CAZ2P1PAyLLhndAcej2cXAmMO+1ABZMox8x4Gq5IS4kPT
	 8rRnvjcsnKgqwgYECqAaCZMmahEk7sDOOOoDBMX3FCEXaGEbSz9I12R0JIR8bGk25FiHv
	 b561+2lEGRtAUUrvNysy5KfaOuZ5BEg83HydgvEdG2eudQgFm88MgrKx0B/GRJ7BzH8vg
	 PXDFa//inwfN0Ex39/jb+fM1sIarxh+fuFwD3DFd31fs9Xt4JUF+JB5P82repwfXjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783280;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f2IKiIgwrwPhZnKxMWhFMgyWeawmFybOA5SI2KKPvfQ=;
	b=myK130lRGaxb7/uQkHr7I/ba502rItEbnkWrjnq6U5YTcosFhHrQMrArjUn97+1FQkIu
	 aARVmI8/blDybdSLugqmYbTB6v0roRQ7FcXmo9Tx1g2hF1M9E6dmT1QiX7xThL9fU+Cf8
	 whST7dpOXdjUk1tmOQve8lI08OD7IVtK//5mHwxqN/ucVy7OJXEmGaBy+DXOMFCorp1zq
	 JnbGADR9L6ddZ0zU0Tkx9X6grjW8++XIFbCfxANLwuWPw4VFhCKqltff4qJArAlqJa/ym
	 U7jFXx0W+u5mzqKiQh3EJBj4bLRaqPL2Pd3fuGQUsUpqgfOb3iMJ1jfitXuBenFLHqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=RxtkvXto;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D277606A32A
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D277606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=RxtkvXto
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783271;
	bh=3sGLL6APmhRqO/jkfKMLi1YXNpdQbllVfhOQGjaHsKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxtkvXtoYAdpuSFziE7Z2GpOxvlovwv8BJrIfFXGmg8L6WwgRa492F3CmgDLNmpkA
	 DehDkAEcKUCdQtyv1cf1AzP0r9DtW/zW2QonDSZc5FSGMXRqRf6yau1pwhNz9wVb+B
	 c+4haVm9hELexfEY+vYuoEZVkMqdmBI9r1b3EoCyr/D495Uf9ODNgdHZ8U4GRm8YaE
	 8FEj/bR3AnEsnYX2AzayX9O2hFiDvKuUGbTEQSWqnVuzJ+MluEVp1SQX8PW2VD1gjx
	 PxeUI+r2K3OvkZcP0jcuYb1jJPisaMyPh6b+fhbotRdR6R9p9q/eTFLOFwudq7+quP
	 NQhuV5ScMBaMQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Fri, 27 Nov 2026 13:40:59 +0100
Message-ID: <20261127124104.233236-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124104.233236-1-dev@deq.rocks>
References: <20261127124104.233236-1-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface_create iovar structures and flags are firmware interface
types like the others in fwil_types.h. Move them there so code outside
cfg80211.c can create firmware interfaces as well.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 57689026525e..2035535b753f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -271,48 +271,6 @@ struct parsed_vndr_ies {
 	struct parsed_vndr_ie_info ie_info[VNDR_IE_PARSE_LIMIT];
 };
 
-#define WL_INTERFACE_CREATE_VER_1		1
-#define WL_INTERFACE_CREATE_VER_2		2
-#define WL_INTERFACE_CREATE_VER_3		3
-#define WL_INTERFACE_CREATE_VER_MAX		WL_INTERFACE_CREATE_VER_3
-
-#define WL_INTERFACE_MAC_DONT_USE	0x0
-#define WL_INTERFACE_MAC_USE		0x2
-
-#define WL_INTERFACE_CREATE_STA		0x0
-#define WL_INTERFACE_CREATE_AP		0x1
-
-struct wl_interface_create_v1 {
-	u16	ver;			/* structure version */
-	u32	flags;			/* flags for operation */
-	u8	mac_addr[ETH_ALEN];	/* MAC address */
-	u32	wlc_index;		/* optional for wlc index */
-};
-
-struct wl_interface_create_v2 {
-	u16	ver;			/* structure version */
-	u8	pad1[2];
-	u32	flags;			/* flags for operation */
-	u8	mac_addr[ETH_ALEN];	/* MAC address */
-	u8	iftype;			/* type of interface created */
-	u8	pad2;
-	u32	wlc_index;		/* optional for wlc index */
-};
-
-struct wl_interface_create_v3 {
-	u16 ver;			/* structure version */
-	u16 len;			/* length of structure + data */
-	u16 fixed_len;			/* length of structure */
-	u8 iftype;			/* type of interface created */
-	u8 wlc_index;			/* optional for wlc index */
-	u32 flags;			/* flags for operation */
-	u8 mac_addr[ETH_ALEN];		/* MAC address */
-	u8 bssid[ETH_ALEN];		/* optional for BSSID */
-	u8 if_index;			/* interface index request */
-	u8 pad[3];
-	u8 data[];			/* Optional for specific data */
-};
-
 static u8 nl80211_band_to_fwil(enum nl80211_band band)
 {
 	switch (band) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
index 37d9414546d5..973598d43368 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
@@ -1375,4 +1375,47 @@ struct brcmf_eventmsgs_ext_le {
 	u8 mask[] __counted_by(len);
 };
 
+/* interface_create iovar */
+#define WL_INTERFACE_CREATE_VER_1		1
+#define WL_INTERFACE_CREATE_VER_2		2
+#define WL_INTERFACE_CREATE_VER_3		3
+#define WL_INTERFACE_CREATE_VER_MAX		WL_INTERFACE_CREATE_VER_3
+
+#define WL_INTERFACE_MAC_DONT_USE	0x0
+#define WL_INTERFACE_MAC_USE		0x2
+
+#define WL_INTERFACE_CREATE_STA		0x0
+#define WL_INTERFACE_CREATE_AP		0x1
+
+struct wl_interface_create_v1 {
+	u16	ver;			/* structure version */
+	u32	flags;			/* flags for operation */
+	u8	mac_addr[ETH_ALEN];	/* MAC address */
+	u32	wlc_index;		/* optional for wlc index */
+};
+
+struct wl_interface_create_v2 {
+	u16	ver;			/* structure version */
+	u8	pad1[2];
+	u32	flags;			/* flags for operation */
+	u8	mac_addr[ETH_ALEN];	/* MAC address */
+	u8	iftype;			/* type of interface created */
+	u8	pad2;
+	u32	wlc_index;		/* optional for wlc index */
+};
+
+struct wl_interface_create_v3 {
+	u16 ver;			/* structure version */
+	u16 len;			/* length of structure + data */
+	u16 fixed_len;			/* length of structure */
+	u8 iftype;			/* type of interface created */
+	u8 wlc_index;			/* optional for wlc index */
+	u32 flags;			/* flags for operation */
+	u8 mac_addr[ETH_ALEN];		/* MAC address */
+	u8 bssid[ETH_ALEN];		/* optional for BSSID */
+	u8 if_index;			/* interface index request */
+	u8 pad[3];
+	u8 data[];			/* Optional for specific data */
+};
+
 #endif /* FWIL_TYPES_H_ */
-- 
2.56.0

