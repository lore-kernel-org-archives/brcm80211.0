Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620447;
	b=LTrPix1jxZWRpA2az5EqwdXZ96lsMQHo1/5GJfO2He4aVSRRxlKK8SyB/ZqoBeO9enY+
	 sSAKpdiPdLR8Btu0CVJT2jJ64dLbLi9PT8pwVK1BKr0tZDpBxqQoiPad7cbL498gUgzs8
	 ywKc7VvFYmJtE9Ep1DF57ovDNU0eWo9k6Nl0j3yYDJsCXsf1PWiYAaL7C4eG3K+mogREF
	 OHFNlmo5Tcz2mYEHLGZRHkPe0hnG41PDJxSyltOmIe+6jX8oT2EGcjU/amd83LzERrjBi
	 krz6Q04K4PTFF6zvHBjdmAzxozKlNVazPrMqONklbrkxv/JmUhyGqLC4yHfpQuKR+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620447;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V1/gDYLW6wZb9SX8ssnkHsT0gTwK/IOErcmdXS0BwVA=;
	b=KNHjtJcCw4BFekHSc7dMGlQkHvPzvC1hxQzkwzV18EHCrDSmc5pHQaNBcoMWzs4yZa06
	 VKTE91ZRL2ds5RzPjnABa2q7m/K6eck9dxQ/2uB1zZg73NC5zUB++PESfAe+bt1hGjcPt
	 IR1c0gNO6v5soU3wiSkDPM//HJwmY29x5nJoBDyCP4c4Bdvi6dB+iZPTKk2lBi4/1m8wS
	 nUlSZTdn0MjRZYL3i36TCMkmQIMEAYB833rbD09wO99QH66N++ud1ikvFNxx4LHWhKJIM
	 sPxl8oJBbjyVzd5eBhSFQpj/l+9Dm0yyWjScVvCLGT+MfX7F9jY2WWTaxDmEKVejF3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=qSaQIqRe;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04B606A329
	for <brcm80211@lists.linux.dev>; Wed, 25 Nov 2026 15:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF04B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=qSaQIqRe
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 4bb23980-4068-4ef8-999b-00135b389ec6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795620436;
	bh=BG3Xpbm/VBYhCtFJkxJrMmDCsXcQiL6mfZYyEfyy9fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qSaQIqRe82QksI6h+Bs9gnzX1QiemZMzGftTlWE8Q99ttGtWcYVItrQwTbhEbvEBQ
	 xz0ItA6upjnTMhzkmfsYSswFnsMqSeHgU4kX/XFHEsE2f6LJTb1aD1L4lWDXuylrOz
	 I+AUir4QEOQ/pkZpvvD4cQRsJyRakO17yMA34+MWM1F1mnyAPnZFzH+OBpLpZjn7Fq
	 WnTnm0zlINT95oVU9C/rsG4quldIrIOpvBXNN0KPeQXb0W5J9/GpLDY774sK9n57kF
	 xVC8om1f6zIji58GHBojnG/vVxB3vlttwCEEvezKU8p/9s8/2/Xo9CHA7AFvdGgAS6
	 SPaki5XcSao2A==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH wireless v3] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Wed, 25 Nov 2026 16:27:11 +0100
Message-ID: <20261125152711.110005-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reported-by: Blaž Zupan <blaz@inlimbo.org>
Closes: https://github.com/t2linux/kernel/issues/34
Closes: https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
Link: https://github.com/t2linux/linux-t2-patches/pull/85
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Co-developed-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
Changes in v3:
- Say downloads instead of IPv6 downloads in the comment, the BCM4355
  loses IPv4 throughput too (Arend)
- Add Reported-by for the BCM4355 case and Arend's Acked-by
- v2: https://lore.kernel.org/all/20261118123933.74517-1-dev@deq.rocks/

Changes in v2:
- Restrict the quirk to Apple boards with settings->board_type
- Add the BCM4355 of the MacBookAir8,1 (Aditya)
- Add Fixes and Cc stable, target wireless
- Explain why ARP offload stays off as well
- v1: https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

 .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index a3d662348711..537bcfce087e 100644
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
+	 * and BCM4364 makes downloads drop to low rates. macOS runs ARP and
+	 * ND offload only in sleep, keep both off on these chips.
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

base-commit: 35c42b20ac87165c054c582380aa0ff0de8aeb4a
-- 
2.56.0

