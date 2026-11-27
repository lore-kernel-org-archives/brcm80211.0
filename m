Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783282;
	b=TKopWft6cGg5UDVw7RL9QrP8kNwJ3MbHi5+1jvgyvMSvVxeOCFSmfsbKcMzMGDRWpFlM
	 G5bmVRi/zBIc5GE9vjo1XMZrKe1XqRz2Y9/cYm1sztEJr6zBjoRjkkCEuh/jXIvxrxqxV
	 HKPVDQgAgrNbDqmX/qdkBhmFbG/OxYb7rOC+sE1k1IxiH9goLuAkex+dnDuPRpS5KzP/M
	 ip2KpwxHOE3shshpeSSjqapVgbXJLqOP8T73t6Vqegy8KYwzXIUZI1XvzqyninNFI+sjI
	 hZtG2m81b4Zw45xlksB14CGVXbi7lyRkSfYFtPB6zlm8+mjURK++gopEQRm+TuH7o/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783282;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RgPbE9nhU338HtDajmu0ZXX2ORNgVpnSgfmmDe9BU7E=;
	b=HBYeKNPNNcPgaAYEQw1X/fDeyoCMP3Og/ek++IYuVHh5DHn7wbCW+YdIZSstOLAxFp4z
	 C9UPhezEXCgfFB0jkRrzjf5F9aPPGCCIO5mQu1+ZgD9xMnN6zApU2nlDdnDThZtpP6fev
	 oPVAdxbdDr8h7LnoTCbc4yMs5q0MbF2TktDOglaN6Zy0ZQJo80i+Y841WoJBTrzX338IZ
	 YJXiIHpqrK5wJLB1Kwa6ioOvfIdWVT3L7kH6DkUPJV5hgOPK34OwtxLq4AxPW35e+aJX6
	 eeECE7wz0iGqkg/I3lbyZlCvw5e3bhogIEeo98X0jFnXDx2hzRsGsLsXA76q7l43QtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JzVwIqJB;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73632606A6A1
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 12:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73632606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JzVwIqJB
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783274;
	bh=LupYoENTSwGDpxP1UY4DAVD5Tw6+dxv72Wk0TnoS1MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzVwIqJBcV2t7Jk3J+L9Yu1E8dNKqJCIOYrlE6jlPxx6ELTqNVcX/O6Tg5eT2XXl/
	 i1xgQ9oN77jjk04s59yRvBQBLM3zF/yh+YYj0Qu9E+aymml8xhnfquZh3tW8hUIJwd
	 OFgXYuHkxjwYr/KHfS/zmGmOgXxSZ3TtYpLBPfdb/VWCZBSqNstSBjJ1fp8Y38f+BN
	 HFgqd+zORxoART0/xfKPtw6Fv1ibxJix9aPQgwqbN+7mJVmlLIwsfi6clFZ+G5uYyF
	 ugU37zNzKUvKlC3lHDISfyGjqct8f4bV7Subqmqd20OqKSbIlqWgc9zVxs7tXI3jbG
	 RmdOFcQJX2lcw==
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
Subject: [PATCH wireless-next v3 2/6] wifi: brcmfmac: detect AWDL support of the firmware
Date: Fri, 27 Nov 2026 13:41:00 +0100
Message-ID: <20261127124104.233236-3-dev@deq.rocks>
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

