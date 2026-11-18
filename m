Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011028;
	b=gk0xQxhzfsN1ZrclQrOupoYzbi4VYA6rsplE42NBzqC9wUX8RBJRonQpyElDyen6SnaW
	 6ofzmH0aq9551CXVxYKy0A25c0WHpft7L772dh7/DDq5HD8h/vDimHkJAkVn4EZ/GcgAO
	 Xi5k6KtPvYEWp9TonBTOhJCcznamdCD/iC0d8mWJmsVNt3GAbrE//32eglPKOXycWMrUa
	 /URBjmQlxGjriKM4eGNUsF+WJnAxWYEjTUTg54efBToven7uyrnQTMzn/ICkyucqbpbO9
	 R1VIy8QA0CIHjBcKe0RuNtHnDvXOheFaTc39S/KnPMwdy4myHtSssQwy6bsaaoKLV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011028;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=npsFFGCyRX9AaLtr89mNBARg/egcXIRyGy20k2D+J78=;
	b=cHLKr7/o0tdEYYYFzVV86nngYLazKYvv4BeX4Z3n5CW6QxXJhHy12Hij7RkOaviXC/5F
	 3kVLi9JVBgolytEG6J4HoMjY6aLDH7Jn91PXNmR5q3ZsIUOEdTtOETy6DyTMqLAvkxfGh
	 gqVzJYrnojC0lMtAt7mCR73CpWL31lEvx0hOVfZkowlxFmN30nTtp0/1nCoWu5P77rkVq
	 XKrOLO/cYnj9+3nw2k4fX8A5QxZwy0xZt5EA6cvq47PAIpcm48Fbj8PFTJFE+kjAAwKz6
	 xwPjL4tgJClFkAeBvhU3EJPjo/KupOZfPZpsubIcYckRm81HeE0Wkhs20++Ss98wz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=pe79D1zn;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F6E60A2624
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 14:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F6E60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=pe79D1zn
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: ff3d75d7-7084-41f9-8f7c-185bf83dd864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795011023;
	bh=C8lYz6kEtryEmtT4rtSEO7012drLrdeMROAIcR9aQbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pe79D1zne1QZC3C5aGQjm8Z8BQs89ePEU/21twVdzQrhYW55nar3sjxw3jPBgE1nC
	 dyg92QzHU09hsmiS5vRvIBzV0W1JIVc8FgL14eZMXasXACEkf2tWhAW9tr4zWnLzqE
	 OUWdcQVnguImh/g6YpmIUAD9tmDa8+q2DcwXoDOWFA1ekYU5kDnAL9fNVJpxMiu6DZ
	 5Q+XoEZsCwzlkY1YUbdHKJsuxai5VCt77kJ6Z3XkvxqtsAvZo2n3usTdiOsK5hxfXD
	 bWgTkIWDJaiYl1K0JA54hONvzH+Tor3yK/spdI/EneP/D3vkEX3zvj9hTzYxFKD6MU
	 BilXI2TEUaBDw==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH wireless-next v2] wifi: brcmfmac: turn off TX beamforming on Apple BCM4364
Date: Wed, 18 Nov 2026 15:10:20 +0100
Message-ID: <20261118141020.92306-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151623.70695-1-dev@deq.rocks>
References: <20261104151623.70695-1-dev@deq.rocks>
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

brcmfmac sets "txbf" to 1 at init. The Apple firmware for the BCM4364
(9.30.514.0.32.5.94 on the MacBookPro15,1) has it on by default as
well, and then rate control settles on a single beamformed spatial
stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP.

Beamforming more than one stream does not work on this firmware. With
"txbf" on and the rate fixed to two or three streams, the firmware takes
the rate but the uplink stalls. With "txbf" off, rate control picks two
streams (VHT MCS9 NSS2) on its own.

Uplink measured with iperf3 against a wired server was:

  0.5 m from the AP, -36 dBm:  351 -> 623 Mbit/s
  -70 dBm:                      96-130 -> 149-175 Mbit/s

Downlink and latency remain unchanged.

Set "txbf" to 0 on the BCM4364 when the board type is an Apple one.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
Changes in v2:
- Restrict the quirk to Apple boards with settings->board_type
- Spell out the txbf value with an explicit if and fix the comment
- State the cause. Beamforming more than one stream does not work
- Fix the typo
- Target wireless-next
- v1: https://lore.kernel.org/all/20261104151623.70695-1-dev@deq.rocks/

The T2 Linux community runs this patch with its kernels for quite a while
now, no regression was reported.

 .../wireless/broadcom/brcm80211/brcmfmac/common.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 93458c2fbc2e..f8ff6217de16 100644
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
@@ -275,6 +276,7 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 	struct brcmf_rev_info *ri;
 	char *clmver;
 	char *ptr;
+	s32 txbf;
 	s32 err;
 
 	if (is_valid_ether_addr(ifp->mac_addr)) {
@@ -432,8 +434,17 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 		goto done;
 	}
 
-	/* Enable tx beamforming, errors can be ignored (not supported) */
-	(void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
+	/* Enable tx beamforming, errors can be ignored (not supported).
+	 * The Apple firmware for the BCM4364 has it on by default and then
+	 * beamforms a single spatial stream, as beamforming more than one
+	 * stream does not work. Turn it off there, so two streams are used.
+	 */
+	txbf = 1;
+	if (drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID &&
+	    drvr->settings->board_type &&
+	    strstarts(drvr->settings->board_type, "apple,"))
+		txbf = 0;
+	(void)brcmf_fil_iovar_int_set(ifp, "txbf", txbf);
 done:
 	return err;
 }

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

