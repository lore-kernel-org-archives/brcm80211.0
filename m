Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633385;
	b=kWvhj+98kTECPr7M9+9Rk0UMY7dTPGK0jrOMHOK7kMYsht8F4AtXKu66fqxgqhrtlhqv
	 rU5irzhuAlg5cP3oe2Sckq1e8T3L2k4sVefGiVvncH9ukLFFdJJuxW6I5HXHoX5WT+D21
	 8mpxQr+rcMxFgz7a912L4swjl9HUW56GnaIk6KUNIsBbOqrxcupVStyygyytGJ8ypnht/
	 8D63j4F2X3it/mUbPxh3PqNMDilE4Fg6g9+C6vgGraFfuDHVdMIZCdG3OzxvfxF7uKGG9
	 g0eqIqIANs32yKfKWu7/Q0jjLpONdEN/PJSNNR+McaBwKFMrZ9h8pwnibvmFab40pow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633385;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RgPbE9nhU338HtDajmu0ZXX2ORNgVpnSgfmmDe9BU7E=;
	b=w6QpwwSpMmsVf6AnjsKEAvpfjIpPqWfHGfXbVTahDLahMtORr0wEkuUJ579jhni1Ufqk
	 SFz61xeWFegk7SIBnTK58azpFIYPsTJkBj7NgJ639TYFpBktx2s4+TSjeojTQRtQ0lQwK
	 M9Qxl5tLJvmP8vgqyGE17lrC1Ube7Fil5DGwC1lOrEwcLo2iDqNDjSM/TOC1ikogyux9H
	 NNWXCW2iE6Nxr5YC2poVxXSVrcZjPR8OGIAt5nJIjGQVKz7v8adXRNYotMsBnAuEEdVcz
	 8sSVkfwp0ndMhuDPTvgznrf5lykqVGKCF7cCMWNFkZXg9pOwS/3u6YWy0Coug1Zlsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cy9rzvoL;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AEF606A33F
	for <brcm80211@lists.linux.dev>; Wed, 25 Nov 2026 19:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AEF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cy9rzvoL
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795633382;
	bh=LupYoENTSwGDpxP1UY4DAVD5Tw6+dxv72Wk0TnoS1MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cy9rzvoLVf/U8eWqmn7yF07SolQ4+eA/zSlgkCFeGAgYfPP4UAc7ZQjPav0GocBmn
	 cWFS+yiMSkcerqgiLE54g+zIH2kBxNEzyti5IUP0Ei/XXN+pZNxHIKwGUV8pJ4Iv1B
	 Ava4VglfjnAky1XEanDTfwAE8kbgzNNxmuWWwztA1iGa/9xrPJ7oD9M3EMaxwBj9pU
	 uQkew84thzu1RHiV8o7K9SlLcKtSKfToU5jSh5Sp04QIbAkLhSUTetyZW2rQo3Xdu0
	 fZ04Mf1zOsHI6u7smlW1NiBClYhT8JpC6gPetHI6lAd+JoIBwghSV4JUaJ5VQCdV+r
	 rI3pFa1qDNecg==
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
Subject: [PATCH wireless-next v2 2/6] wifi: brcmfmac: detect AWDL support of the firmware
Date: Wed, 25 Nov 2026 20:02:50 +0100
Message-ID: <20261125190254.176055-3-dev@deq.rocks>
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

The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
Direct Link (AWDL) itself and announces it with "awdl" in its
capabilities. Add the feature flag for it.

An AWDL interface is created with interface_create version 3 and
interface type 2. The host gives the MAC address, the interface index
and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
definitions for the interface type and the two new flags.

The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
every interface_create, including the version query, with
BCME_UNSUPPORTED. Keep the flag only when the firmware reports
interface_create version 3.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
 .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index 27fa3a7941d9..898a991885a8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -49,6 +49,7 @@ static const struct brcmf_feat_fwcap brcmf_fwcap_map[] = {
 	{ BRCMF_FEAT_SAE_EXT, "sae_ext" },
 	{ BRCMF_FEAT_FBT, "fbt" },
 	{ BRCMF_FEAT_OKC, "okc" },
+	{ BRCMF_FEAT_AWDL, "awdl" },
 };
 
 #ifdef DEBUG
@@ -391,6 +392,29 @@ static int brcmf_feat_fwcap_debugfs_read(struct seq_file *seq, void *data)
 	return 0;
 }
 
+/**
+ * brcmf_feat_awdl_check() - keep AWDL only with interface_create version 3.
+ *
+ * @ifp: interface to query.
+ *
+ * The AWDL interface is created with interface_create version 3. The
+ * BCM4350 firmware 7.35.180.133 lists "awdl" but answers every
+ * interface_create with BCME_UNSUPPORTED.
+ */
+static void brcmf_feat_awdl_check(struct brcmf_if *ifp)
+{
+	u32 ver = 0;
+	s32 err;
+
+	err = brcmf_fil_bsscfg_int_query(ifp, "interface_create", &ver);
+	if (!err && ver == WL_INTERFACE_CREATE_VER_3)
+		return;
+
+	brcmf_dbg(INFO, "disabling AWDL, interface_create version %u (%d)\n",
+		  ver, err);
+	ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_AWDL);
+}
+
 void brcmf_feat_attach(struct brcmf_pub *drvr)
 {
 	struct brcmf_if *ifp = brcmf_get_ifp(drvr, 0);
@@ -400,6 +424,8 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
 	s32 err;
 
 	brcmf_feat_firmware_capabilities(ifp);
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_AWDL))
+		brcmf_feat_awdl_check(ifp);
 	memset(&gscan_cfg, 0, sizeof(gscan_cfg));
 	if (drvr->bus_if->chip != BRCM_CC_43430_CHIP_ID &&
 	    drvr->bus_if->chip != BRCM_CC_4345_CHIP_ID &&
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
index 45a05642bbed..8574731418fc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
@@ -63,7 +63,8 @@
 	BRCMF_FEAT_DEF(EVENT_MSGS_EXT) \
 	BRCMF_FEAT_DEF(SAE_EXT) \
 	BRCMF_FEAT_DEF(FBT) \
-	BRCMF_FEAT_DEF(OKC)
+	BRCMF_FEAT_DEF(OKC) \
+	BRCMF_FEAT_DEF(AWDL)
 
 /*
  * Quirks:
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
index 973598d43368..b87222b2bdd9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
@@ -1383,9 +1383,12 @@ struct brcmf_eventmsgs_ext_le {
 
 #define WL_INTERFACE_MAC_DONT_USE	0x0
 #define WL_INTERFACE_MAC_USE		0x2
+#define WL_INTERFACE_IF_INDEX_USE	0x8
+#define WL_INTERFACE_BSSID_USE		0x10
 
 #define WL_INTERFACE_CREATE_STA		0x0
 #define WL_INTERFACE_CREATE_AP		0x1
+#define WL_INTERFACE_CREATE_AWDL	0x2
 
 struct wl_interface_create_v1 {
 	u16	ver;			/* structure version */
-- 
2.56.0

