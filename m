Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633383;
	b=ggKdwFSP4lUrYBPhbZ3q3dDfwkkr6u+HpD0ppM1Kuoc4HOCsGb9X5OmT2VhHT+d5wtqV
	 SBLB46+ywlpT4B/rIB/dDvVYjrcRzHtW62zLRQQ7kDr6So17f2FVJffE6q9XweDBVu5Jh
	 pe1K5qdjA2hJcURGKjJGcSBlZh3XHe0YttVA79MFnT1p5CJzoeRBG67qqA0TM9Xltz9rn
	 JezLkmz1WxS3bB8BSq56SOASXFL6d8dl9KjOoL2UAhxtFXyiTIULpVecUd25TgE/iv5LP
	 M96cLQW5KLfMLMCumRUtwXFOr5FalVoNDNuItrvWCmneoH3/E0++4/DhHcL0BrJl44Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633383;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f2IKiIgwrwPhZnKxMWhFMgyWeawmFybOA5SI2KKPvfQ=;
	b=4Y25BO7tmGnRo9dM7Nv++LqaJ7w5KQnOPAx56iyZ0ZzJvMPzKBC5arn0Zjxqysv8vRUe
	 2LJX/G3Fyo2zLmF7YwEeWgr2O4IynzmTbzN10tENBgtycq433iIKjcndmUAO7CwTRQd04
	 YcGXXdtsdZO/OfqSNLi+sesdJ6I7bvMgoo/o0EdPkgf69o9rQc88EX8TFwPIRpq36HHrt
	 t9bZP8xQvfmzeVURFJZPLQ2KrcG+sL0qbJ43Z+gWB2tC8aa9saPeUetZ4ao6DlMrGac6V
	 bYxCRnzq+qA7TCGZYrU4KCUhtDX/CzYfunvYhizCZlpST52UMkhVVuBaRYj5GnzpMzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=iLtJooP+;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D417606A32A
	for <brcm80211@lists.linux.dev>; Wed, 25 Nov 2026 19:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D417606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=iLtJooP+
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795633380;
	bh=3sGLL6APmhRqO/jkfKMLi1YXNpdQbllVfhOQGjaHsKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLtJooP+zmWQov9FX+c948FAsvPSKA5SDKKY9oHBgGh3yJHZ40TaoUn6vlR4U6iD5
	 usgoa6pI+nZPVNdDSB3LM6PfYQrEoasBzJ4LRpsxBmrhozDqjZR5+GbsBuM7WG1bEf
	 xeyyYYqa5QXH51nku7QiaOkHHoE34FhE5FYfecaMK8nXs0KtC9yPbYOry4sJeVni8U
	 G0mKTnyR4+hlQ1y6BVPZ4nrHdrdvS4IaxZs67kIx+z6FSLIhsiAAP1eQWyAn9ePkAD
	 EMxOiqGQwSibECkTPmjNW2ELM07PNRUPD8VwFQCG4hebmFuYl3LS6d4Tz0M8MAAh24
	 FNnFyhoUsMHyA==
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
Subject: [PATCH wireless-next v2 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Wed, 25 Nov 2026 20:02:49 +0100
Message-ID: <20261125190254.176055-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125190254.176055-1-dev@deq.rocks>
References: <20261125190254.176055-1-dev@deq.rocks>
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

