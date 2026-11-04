Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805355;
	b=hg9AomvzHqTNznY4+zA/j9cQKyHwVYexmFMi+g8qePk9fDsAuDtVdMZg6VUYl1wij833
	 uPqmY1nbkm8VQiOak8VgGRWBozEshXIA5oxqES1Vu+gTEITeIOrbpK9QZN5Rbt1BAA4t3
	 5SGOC+9OFRneaByAKFp2FnNs2ztsfXRVbCmlbI6CwcG12pynQM7Mxmqpc0aa9WWo2rbTq
	 R8iG4nWMOzPhg5ZoAapyFT6tgJk3NAysmGL3eISfbV4rWbikrBcZZMu5zPeSXWYBRChKT
	 5GKBz3FWPgzn7/21t2AbTCqRwbaJqx866waKgjNsuQLSuvEB5k/lp/pEqXzQypjesHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805355;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zsfOiogR053HXyKEeKDRl+0OhEDGSSdOkZGTArmRQf4=;
	b=BwOejC7FZOhwNet0JtzqwSD6qeP5ilY2FDQvIeirXoLmReXjkOl63/sSsRibf1K4RrXu
	 GrsUSol03f7AHKe/NRuUz3LvQDARnqX+keKDtcNXzD6NWX1x6mF8h9jdQVHWGnoqav8vW
	 nc/fEZFs5RxrI+3OujZ1x26u7h5aAxY2pZJb9uHfalXn2FGLm7E/kBJqSwtHuicn01RPo
	 CY2IAQM+BpqRGyJ8Hgg324QjVoeWJzXLI/7hsVcigsp9+zHY8+ExZ4suctIU+kMnB53hn
	 QJqYp4TbgHW4ime/KVpdT1iq8ZKwP6NKaWiohh6m1pGV9qQn0HvNTZU9tdMEfzdae0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=jMo+HtZR;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D3606A32E
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 15:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00D3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=jMo+HtZR
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805353;
	bh=e96flOfxmVs97TM5Ou6o3wRjaqQhAXFC2WdCewdFcoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMo+HtZReucJj3QjNjeDQaV/xv1WJJJdAY5qUztGfxsj9jUWgJbey2L0XCZnT5BIB
	 vqzvv1QiegxE9u3Y0jWSSieVDR0ThZ+UP7ugOOMOUNBiit39SZYVqQZaw/ZtsDqEt/
	 Jml7AuZn3adVNhdOmMKN3gMPeSbYCc+nubrZaZWn+HJEgqzpdkqtYyl/2YS2CpMuvI
	 jzabPQLtYfoJPf0uwKGJWwjuK8GqoEk8fFTcbobOFWSW0y5NvJakJQZjcoMJ1lTB74
	 zHw93fzzqiBXC7Q5+V83ZicnFHAVD4wWeqSQ8bt08SXrK8GRjRtTmgKuAxoCHEpwwS
	 iXOeqNb3gxt1Q==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH 2/7] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Wed,  4 Nov 2026 16:15:42 +0100
Message-ID: <20261104151547.70333-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151547.70333-1-dev@deq.rocks>
References: <20261104151547.70333-1-dev@deq.rocks>
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
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d87126..1037abe6d58 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -268,48 +268,6 @@ struct parsed_vndr_ies {
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
index e74a23e1183..6f13e10b16d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
@@ -1236,4 +1236,47 @@ struct brcmf_mkeep_alive_pkt_le {
 	u8   data[];
 } __packed;
 
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
