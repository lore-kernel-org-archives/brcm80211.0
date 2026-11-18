Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005595;
	b=E9RxD1tUIeHK5d7vZtbMt7rOtKIZ5S+Z4na+dXjDyDXUdAryOXh/MMlMn0D4LylVe6yR
	 QwlZmwktucn6UpYNsIRaudhwcRJOkeRa0aGsqJIEXKweeFV5xRm/bQF16FyL1hTpaEUjp
	 4VG784hr7sAw7kjt/kO9ertpHEUsjOJziLRDKP6WigqInyA8zk4WPr24cXWTtsf3oLrSG
	 R5IXJ8/d1cnGFl8mFS2jTtAypsyiHQAhfOiYkfknIjHN8yEzawp81BP4xkze5neY6ArhE
	 BIeTyeobobXqHMWtcNMHKz9H2LUNjDCYs4Nf6xDK9YllMdVEG9yNee5SYUcAirS5zEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005595;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wJWY+H7MlcUDBSxoJT3NvYfqFR9PW6PfPjEEDgQAXpg=;
	b=eEjLAw34i8hSU0TWVPVhxa0WCgywJjbnRRS0afAL+7xtx0mBk+IGRk1gvmlQ7ubCkp1n
	 U7zelgGUPLRUhu5ePBdAVrc/xyRGuh5YqOVDyd1ehwbaPCISuhGI9RaszvEBTAcbaqb1+
	 OTN+XJvWWmDOHendGnEQCoOvYQerIM4mmngroh2KckihjOkrouyibAA+OkUaL6KFqKUL8
	 4gvL2k96X3zeyNdniAe9qq7FN6kLx3Q/aTV0rJpzPeOTm8p/K7cCd5Lf1RHBh82hPvx8u
	 Bqwzb6KzHbGxJJtJEunesNJYW6APaplBN4klheJY1RpL61Of2Ue3bQ6f70mcSBR2R4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=VLolwM2U;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C178606A31C
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C178606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=VLolwM2U
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 3b985f98-896a-4dd0-85c6-48ae21c131fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795005591;
	bh=RFyJsWBgMKmHUjPTsXIbWid7cPYu4guWWMY3nhzBcBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VLolwM2UjV0+PFE5s0xcHGQQju6g6aylHEoPgLk72sD9Qt/mO+EHndnpYe0F3qvfL
	 zt5b7b+oVxVvtPKmOOtbCsjIzcU0nhekar/CbdMmt91hwVHKMAGdQGKeNbeT3Q/+Aa
	 tPqnU21WQfqrMex71r4uQOR95BKG1aqINOMtuIhxqQqLa+1u4vs5OCcTBhYNp8Eajs
	 cIJnCswf5y+uLDKDOq9bqeyADYze2JtLOwcybmxSJn1wja1yGwhNGwyFjh/7z4XrXO
	 DjM1jTpVkOluKwIL5qgi4ScdD4f7p1JEP59H49Spa1BDKT97dnwF9qs5PJgaTSdx+C
	 3gsTC89gVclFw==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Wed, 18 Nov 2026 13:39:33 +0100
Message-ID: <20261118123933.74517-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151620.70671-1-dev@deq.rocks>
References: <20261104151620.70671-1-dev@deq.rocks>
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

brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
the interface is up and not promiscuous. On the Apple firmware for the
BCM4355 and BCM4364, ndoe makes downloads collapse.

On the BCM4364, IPv6 downloads topped out at 55 Mbit/s on a
MacBookPro15,1 with the BCM4364/3 and on the MacBookPro16,1 with the
later revision [1][2]. On the BCM4355 of the MacBookAir8,1, downloads
fell to about 50 Mbit/s with the offload on and stayed at 300 to 400
Mbit/s with it off, and the firmware logged errors several times a
second [3]. The BCM4377 is not affected.

macOS enables ARP and ND offload for associated sleep only and clears
both on wake. ARP offload brings no benefit while awake, and without
WoWL brcmfmac disconnects on suspend on these Macs, so the offloads are
never used in sleep either. With ARP offload on, the firmware answers
from its own host IP table, and the host does not notice when that
table is stale. brcmfmac already turns both offloads off in promiscuous
mode and while a soft AP runs.

Keep both off on these chips when the board type is an Apple one,
which runs the firmware the way macOS does while awake.

[1] https://github.com/t2linux/kernel/issues/34
[2] https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
[3] https://github.com/t2linux/linux-t2-patches/pull/85

Fixes: 52f22fb21764 ("brcmfmac: add neighbor discovery offload ip address table configuration")
Cc: stable@vger.kernel.org
Closes: https://github.com/t2linux/kernel/issues/34
Closes: https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
Link: https://github.com/t2linux/linux-t2-patches/pull/85
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Co-developed-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
Changes in v2:
- Restrict the quirk to Apple boards with settings->board_type
- Add the BCM4355 of the MacBookAir8,1 (Aditya)
- Add Fixes and Cc stable, target wireless
- Explain why ARP offload stays off as well
- v1: https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

 .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 92ec269f43b2..00d608923380 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -13,6 +13,7 @@
 #include <net/addrconf.h>
 #include <net/ieee80211_radiotap.h>
 #include <net/ipv6.h>
+#include <brcm_hw_ids.h>
 #include <brcmu_utils.h>
 #include <brcmu_wifi.h>
 
@@ -93,6 +94,22 @@ struct brcmf_if *brcmf_get_ifp(struct brcmf_pub *drvr, int ifidx)
 	return ifp;
 }
 
+static bool brcmf_is_apple_nd_offload_broken(struct brcmf_pub *drvr)
+{
+	const char *board_type = drvr->settings->board_type;
+
+	if (!board_type || !strstarts(board_type, "apple,"))
+		return false;
+
+	switch (drvr->bus_if->chip) {
+	case BRCM_CC_4355_CHIP_ID:
+	case BRCM_CC_4364_CHIP_ID:
+		return true;
+	default:
+		return false;
+	}
+}
+
 void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
 {
 	s32 err;
@@ -103,6 +120,16 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
 		return;
 	}
 
+	/* With ND offload on while awake, the Apple firmware for the BCM4355
+	 * and BCM4364 makes IPv6 downloads drop to low rates. macOS runs ARP
+	 * and ND offload only in sleep, keep both off on these chips.
+	 */
+	if (enable && brcmf_is_apple_nd_offload_broken(ifp->drvr)) {
+		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on Apple BCM%x\n",
+			  ifp->drvr->bus_if->chip);
+		enable = false;
+	}
+
 	if (enable)
 		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
 	else

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.0

