Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011039;
	b=pQ3XyeTaL+PxvrKg1JVeenuUYpApDVgngkysYXZH5yq1VRnrklN2MqTphiMZJixjHB89
	 Pi1JLOFPCc+yycmhnShmCl9wasz2EgqFT3HGgW4Y/k0HG2pBJFqtxJwsS0nnU1PHBva2C
	 9keq2zKITimhpdqWgSyPV/OqmBnXXBlCfUlLYjUOhALOb/17AlYan7gEznh9mFYYYQiTh
	 R3IgeG0HAfrjqytt/QEmvSKK2/t0/m5bd6CIrXudWpzT11YLfXdvRvJJT2FnR4+mj7N4T
	 5aJvh+3mJpJEUtqdnRdYHuN41nkUK7HuGoKCubZyIdVNgWpohlczsH+9tHlHsJ3SaTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011039;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7UqE/4tIDUreuai79dYu52y1259azrccM+nQkr9paHM=;
	b=NNvisREUzKYcGz8vkVXCsZ5cuvoUYsVziLZ2+DEAVSes3zn+X8azb2BM/DWhpKntwyO5
	 nOq6+opA5WQaMLD4/kLXmx9oexkVOwd9qojeIfbQSsj4X4o2MDSyfK64vqxbmt9Vgz058
	 RTklI5PfS+rEMgqhrp8Nnov80hoeuSiE0bdklkS1+wf3dhEwVW114+mRce5l3yiUeANbu
	 H7BjPVcvPWpKQw6Ik1j1KLWRFs9KeoIULsxb7SP0cPbauJEIK2VaBTLl/nQ2fP9GwU4NG
	 kJTk0//cUPNAmpFuMjdqaRpVDT/e1kLdzJt39oWrbVWBk9SxJmeLSysJ06D9FuaTJNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=dHVYqjmq;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3560A262B
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 14:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED3560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=dHVYqjmq
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 1b2255ce-775f-4271-bbbe-c8ab8f5057df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795011026;
	bh=yC0rqdeXYwOip/F5gNXc+nZqz5NnjWOAk6rV4niOTfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHVYqjmqrPdKYi/m0LbMrhFqTYb7/pUWc+PVutgKlt+qGKqJZXsNIApXHIvSY5qrv
	 5rTyLST5bz45ZoPCYsYuzE6nnTB9iqA+F3gSkGaK8hOC1MWFtoMl0TzAHGw5DNjdHO
	 oCA93qDY36pWeXYqDNhXAfZm1UyXFGbTA8eNQc+7bsD5owc1Njxrba41TGqsiACBYF
	 PnTBWl9MGL+wANDW6qMWh4z5MNQGj4ly5P+lN2OhZPAGXrc6z64oW+7i0FXng12hjX
	 anfz3m7060xk7n3aMknTsyUD+4+uiAts6eholLaWkSqDvYO0BMNKKyiypcJOobRW3A
	 t3NHtktEDCU7w==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH wireless-next v2] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Wed, 18 Nov 2026 15:10:24 +0100
Message-ID: <20261118141024.92354-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151629.70790-1-dev@deq.rocks>
References: <20261104151629.70790-1-dev@deq.rocks>
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

The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK and, with "sae",
NL80211_EXT_FEATURE_SAE_OFFLOAD_AP. hostapd and wpa_supplicant then leave
the AP side of the handshake to the firmware, which doesn't complete.

With a WPA2-PSK AP, brcmfmac sets the PMK in the firmware without error,
the client associates, the firmware sends no EAPOL-Key frame and removes
the station after about 8 s. Seen on the BCM4364 (MacBookPro15,1) and on
the BCM4377 (MacBookAir9,1). With a WPA3-SAE AP and PMF required on the
BCM4377, the client associates and is removed the same way without being
authorized.

Clear BRCMF_FEAT_FWAUTH on these chips when the board type is Apple, so
the host runs the handshake. A WPA2-PSK AP then works. This also drops
SAE_OFFLOAD_AP, which is not usable on this firmware. A WPA3-SAE AP does
not work without the offload either, the client does not associate.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
Changes in v2:
- Restrict the quirk to Apple boards with settings->board_type
- Drop the BCM4355, due to lack of testers
- Test the BCM4377 as well with SAE_OFFLOAD_AP
- Target wireless-next
- v1: https://lore.kernel.org/all/20261104151629.70790-1-dev@deq.rocks/

The T2 Linux community runs this patch with its kernels, no regression
was reported.

 .../broadcom/brcm80211/brcmfmac/feature.c         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index 27fa3a7941d9..54f61618b9a1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -423,6 +423,21 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
 					BIT(BRCMF_FEAT_WOWL_GTK);
 		}
 	}
+	/* The Apple firmware for these chips lists "idauth", but in AP mode
+	 * it never completes the 4-way handshake or SAE, and the station is
+	 * dropped. Leave the handshake to the host.
+	 */
+	if (drvr->settings->board_type &&
+	    strstarts(drvr->settings->board_type, "apple,")) {
+		switch (drvr->bus_if->chip) {
+		case BRCM_CC_4364_CHIP_ID:
+		case BRCM_CC_4377_CHIP_ID:
+			ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
+			break;
+		default:
+			break;
+		}
+	}
 	/* MBSS does not work for all chips */
 	switch (drvr->bus_if->chip) {
 	case BRCM_CC_4330_CHIP_ID:

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

