Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805388;
	b=j3rOIZeHex6bO8TpngJK5hm44hI/4rIAEwdyLKAKsfdXecDJYpLGGHahIT0V43bvif8n
	 8JKc1Fz+oF6oHh/cQ2yLg4mavNGIIW5bNKMqOAiQLWt91JjQynnWJqyl/HQUPGiitlEbj
	 gcvA4TO5izPeN+Z635/LzixQ8zgSjL7WEKeDWvCJlQfPsCp02ebK1kiHsGvySIg47Fxkz
	 1CyBOyL1jCenHupZShtyKvqv+v1pUTEvjfwqVB6JCXEjex2W25ZP4aq3gXPpI2ef0/jA/
	 4reo2i+TJQFM9yyNyR45Ov2lkH3wHdmg93+2yLjhIbPSjIubW+O/zCI9+O2czZ23dfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805388;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tK4WO8RFEoNS1ga9RZ95cCtBCfELU8c+BU3u4jgcp0w=;
	b=gVsI93d1e9gHgIcYBDX1+7pDVwn7eFOFZbO6jE5UVY+zDp7i/JGPAe5NBpaKGDhDTPNk
	 8ggWDscK0NbEAXhb4e70I1XKUe9i2CVc1/3ChwEXdhXA1E8JOTq1A0Motrpf6g2pAh3nj
	 +uuKBE5EeSCaaGAzqxvJteX3dTMNw7nHN5OOqR9UvGG0+cYp2jH4Z+Q9YH3FalYVpng0C
	 rRXkV+NqVV8EnZNyCur+ZQpqK9RXtCQXSoEXAr7rG7GtOW+nsE/ZiXw5QmZcwHHz99QvL
	 H2ZRF6WYdFg3YO08IaPR+d8THPizpbYyUR3SDR4rXMk3KdafnByCDWBTFajZvUUAJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=xg5j83mw;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D3606EE91
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42D3606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=xg5j83mw
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 80f10075-a08a-45f6-bd1e-c54cfaf5e701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805386;
	bh=/9NnRqmUpo7wLKprQ06hWRRjaRbSc981GH8qIDJFSUU=;
	h=From:To:Cc:Subject:Date:From;
	b=xg5j83mwGVcD41YcDXmvOjrLjqZiSpEqgXX39J3lPy19JqdQ/Q4kEEXH2MWkMWsa5
	 99X5VRxGzWiHNCZh/7u45tSGUva1bvGNOpeI3vfh6gyiXEn2BOTfj8DczQKsUp6YGD
	 RW4MA8FDTtneAjkkoPoxe2aZfsHo8QCLi8tA/j8hG5a0jJV92f9F5ICZkq281x1ucy
	 PoNg9lBUZsn+xGHYbLr+EfftYFVTP1UMfl0BMZCWi9WGsmaGsmcgsq5u4s/vJndazp
	 CfTvP4ADScoUFp7oOdBo+VTW+FaYiAgBK5jWHf56VBun7p0Y+70e0tkqxsaHLo+YD+
	 PtCTpcpNtOQqA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Wed,  4 Nov 2026 16:16:23 +0100
Message-ID: <20261104151623.70695-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
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

With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
by Apple for the MacBookPro15,1) transmits a single beamformed spatial
stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
enables "txbf" by default, so the driver has to clear it.

Measured with iperf3 against a wired server on the same AP:

  0.5 m from the AP, -36 dBm:  351 -> 623 Mbit/s uplink
  -70 dBm:                      96-130 -> 149-175 Mbit/s uplink

Downlink and latency are unchanged. I did not notice any refression.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
The KaiT2en community runs this patch with its kernels, no regression
was reported.

 .../net/wireless/broadcom/brcm80211/brcmfmac/common.c    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index b6027d83e6a..b09abd5fee3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
+#include <brcm_hw_ids.h>
 #include "core.h"
 #include "bus.h"
 #include "debug.h"
@@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 		goto done;
 	}
 
-	/* Enable tx beamforming, errors can be ignored (not supported) */
-	(void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
+	/* Enable tx beamforming, errors can be ignored (not supported).
+	 * BCM4364 firmware enables it by default and then transmits a single
+	 * beamformed stream instead of two, halving its uplink throughput.
+	 */
+	(void)brcmf_fil_iovar_int_set(ifp, "txbf",
+				      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
 done:
 	return err;
 }

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
